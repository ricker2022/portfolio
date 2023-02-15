using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ENmobile.Startup))]
namespace ENmobile
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
