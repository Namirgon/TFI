//using EcommerceHelper.Entidades;
//using System;
//using System.Collections.Generic;
//using System.Globalization;
//using System.Linq;
//using System.Threading;
//using System.Web;

//namespace EcommerceHelper.Presentacion
//{
//    public class BasePage: System.Web.UI.Page
//    {


//        protected override void InitializeCulture()
//        {

//            var language = (IdiomaEntidad)HttpContext.Current.Session["Idioma"];
//            //string language = "es";
//            if (language == null)
//            {
//                language = new IdiomaEntidad();
//                language.Descripcion = "es";
//            }

//            //Check if PostBack is caused by Language DropDownList.
//            if (Request.Form["__EVENTTARGET"] != null && Request.Form["__EVENTTARGET"].Contains("ddlIdioma"))
//            {
//                //Set the Language.
//                language.Descripcion = Request.Form[Request.Form["__EVENTTARGET"]];
//            }

//            //Set the Culture.
//            Thread.CurrentThread.CurrentCulture = new CultureInfo(language.Descripcion);
//            Thread.CurrentThread.CurrentUICulture = new CultureInfo(language.Descripcion);
//        }
//    }
//}