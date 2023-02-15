using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Wb.Models;
using Autofac;

namespace Wb
{
    // 注意: 如需啟用 IIS6 或 IIS7 傳統模式的說明，
    // 請造訪 http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {

        protected void Application_Start()
        {

            // 只保留 RazorViewEngine 可以提昇執行速度
            ViewEngines.Engines.Clear();    // 全部清除
            ViewEngines.Engines.Add(new RazorViewEngine()); // 加入 RazorViewEngine
            // 還需要 WebFormViewEngine 可以再加回去，但是搜尋順序不一樣了
            ViewEngines.Engines.Add(new WebFormViewEngine());

            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }



        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {

            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(null, "connector", new { controller = "ElFinder", action = "Index" });
            routes.MapRoute(null, "Thumbnails/{tmb}", new { controller = "ElFinder", action = "Thumbs", tmb = UrlParameter.Optional });
            //routes.IgnoreRoute("elfinder.connector");


            routes.MapRoute(
                "Default",
                "{game}/{controller}/{action}",
                new { game = "SCII", controller = "News", action = "Index" },
                new[] { "Wb.Controllers" }
            );







        }
    }
}