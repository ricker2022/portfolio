using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ENsite.Controllers
{
    public class DefaultController : Controller
    {
        //
        // GET: /Default/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AboutUs()
        {
            return View();
        }
        public ActionResult Announcement()
        {
            return View();
        }
        public ActionResult Promotions()
        {
            return View();
        }
        public ActionResult GameIntro()
        {
            return View();
        }
        public ActionResult ContactUs()
        {
            return View();
        }
    }
}
