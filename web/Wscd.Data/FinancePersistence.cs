using Microsoft.EntityFrameworkCore;
using Npgsql;
using Wscd.Services.Sales;

namespace Wscd.Data;

internal static class FinancePersistence
{
    internal static async Task<bool> LockActiveCashAccountAsync(this WscdDbContext db, Guid organizationId, int accountId) =>
        await db.CashAccounts.FromSql($"""
            SELECT * FROM "CashAccounts"
            WHERE "IDOrganization" = {organizationId} AND "ID" = {accountId}
            FOR SHARE
            """).AsNoTracking().SingleOrDefaultAsync() is { IsInactive: false };

    internal static async Task<bool> CreateTitleAsync(this WscdDbContext db, object title)
    {
        db.Add(title);
        try
        {
            await db.SaveChangesAsync();
            return true;
        }
        catch (Exception exception) when (IsWriteConflict(exception))
        {
            db.ChangeTracker.Clear();
            return false;
        }
    }

    internal static async Task<TitleSettlement> RecordSettlementAsync(this WscdDbContext db, Guid organizationId,
        int cashAccountId, Func<Task<int>> decreaseBalance, object payment)
    {
        await using var transaction = await db.Database.BeginTransactionAsync();
        try
        {
            if (await decreaseBalance() != 1)
            {
                return TitleSettlement.Conflict;
            }
            if (!await db.LockActiveCashAccountAsync(organizationId, cashAccountId))
            {
                return TitleSettlement.InvalidCashAccount;
            }

            db.Add(payment);
            await db.SaveChangesAsync();
            await transaction.CommitAsync();
            return TitleSettlement.Recorded;
        }
        catch (Exception exception) when (IsWriteConflict(exception))
        {
            db.ChangeTracker.Clear();
            return TitleSettlement.Conflict;
        }
    }

    internal static bool IsWriteConflict(Exception exception) => exception is DbUpdateConcurrencyException ||
        (exception as PostgresException ?? exception.InnerException as PostgresException) is
        {
            SqlState: PostgresErrorCodes.ForeignKeyViolation or PostgresErrorCodes.UniqueViolation or
            PostgresErrorCodes.DeadlockDetected or PostgresErrorCodes.SerializationFailure
        };

    internal static async Task<TitleSettlement> ReverseSettlementAsync(this WscdDbContext db,
        Func<Task<int>> restoreBalance, Func<Task<int>> markReversed)
    {
        await using var transaction = await db.Database.BeginTransactionAsync();
        try
        {
            if (await restoreBalance() != 1 || await markReversed() != 1)
            {
                return TitleSettlement.Conflict;
            }

            await transaction.CommitAsync();
            return TitleSettlement.Recorded;
        }
        catch (Exception exception) when (IsWriteConflict(exception))
        {
            return TitleSettlement.Conflict;
        }
    }
}
