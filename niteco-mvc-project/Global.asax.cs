using niteco_mvc_project.Middlewares;

namespace niteco_mvc_project
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

		protected void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory fac)
		{
            // implement middlewares
            app.UseMiddleware<ErrorLoggingMiddleware>();
        }
	}
}
