using EcommerceHelper.BLL;
using EcommerceHelper.Funciones;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace EcommerceHelper.Presentacion
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
      
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
            new ScriptResourceDefinition
            {
                Path = "~/scripts/jquery-1.8.3.min.js",
                DebugPath = "~/scripts/jquery-1.8.3.js",
                CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js",
                CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.js"
            });
        }
        protected void Session_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta cuando se inicia una nueva sesión

           
        }
            protected void Application_BeginRequest(object sender, EventArgs e)
        {

            //Se activa cuando se recibe una solicitud de aplicación.
            //Es el primer evento que se activa para una solicitud,
            //que a menudo es una solicitud de página(URL) que ingresa un usuario.
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

            //Se activa cuando el módulo de seguridad ha establecido la 
            //identidad del usuario actual como válida.
            //En este punto, se han validado las credenciales del usuario.
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Código que se ejecuta al producirse un error no controlado
        }

        protected void Session_End(object sender, EventArgs e)
        {
            // Código que se ejecuta cuando finaliza una sesión.
            
        }

        protected void Application_End(object sender, EventArgs e)
        {
            //  Código que se ejecuta cuando se cierra la aplicación

        }

    }
}