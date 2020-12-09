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
    public partial class PaginaMaestraCliente : System.Web.UI.MasterPage, IObservador
    {
        private HttpContext Current = HttpContext.Current;
        private List<IdiomaEntidad> idiomaEntidad;
        IdiomaEntidad IdiomaSeleccionado = new IdiomaEntidad();
        List<MultiIdiomaEntidad> Traducciones = new List<MultiIdiomaEntidad>();
        IdiomaBLL _IdiomaBLL = new IdiomaBLL();
        UsuarioEntidad usuario = new UsuarioEntidad();

        public PaginaMaestraCliente() 
        {
            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx

        }

        //List<MultiIdiomaEntidad> Traducciones; // xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
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

                IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl = IdiomaBLL.GetBLLServicioIdiomaUnico().DevuelverTodosLosTextos(IdiomaSeleccionado.IdIdioma);
                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;
             
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

            IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl = IdiomaBLL.GetBLLServicioIdiomaUnico().DevuelverTodosLosTextos(IdiomaSeleccionado.IdIdioma);

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
        void IObservador.Traducirme()
        {
            ListaResultado.Clear();
            RecorrerControles(this);

            Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

            try
            {

                foreach (Control Control in ListaResultado)
                {
                  
                    string tipo;
                    tipo = Control.GetType().ToString();

                    foreach (var traduccion in Traducciones)
                    {



                        if (Equals(Control.ID, traduccion.NombreDelControl))
                        {
                            //string tipo;
                            //tipo = Control.GetType().ToString();
                            //ESTO SON LOS <a>
                            if (Control is Label lbltradu)
                            {

                                lbltradu.Text = traduccion.Texto;

                            }
                            //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                            else if (Control is TextBox txttradu)
                            {

                                txttradu.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if (Control is IButtonControl ibtntradu)
                            {

                                ibtntradu.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if (Control is LinkButton lbtntradu)
                            {
                                lbtntradu.Text = traduccion.Texto;
                            }

                        }

                    }

                }

            }
            catch (Exception ex)
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


    }
}