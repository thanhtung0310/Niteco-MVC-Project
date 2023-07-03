using niteco_mvc_project.Helpers;
using niteco_mvc_project.Staffs;
using niteco_mvc_project.UserSession;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace niteco_mvc_project.Controllers
{
    public class UseSessionController : BaseController
    {
        private niteco_test_dbEntities db = new niteco_test_dbEntities();
        //private IHttpContextAccessor _httpContextAccessor;

        public UseSessionController()
        { }

        [HttpPost]
        [AllowAnonymous]
        public async Task<bool> CheckCanLoginOrNotAsync(LoginRequest request)
        {
            if (!string.IsNullOrEmpty(request.UserName) || !string.IsNullOrEmpty(request.Password))
            {
                // FE check (BE return false;)
                return false;
            }

            staff staff = (await db.staffs.ToListAsync()).FirstOrDefault(x => x.user_name == request.UserName);
            if (staff == null)
            {
                return false;
            }

            if (!HMACHelper.VerifyHashSalt(request.Password, staff.password_hash, staff.password_salt))
            {
                //HttpContext.Session.SetString("SessionUserName", staff.user_name);
                //HttpContext.Session.SetString("SessionSuperAdminStatus", staff.is_super_admin);

                return true;
            }

            return false;
        }

        [HttpPost]
        public void ClearSessionAsync()
        {
            HttpContext.Session.Clear();
        }
    }
}