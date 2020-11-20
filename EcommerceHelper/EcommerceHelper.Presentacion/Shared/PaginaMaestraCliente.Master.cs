using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Managers;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Shared
{
    public partial class PaginaMaestraCliente : System.Web.UI.MasterPage
    {
        private HttpContext Current = HttpContext.Current;
        private List<IdiomaEntidad> idiomaEntidad;
        IdiomaEntidad IdiomaSeleccionado = new IdiomaEntidad();
        List<MultiIdiomaEntidad> Traducciones = new List<MultiIdiomaEntidad>();
        IdiomaBLL _IdiomaBLL = new IdiomaBLL();
        UsuarioEntidad usuario = new UsuarioEntidad();
        protected void Page_Load(object sender, EventArgs e)
        {

            usuario = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            try
            {
                string nombre = Session["NomUsuario"].ToString();
                lblNombreUsuario.Text = "  Hola " + nombre;

            }
            catch (Exception ex)
            {

                Response.Redirect("/Views/Public/Default.aspx");
            }
            if (!IsPostBack)
            {
                ElegirIdioma();
                IdiomaSeleccionado.IdIdioma = Int32.Parse(ddlidioma.SelectedValue);
                Session["Traducciones"] = IdiomaBLL.GetBLLServicioIdiomaUnico().DevuelverTodosLosTextos(IdiomaSeleccionado.IdIdioma);
                Traducciones = (List<MultiIdiomaEntidad>)Current.Session["Traducciones"];
                IdiomaBLL.GetBLLServicioIdiomaUnico().Traducir(IdiomaSeleccionado.IdIdioma);
            }

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

        protected void ddlidioma_SelectedIndexChanged1(object sender, EventArgs e)
        {
            IdiomaSeleccionado.IdIdioma = Int32.Parse(ddlidioma.SelectedValue);
            Session["Traducciones"] = _IdiomaBLL.DevuelverTodosLosTextos(IdiomaSeleccionado.IdIdioma);
            Traducciones = (List<MultiIdiomaEntidad>)HttpContext.Current.Session["Traducciones"];
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
                //return usuarioAutenticado.Permisos.Any(X => X.NombreIFamPat == elPermiso);
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


       

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            usuario = new UsuarioEntidad();
            usuario = (UsuarioEntidad)Current.Session["Usuario"];
            if (usuario != null && !string.IsNullOrWhiteSpace(usuario.Apellido))
                ServicioLog.CrearLogEventos("Deslogueo", "Deslogueo Correcto", usuario.Apellido, (usuario.IdUsuario).ToString());
            else
                ServicioLog.CrearLogEventos("Deslogueo", "Deslogueo Correcto", "", (usuario.IdUsuario).ToString());
            Session["Usuario"] = null;
            Session.Abandon();
            Response.Redirect("/Views/Public/Default.aspx");
        }

       
    }
}