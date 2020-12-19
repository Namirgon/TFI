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
    public partial class PaginaMaestra : System.Web.UI.MasterPage , IObservador
    {


        //private UsuarioBLL _manager;
        public HttpContext Current = HttpContext.Current;
        public UsuarioEntidad usuario { get; set; }
        private List< IdiomaEntidad > idiomaEntidad;
        IdiomaEntidad IdiomaSeleccionado = new IdiomaEntidad();
        List<MultiIdiomaEntidad> Traducciones;//xxxx
  
        private List<object> ListaResultado = new List<object>(); //xxxxx
        IdiomaBLL _IdiomaBLL = new IdiomaBLL();

        public PaginaMaestra()
        {
           
                IObservable.AgregarObservador(this);
         //xxxxxxxx copiar en formularios xxxxxxx

        }
        protected void Page_Load(object sender, EventArgs e)
         {
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
          
            IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl = IdiomaBLL.GetBLLServicioIdiomaUnico().DevuelverTodosLosTextos(IdiomaSeleccionado.IdIdioma);
         
            IdiomaBLL.GetBLLServicioIdiomaUnico().Traducir(IdiomaSeleccionado.IdIdioma);

            //IdiomaSeleccionado.IdIdioma = Int32.Parse(ddlidioma.SelectedValue);
            //Current.Session["Idioma"] = IdiomaSeleccionado;
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

        void IObservador.Traducirme()
        {
            ListaResultado.Clear();
            RecorrerControles(this);

            Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

            try
            {

                foreach (Control Control in ListaResultado)
                {
                    if (Control.ID == "CerrarSesion")
                        Control.ID = Control.ID;
                    string tipo;
                    tipo = Control.GetType().ToString();

                    foreach (var traduccion in Traducciones)
                    {



                        if (Equals(Control.ID, traduccion.NombreDelControl))
                        {
                            
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
                            else if (Control is Button btntradu)
                            {
                                btntradu.Text = traduccion.Texto;
                            }

                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if (Control is LinkButton lbtntradu)
                            {
                                lbtntradu.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if (Control is IButtonControl ibtntradu)
                            {

                                ibtntradu.Text = traduccion.Texto;
                            }
                           
                            

                        }

                    }

                }

            }
            catch
            {
            }

        }

        private void RecorrerControles(Control pObjetoContenedor)
        {
            foreach (Control Controlobj in pObjetoContenedor.Controls)
            {
                ListaResultado.Add(Controlobj);

                //if ((Controlobj) is System.Web.UI.WebControls.DropDownList)
                //{
                //    RecorrerDropDown(((System.Web.UI.WebControls.DropDownList)Controlobj));
                //}


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