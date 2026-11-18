using Microsoft.EntityFrameworkCore;
using Npgsql;

namespace Wscd.Data.Sales;

internal static class SalesPersistence
{
    internal static async Task<bool> LockActiveCashAccountAsync(this WscdDbContext db, Guid organizationId, int accountId) =>
        await db.CashAccounts.FromSql($"""
            SELECT * FROM "CashAccounts"
            WHERE "IDOrganization" = {organizationId} AND "ID" = {accountId}
            FOR SHARE
            """).AsNoTracking().SingleOrDefaultAsync() is { IsInactive: false };

    internal static bool IsWriteConflict(Exception exception) => exception is DbUpdateConcurrencyException ||
        (exception as PostgresException ?? exception.InnerException as PostgresException) is
        {
            SqlState: PostgresErrorCodes.ForeignKeyViolation or PostgresErrorCodes.UniqueViolation or
            PostgresErrorCodes.DeadlockDetected or PostgresErrorCodes.SerializationFailure
        };
}
