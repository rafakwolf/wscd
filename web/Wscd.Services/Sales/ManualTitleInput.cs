namespace Wscd.Services.Sales;

public sealed class ManualTitleInput
{
    public int PartyId { get; set; }
    public string? Description { get; set; }
    public string? Document { get; set; }
    public DateOnly IssueDate { get; set; }
    public DateOnly DueDate { get; set; }
    public decimal Amount { get; set; }

    internal bool IsValid(decimal maximum) => PartyId > 0 && Description?.Trim().Length is > 0 and <= 160 &&
        (Document?.Trim().Length ?? 0) <= 80 && IssueDate != default && DueDate >= IssueDate &&
        Amount > 0 && Amount <= maximum && decimal.Round(Amount, 2) == Amount;
}
