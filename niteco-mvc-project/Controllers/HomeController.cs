namespace niteco_mvc_project.Controllers;

public class HomeController : Controller
{
    public ActionResult Index()
    {
        var tempOrder = new OrderListModel
        {
            ProductName = "prod1",
            CategoryName = "Cat1",
            CustomerName = "Mr Tran",
            OrderDate = DateTime.UtcNow,
            Amount = 100
        };

        return View(new List<OrderListModel> { tempOrder });
    }

    public ActionResult About()
    {
        ViewBag.Message = "Your application description page.";

        return View();
    }

    public ActionResult Contact()
    {
        ViewBag.Message = "Your contact page.";

        return View();
    }

    public ActionResult Error()
    {
        ViewBag.Message = "Don't have permisison error page.";

        return View();
    }

    public ActionResult Login()
    {
        return View();
    }

    public ActionResult CreateOrder()
    {
        return RedirectToRoute("Orders/Create");
    }

    public async Task<IEnumerable<OrderListModel>> GetOrderListByRequestAsync(OrderListModelRequest request)
    {
        var searchString = request.FullTextSearch;
        var pageNumber = request.PageNumber;
        var pageSize = request.PageSize;

        return new List<OrderListModel>();
    }
}