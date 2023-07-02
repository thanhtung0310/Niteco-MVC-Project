namespace niteco_mvc_project.Tests.Controllers;

[TestClass]
public class DefaultControllerTest
{
    [TestMethod]
    public void Index()
    {
        // Arrange
        HomeController controller = new HomeController();

        // Act
        ViewResult result = controller.Index() as ViewResult;

        // Assert
        Assert.IsNotNull(result);
    }
}
