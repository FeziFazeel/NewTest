using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Epos.Helper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
namespace Epos.Controllers
{
    public class ShopController : Controller
    {
        MyContext db = null;
        public ShopController(MyContext _db)
        {
            db = _db;
        }
        #region Login

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Login(string UserName, string Password)
        {

            User ologin = db.User.Where(m => m.UserName.Equals(UserName) && m.Password.Equals(Password)).FirstOrDefault();
            db.Dispose();
            if (ologin != null)
            {
                JsonConvert.SerializeObject(ologin);
                HttpContext.Session.SetString(Constants.SessionObj.LogedInUser, JsonConvert.SerializeObject(ologin));
                return RedirectToAction(nameof(ShopController.Dashboard));
            }
            else
            {
                ViewBag.Message = "Login Error! Unable to validate user.";
            }
            return View();
        }
        #endregion        

        public IActionResult Dashboard()
        {
            return View();
        }

        #region  Units Of Measurement

        [HttpGet]
        public ActionResult UOM(int Id = 0)
        {
        
            if (HttpContext.Session.GetString(Constants.SessionObj.LogedInUser) != null)
            {
                User OUser = JsonConvert.DeserializeObject<User>(HttpContext.Session.GetString(Constants.SessionObj.LogedInUser));
                IList<Uom> OlistUom = db.Uom.ToList();
                db.Dispose();
                ViewBag.OlistUom = OlistUom;
                if (Id != 0)
                {
                    return View(OlistUom.Where(m => m.Id == Id).FirstOrDefault());
                }
                return View();
            }
            return RedirectToAction(nameof(ShopController.Login));
        }
        [HttpPost]
        public ActionResult UOM(Uom OUom)
        {
            if (HttpContext.Session.GetString(Constants.SessionObj.LogedInUser) != null)
            {
                User OUser = JsonConvert.DeserializeObject<User>(HttpContext.Session.GetString(Constants.SessionObj.LogedInUser));
                MyContext db = null;
                if (ModelState.IsValid)
                {
                    if (OUom.IsNew == true)
                    {
                        OUom.CreatedDate = DateTime.Now;
                        OUom.CreatedBy = OUser.UserName;
                        OUom.Status = 1;
                        db.Uom.Add(OUom);
                        db.SaveChanges();
                        ViewBag.Message = "Succesfully save";
                    }
                    else
                    {
                        OUom.ModifyDate = DateTime.Now;
                        OUom.ModifyBy = OUser.UserName;
                        try
                        {
                                db.Uom.Attach(OUom);
                                var entry = db.Entry(OUom);
                                db.SaveChanges();
                            ViewBag.Message = "Succesfully Update";
                        }
                        catch (Exception ex)
                        {
                            ViewBag.ErrorMessage = "Error ,Please Try Again";
                        }
                    }
                    return RedirectToAction(nameof(ShopController.UOM));

                }
            }
            return RedirectToAction("Login");
        }
        #endregion
        #region  Categories

        [HttpGet]
        public ActionResult CategoryMangement(int Id = 0)
        {
            if (HttpContext.Session.GetString(Constants.SessionObj.LogedInUser) != null)
            {
                User OUser = JsonConvert.DeserializeObject<User>(HttpContext.Session.GetString(Constants.SessionObj.LogedInUser));
                //get all of them from DB
                IList<Category> allCategories = db.Category.ToList();
                ViewBag.categorylist = allCategories;
                db.Dispose();
                if (Id != 0)
                {
                    return View(allCategories.Where(m => m.Id == Id).FirstOrDefault());
                }
                return View();
            }
            return RedirectToAction(nameof(ShopController.Login));
        }

        [HttpPost]
        public ActionResult CategoryMangement(Category OCatagory)
        {
            if (HttpContext.Session.GetString(Constants.SessionObj.LogedInUser) != null)
            {
                User OUser = JsonConvert.DeserializeObject<User>(HttpContext.Session.GetString(Constants.SessionObj.LogedInUser));
                if (ModelState.IsValid)
                {
                    if (OCatagory.IsNew == true)
                    {
                        OCatagory.CreatedDate = DateTime.Now;
                        OCatagory.CreatedBy = OUser.UserName;
                        OCatagory.Status = true;
                        try
                        {
                                db.Category.Add(OCatagory);
                                db.SaveChanges();
                            

                            ViewBag.Message = "Succesfully save";
                        }
                        catch (Exception ex)
                        {
                            ViewBag.ErrorMessage = "Error ,Please Try Again";
                        }
                    }
                    else
                    {
                        OCatagory.ModifyDate = DateTime.Now;
                        OCatagory.ModifyBy = OUser.UserName;
                        try
                        {
                                db.Category.Attach(OCatagory);
                                var entry = db.Entry(OCatagory);
                             //   entry.State = EntityState.Modified;
                                db.SaveChanges();
                            ViewBag.Message = "Succesfully Update";
                        }
                        catch (Exception ex)
                        {
                            ViewBag.ErrorMessage = "Error ,Please Try Again";
                        }
                    }
                    return RedirectToAction(nameof(ShopController.CategoryMangement));
                }
            }
            return RedirectToAction(nameof(ShopController.Login));
        }

        #endregion

        #region Product Mnagement
        [HttpGet]
        public ActionResult AddProduct(int Id = 0)
        {
            if (HttpContext.Session.GetString(Constants.SessionObj.LogedInUser) != null)
            {
                User OUser = JsonConvert.DeserializeObject<User>(HttpContext.Session.GetString(Constants.SessionObj.LogedInUser));
//                MyContext db = new MyContext();
                IList<Category> allCategories = db.Category.ToList();
                ViewBag.categorylist = allCategories;
                if (!Id.Equals(0))
                {
                    ProductCategoryViewModel obj = new ProductCategoryViewModel();
                    obj.objProduct = db.Product.Where(m => m.Id == Id).FirstOrDefault();
                    obj.objProduct.Quantity = float.Parse(obj.objProduct.GetQuantity);
                    return View(obj);
                }
                return View();
            }
            return RedirectToAction("Login");
        }
        [HttpPost]
        public ActionResult AddProduct(ProductCategoryViewModel oProductCategoryViewModel)
        {
            if (HttpContext.Session.GetString(Constants.SessionObj.LogedInUser) != null)
            {
                User OUser = JsonConvert.DeserializeObject<User>(HttpContext.Session.GetString(Constants.SessionObj.LogedInUser));
                ProductCategoryViewModel myList = null;
                if (oProductCategoryViewModel.arraycategories != null)
                {
                    myList = JsonConvert.DeserializeObject<ProductCategoryViewModel>(oProductCategoryViewModel.arraycategories);                  
                }
                if (ModelState.IsValid)
                {
                    if (oProductCategoryViewModel.objProduct.IsNew == true)
                    {
                        oProductCategoryViewModel.objProduct.CreatedDate = DateTime.Now;
                        oProductCategoryViewModel.objProduct.CreatedBy = OUser.UserName;
                        oProductCategoryViewModel.objProduct.Quantity = oProductCategoryViewModel.objProduct.Quantity * (float?)oProductCategoryViewModel.objProduct.PackOf ?? 1;
                        oProductCategoryViewModel.objProduct.Price = oProductCategoryViewModel.objProduct.Price / (float?)oProductCategoryViewModel.objProduct.PackOf ?? 1;
                        oProductCategoryViewModel.objProduct.Status = 1;
                        try
                        {
                                db.Product.Add(oProductCategoryViewModel.objProduct);
                                db.SaveChanges();
                                int id = oProductCategoryViewModel.objProduct.Id;
                                if (myList != null)
                                {
                                    foreach (Relationship item in myList.objRelationship)
                                    {
                                        item.IdProduct = id;
                                        item.CreatedBy = OUser.UserName;
                                        item.CreatedDate = DateTime.Now;
                                        db.Relationship.Add(item);
                                        db.SaveChanges();
                                    }
                                }
                    
                            TempData["Massege"] = "Add/Update Product Successfully.";
                            TempData["MassegeType"] = "Success";
                            return RedirectToAction("ViewProduct");
                        }
                        catch (Exception ex)
                        {
                            TempData["Massege"] = "Add/Update Product Error Please Try Again!.";
                            TempData["MassegeType"] = "Error";
                            return RedirectToAction("ViewProduct");
                        }
                    }
                    else
                    {
                        oProductCategoryViewModel.objProduct.Quantity = oProductCategoryViewModel.objProduct.Quantity * (float?)oProductCategoryViewModel.objProduct.PackOf ?? 1;
                        oProductCategoryViewModel.objProduct.Price = oProductCategoryViewModel.objProduct.Price / (float?)oProductCategoryViewModel.objProduct.PackOf ?? 1;
                        oProductCategoryViewModel.objProduct.ModifyDate = DateTime.Now;
                        oProductCategoryViewModel.objProduct.ModifyBy = OUser.UserName;
                        try
                        {
                                db.Product.Attach(oProductCategoryViewModel.objProduct);
                                var entry = db.Entry(oProductCategoryViewModel.objProduct);
                         //       entry.State = EntityState.Modified;
                                // other changed properties
                                db.SaveChanges();
                                //    db.Product.Add(oProductCategoryViewModel.objProduct);
                                //db.SaveChanges();
                            TempData["Massege"] = "Add/Update Product Successfully.";
                            TempData["MassegeType"] = "Success";
                            return RedirectToAction("ViewProduct");
                        }
                        catch (Exception ex)
                        {
                            TempData["Massege"] = "Error occure! Please Try Again.";
                            TempData["MassegeType"] = "Error";
                            return RedirectToAction("ViewProduct");
                        }


                    }

                }
                return View();
            }
            else
            {
                return RedirectToAction(nameof(ShopController.Login));
            }

        }

    }
}