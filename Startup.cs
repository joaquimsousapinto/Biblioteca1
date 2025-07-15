using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Biblioteca1.Startup))]
namespace Biblioteca1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
