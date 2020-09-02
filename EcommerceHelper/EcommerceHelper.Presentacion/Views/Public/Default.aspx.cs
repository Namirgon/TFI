using EcommerceHelper.Entidades;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Default : System.Web.UI.Page
    {
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        private IdiomaEntidad idioma;

        protected void Page_Load(object sender, EventArgs e)
        {
            //usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            //string nombre = Session["NomUsuario"].ToString();


            //if (usuarioentidad == null)
            //    Response.Redirect("Default.aspx");

            idioma = new IdiomaEntidad();
            if (!IsPostBack)
            {
                idioma = (IdiomaEntidad)Session["Idioma"];
                if (idioma == null)
                {
                    idioma = new IdiomaEntidad();
                    idioma.Descripcion = "es";
                    Session["Idioma"] = idioma;
                }
            }
            else
            {
                idioma.Descripcion = Maestra.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }

            DropDownList ddlIdioma = FindControlFromMaster<DropDownList>("ddlIdioma");
            if (ddlIdioma != null)
            {
                ddlIdioma.SelectedValue = idioma.Descripcion;
            }
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];


        }

        protected T FindControlFromMaster<T>(string name) where T : Control
        {
            MasterPage master = this.Master;
            while (master != null)
            {
                T control = master.FindControl(name) as T;
                if (control != null)
                    return control;

                master = master.Master;
            }
            return null;
        }


        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    ArrayList lista = new ArrayList();
        //    string[] archivos = System.IO.Directory.GetFiles(Server.MapPath("../../Content/Image/Carrusel"),"*.jpg");
        //    foreach (string archivo in archivos)
        //    {
        //        lista.Add("/Content/Image/Carrusel/"+ System.IO.Path.GetFileName(archivo));
        //    }
        //    Repeater1.DataSource = lista;
        //    Repeater1.DataBind();
        //}



    }
}