using System.Web.Services.Description;

namespace niteco_mvc_project
{
    public class ServiceConfig
    {
        public static void RegisterServices(ServiceCollection services)
        {
            services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(1);//You can set Time
            });
        }
    }
}