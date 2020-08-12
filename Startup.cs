using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(_1602967_Milestone1.Startup))]
namespace _202_UserMaintenance
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
