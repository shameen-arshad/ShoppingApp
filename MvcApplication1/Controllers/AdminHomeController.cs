using MvcApplication1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
    public class AdminHomeController : Controller
    {
        public ActionResult Index()
        {
            var FootDB = new FootWearDb();
            var p = FootDB.Products.Take(4);
            return View(p);
        }
        public ActionResult Men()
        {
            var FootDB = new FootWearDb();
            var p = FootDB.Products.Where(s => s.PCategory =="Men");
            return View( p);
        }
        public ActionResult Women()
        {
            var FootDB = new FootWearDb();
            var p = FootDB.Products.Where(s => s.PCategory =="Women");

            return View( p);
        }

        public ActionResult Kids()
        {
            var FootDB = new FootWearDb();
            var p = FootDB.Products.Where(s => s.PCategory =="Kids");

            return View( p);
        }
    }
}
