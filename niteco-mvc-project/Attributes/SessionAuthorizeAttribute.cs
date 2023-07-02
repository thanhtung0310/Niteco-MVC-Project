namespace niteco_mvc_project.Attributes;

public class SessionAuthorizeAttribute : AuthorizeAttribute
{
	protected override bool AuthorizeCore(HttpContextBase httpContext)
	{
		return !string.IsNullOrEmpty(httpContext.Session["SessionUserName"]);
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
