using MvcApplication1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
    public class ProductController : Controller
    {
        //
        // GET: /Product/
        public string Get()
        {

            return "hello";
        }
        public ActionResult Index()
        {
            var FootDB = new FootWearDb();
            var p = FootDB.Products.ToList();

            return View(p);
        }
        [HttpPost]
        public ActionResult DeleteProduct()
        {
            int pId = Convert.ToInt32(Request.Form["dpid"]);

            var db = new FootWearDb();
            var m = db.Products.Where(u => u.PId.Equals(pId)).FirstOrDefault();
            db.Products.Remove(m);
            db.SaveChanges();
            var temp = new AdminHomeController();
            if ((Request.Form["mpid"]) == "Index")
            {
                return RedirectToAction("Index", "AdminHome");
            }
            else if ((Request.Form["mpid"]) == "Kids")
            {
                return RedirectToAction("Kids", "AdminHome");
            }
            else if ((Request.Form["mpid"]) == "Men")
            {
                return RedirectToAction("Men", "AdminHome");
            }
            else
            {
                return RedirectToAction("Women", "AdminHome");
            }
        }
        [AllowAnonymous]
        public ActionResult AddProduct()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult InsertProduct(Product model)
        {
            model.PImage = "/Images/" + Request.Form["pic"];
            var FootDB = new FootWearDb();
            FootDB.Products.Add(model);
            FootDB.SaveChanges();
            return RedirectToAction("Index", "AdminHome");
        }
        [HttpPost]
        public ActionResult UpdateProduct()
        {
            int pId = Convert.ToInt32(Request.Form["upid"]);
            var db = new FootWearDb();
            var m = db.Products.Where(u => u.PId.Equals(pId)).FirstOrDefault();
            return View(m);
        }
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Update(Product model)
        {
            model.PId = Convert.ToInt32(Request.Form["pid"]);
            model.PImage = Request.Form["pimg"];
            if (Request.Form["pic"] != "")
            {
                model.PImage = "/Images/" + Request.Form["pic"];
            }
            var db = new FootWearDb();
            var original = db.Products.Find(model.PId);
            if (original != null)
            {
                original.PName = model.PName;
                original.Price = model.Price;
                original.PCategory = model.PCategory;

                original.PImage = model.PImage;

                db.SaveChanges();
            }
            return RedirectToAction("Index", "AdminHome");
        }
    }
}
