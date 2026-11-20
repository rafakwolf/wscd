namespace Wscd.Domain.Organizations;

public sealed class Organization
{
    private Organization() { }

    public Organization(string name)
    {
        Id = Guid.NewGuid();
        Name = name;
        CreatedAtUtc = DateTimeOffset.UtcNow;
    }

    public Guid Id { get; private set; }
    public string Name { get; private set; } = string.Empty;
    public string? OwnerUserId { get; private set; }
    public DateTimeOffset CreatedAtUtc { get; private set; }

    public void SetOwner(string userId) => OwnerUserId = userId;
}
