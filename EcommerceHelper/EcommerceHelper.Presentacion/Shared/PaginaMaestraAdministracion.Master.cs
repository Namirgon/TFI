using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.BLL.Servicios;
using System.Globalization;
using EcommerceHelper.BLL.Managers;

namespace EcommerceHelper.Presentacion.Shared
{
    public partial class PaginaMaestraAdministracion : System.Web.UI.MasterPage, IObservador
    {

        private List<object> ListaResultado = new List<object>(); //xxxxx
        HttpContext Current = HttpContext.Current; //xxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        private List<IdiomaEntidad> idiomaEntidad;
        IdiomaEntidad IdiomaSeleccionado = new IdiomaEntidad();
        public UsuarioEntidad usuario { get; set; }
        private IdiomaEntidad idioma;
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        IdiomaBLL _IdiomaBLL = new IdiomaBLL();
        public PaginaMaestraAdministracion()
        {

            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }
       
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
                Traducciones = new List<MultiIdiomaEntidad>();

                IdiomaSeleccionado.IdIdioma = Int32.Parse(ddlidioma.SelectedValue);
                //  Current.Session["Traducciones"] = IdiomaBLL.GetBLLServicioIdiomaUnico().DevuelverTodosLosTextos(IdiomaSeleccionado.IdIdioma);
                IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl = IdiomaBLL.GetBLLServicioIdiomaUnico().DevuelverTodosLosTextos(IdiomaSeleccionado.IdIdioma);
                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;
                // Traducciones = (List<MultiIdiomaEntidad>)Current.Session["Traducciones"];
                IdiomaBLL.GetBLLServicioIdiomaUnico().Traducir(IdiomaSeleccionado.IdIdioma);
            }
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
            Response.Redirect("../Public/Default.aspx");
        }

        void IObservador.Traducirme()
        {

            ListaResultado.Clear();
            RecorrerControles(this);



            Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

            try
            {

                foreach (Control Control in ListaResultado)
                {
                    //if (Control.ID == "CerrarSesion")
                    //    Control.ID = Control.ID;
                    //string tipo;
                    //tipo = Control.GetType().ToString();
                    foreach (var traduccion in Traducciones)
                    {



                        if (Equals(Control.ID, traduccion.NombreDelControl))
                        {
                            string tipo;
                            tipo = Control.GetType().ToString();
                            //ESTO SON LOS <a>
                            if (Control is Label lbltradu)
                            {

                                lbltradu.Text = traduccion.Texto;

                            }
                            //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                            else if (Control is TextBox)
                            {

                                var mapeo = (TextBox)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if (Control is IButtonControl)
                            {
                                var mapeo = (IButtonControl)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if ((Control) is LinkButton)
                            {
                                var mapeo = (LinkButton)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            else if (Control is Button)
                            {
                                var mapeo = (Button)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //else if (Control is HttpContext)
                            //{
                            //    var mapeo = (HttpContext)Control;
                            //   mapeo. = traduccion.Texto;
                            //}

                        }

                    }

                }

            }
            catch (Exception es)
            {
                throw;
            }

        }
        private void RecorrerControles(Control pObjetoContenedor)
        {
            foreach (Control Controlobj in pObjetoContenedor.Controls)
            {
                ListaResultado.Add(Controlobj);

                if (Controlobj.Controls.Count > 0)
                {
                    RecorrerControles(Controlobj);
                }

                ListaResultado.Add(Controlobj);
            }
        }

        private void RecorrerDropDown(System.Web.UI.WebControls.DropDownList pMenuStrip)
        {
            ListaResultado.Add(pMenuStrip);
            foreach (System.Web.UI.WebControls.ListItem item in pMenuStrip.Items)
            {
                ListaResultado.Add(item);
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

        protected void ddlidioma_SelectedIndexChanged(object sender, EventArgs e)
        {
            IdiomaSeleccionado.IdIdioma = Int32.Parse(ddlidioma.SelectedValue);

            IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl = IdiomaBLL.GetBLLServicioIdiomaUnico().DevuelverTodosLosTextos(IdiomaSeleccionado.IdIdioma);

            IdiomaBLL.GetBLLServicioIdiomaUnico().Traducir(IdiomaSeleccionado.IdIdioma);

            //IdiomaSeleccionado.IdIdioma = Int32.Parse(ddlidioma.SelectedValue);
            //Current.Session["Idioma"] = IdiomaSeleccionado;
        }
    }
}