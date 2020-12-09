//using System;
//using System.Collections.Generic;
//using System.Globalization;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using System.Web;

//namespace EcommerceHelper.Funciones
//{
//    public static class IdiomaManager
//    {


//        private const string KEY = "lang";
//        public const string DEFAULT_LANGUAGE = "es";
//        public const string KEY_DICCIONARIO = "dic";
//        private static HttpContext Context { get { return HttpContext.Current; } set { } }



//        /// <summary>
//        /// Cambia el valor de lenguage de la pagina, lo guarda en session y ademas cambia el Culture.
//        /// </summary>
//        /// <param name="language"></param>
//        public static void UpdateCulture(string language = null)
//        {
//            //Guardo Cookie en Session:
//            var lang = !string.IsNullOrEmpty(language)
//                ? language
//                : DEFAULT_LANGUAGE;
//            Context.Session[KEY] = lang.ToLower();

//            //En caso de usar .resx
//            UpdateCultureInfo(lang);

//            UpdateDiccionario(lang);
//        }

//        public static string Translate(this string value)
//        {
//            string translated;
//            return (Cache.Diccionario.TryGetValue(value, out translated)) ? translated : value;
//        }

//        public static void UpdateDiccionario(string language)
//        {
//            Context.Cache[KEY_DICCIONARIO] = Cache.Diccionario = MultiIdiomaManager.UpdateDiccionario(language);
//        }

//        public static void UpdateCultureInfo(string language)
//        {
//            CultureInfo culture = new CultureInfo(language);

//            System.Threading.Thread.CurrentThread.CurrentCulture = culture;
//            System.Threading.Thread.CurrentThread.CurrentUICulture = culture;
//        }
//    }
//}
