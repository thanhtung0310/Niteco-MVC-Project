using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace niteco_mvc_project.Attributes
{
    public class SessionAuthorizeAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            return httpContext.Session["SessionUserName"] != null;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new RedirectToRouteResult(
                                  new RouteValueDictionary
                                  {
                                   { "action", "Error" },
                                   { "controller", "Home" }
                                  });
        }
    }
}