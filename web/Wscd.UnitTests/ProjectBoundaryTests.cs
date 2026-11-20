using System.Reflection;

namespace Wscd.UnitTests;

public sealed class ProjectBoundaryTests
{
    [Fact]
    public void Domain_DoesNotDependOnOtherApplicationLayers()
    {
        var references = Assembly.Load("Wscd.Domain")
            .GetReferencedAssemblies()
            .Select(assembly => assembly.Name);

        Assert.DoesNotContain("Wscd.Services", references);
        Assert.DoesNotContain("Wscd.Data", references);
        Assert.DoesNotContain("Wscd.Web", references);
    }

    [Fact]
    public void Services_DoesNotDependOnOuterLayers()
    {
        var references = Assembly.Load("Wscd.Services")
            .GetReferencedAssemblies()
            .Select(assembly => assembly.Name);

        Assert.DoesNotContain("Wscd.Data", references);
        Assert.DoesNotContain("Wscd.Web", references);
    }
}
