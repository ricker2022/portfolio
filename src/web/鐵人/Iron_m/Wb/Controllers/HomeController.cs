using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Wb.Models;
using Wb.Pager;

namespace Wb.Controllers
{
    [Serializable]
    public class HomeController : FrontendController
    {
        public ActionResult Index()
        {
            return Redirect(Url.RouteUrl("Default", new { controller = "News", action = "index" }));
        }



       


    }
}
