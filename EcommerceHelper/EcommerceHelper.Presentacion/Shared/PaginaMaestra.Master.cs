using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using EcommerceHelper.BLL.Managers;

namespace EcommerceHelper.Presentacion.Shared
{
    public partial class PaginaMaestra : System.Web.UI.MasterPage
    {


        private UsuarioBLL _manager;
        private HttpContext Current = HttpContext.Current;
        public UsuarioEntidad usuario { get; set; }
        private List< IdiomaEntidad > idiomaEntidad;
        IdiomaEntidad IdiomaSeleccionado = new IdiomaEntidad();
        List<MultiIdiomaEntidad> Traducciones = new List<MultiIdiomaEntidad>();
        IdiomaBLL _IdiomaBLL = new IdiomaBLL();
        protected void Page_Load(object sender, EventArgs e)
         {
            if (!IsPostBack)
            {
                ElegirIdioma();
                IdiomaSeleccionado.IdIdioma = Int32.Parse(ddlidioma.SelectedValue);
                Session["Traducciones"] = IdiomaBLL.GetBLLServicioIdiomaUnico().DevuelverTodosLosTextos(IdiomaSeleccionado.IdIdioma);
                Traducciones = (List<MultiIdiomaEntidad>)Session["Traducciones"];
                IdiomaBLL.GetBLLServicioIdiomaUnico().Traducir(IdiomaSeleccionado.IdIdioma);
            }
        }

        public void METODO()
        {

        }
        public void ElegirIdioma()
        {

            ddlidioma.Items.Clear();
            ddlidioma.SelectedValue = null;
            idiomaEntidad = _IdiomaBLL.FindAll();
            ddlidioma.DataSource = idiomaEntidad;
            ddlidioma.DataValueField = "IdIdioma";
            ddlidioma.DataTextField = "Descripcion";
            ddlidioma.DataBind();

        }

        protected void ddlidioma_SelectedIndexChanged(object sender, EventArgs e)
        {

            IdiomaSeleccionado.IdIdioma = Int32.Parse(ddlidioma.SelectedValue);
            Session["Traducciones"] = _IdiomaBLL.DevuelverTodosLosTextos(IdiomaSeleccionado.IdIdioma);
            Traducciones = (List<MultiIdiomaEntidad>)Session["Traducciones"];
            IdiomaBLL.GetBLLServicioIdiomaUnico().Traducir(IdiomaSeleccionado.IdIdioma);


        }
        
        public bool Autenticar(string elPermiso)
        {
            UsuarioEntidad usuarioAutenticado = new UsuarioEntidad();
            usuarioAutenticado = (UsuarioEntidad)Current.Session["Usuario"];

            string[] PermisosPagina = { elPermiso };

            if (usuarioAutenticado != null)
            {
                if (usuarioAutenticado.Permisos.Exists(x => x.NombreIFamPat == elPermiso))
                    return true;
                if (FamiliaBLL.BuscarPermiso(usuarioAutenticado.Permisos, PermisosPagina))
                    return true;
        
            }
            return false;

        }
        public bool Autenticar(string[] losPermisosARevisar)
        {
            UsuarioEntidad usuarioAutenticado = new UsuarioEntidad();
            usuarioAutenticado = (UsuarioEntidad)Current.Session["Usuario"];


            if (usuarioAutenticado != null)
            {
                foreach (string unTag in losPermisosARevisar)
                {
                    if (usuarioAutenticado.Permisos.Exists(x => x.NombreIFamPat == unTag))
                        return true;
                }

                return FamiliaBLL.BuscarPermiso(usuarioAutenticado.Permisos, losPermisosARevisar);
            }
            return false;

        }

    }
}