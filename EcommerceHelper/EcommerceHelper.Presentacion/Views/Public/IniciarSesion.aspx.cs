using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Funciones.Seguridad;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class IniciarSesion : System.Web.UI.Page, IObservador
    {
        BLL.Managers.FamiliaBLL UnManagerFamilia = new BLL.Managers.FamiliaBLL();
        UsuarioBLL UnServicioFamilia = new UsuarioBLL();
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();

        private List<object> ListaResultado = new List<object>(); //xxxxx
        HttpContext Current = HttpContext.Current; //xxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        IdiomaEntidad IdiomaSeleccionado;
        public IniciarSesion() : base()
        {

            IObservable.AgregarObservador(this);
            //xxxxxxxx copiar en formularios xxxxxxx
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
        protected void Page_Load(object sender, EventArgs e)
        {
            IdiomaSeleccionado = new IdiomaEntidad();
            EcommerceHelper.Presentacion.Shared.PaginaMaestra p = (EcommerceHelper.Presentacion.Shared.PaginaMaestra)this.Master;
            
          //  IdiomaSeleccionado.Descripcion = p.ElegirIdioma();
         //   Session["Idioma"] = IdiomaSeleccionado;
           // IdiomaEntidad idioma = new IdiomaEntidad();

            if (!IsPostBack)
            {
                Traducciones = new List<MultiIdiomaEntidad>();

          
                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;// xxxxxx este solo va en las paginas xxxxx

                //idioma = (IdiomaEntidad)Session["Idioma"];
                //if (idioma == null)
                //{
                //    idioma = new IdiomaEntidad();
                //    idioma.Descripcion = "es";
                //    Session["Idioma"] = idioma;
                //}
                //else
                //{

                //    idioma.Descripcion  = Master.ElegirIdioma();
                //    Session["Idioma"] = idioma;

                //}

            }
         
            //DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlIdioma");
            //if (lblIdioma != null)
            //{
            //    lblIdioma.SelectedValue = idioma.Descripcion;
            //}



        }

        public void RealizarLogueo(string elUsuario, string laClave)
        {
            UsuarioEntidad usuario = new UsuarioEntidad();
            usuario.Email = elUsuario;
            usuario.Password = laClave;


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            UsuarioBLL BLLUsuario = new UsuarioBLL();
            UsuarioEntidad usuario = new UsuarioEntidad();

            usuario.Password = ServicioSecurizacion.AplicarHash(TXTPassword.Text);
            usuario = BLLUsuario.IniciarSesion(TXTEmail.Text, usuario.Password);
            
          

            if (usuario != null)

            {
                usuario.Familia = UnManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(usuario.IdUsuario);
                usuario.Permisos = BLLUsuario.UsuarioTraerPermisos(usuario.Apellido, usuario.IdUsuario );
                Session["NomUsuario"] = usuario.Nombre;
                Session["Usuario"] = usuario;
                ServicioLog.CrearLogEventos("Logueo", "Logueo Correcto", usuario.Apellido , (usuario.IdUsuario).ToString() );
                Response.Redirect("/Views/Public/MenuPrincipal.aspx");
            }
            else
            {
                Response.Write("<script>alert('usuario o clave incorrecta')</script>");
                limpiarCampos();
            }
        }

        public void limpiarCampos()
        {
            TXTEmail.Text = string.Empty;
            TXTPassword.Text = string.Empty;

        }

        protected void lblRegistrarme_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrarme.aspx");
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void recuperarContrasena_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecuperarContrasena.aspx");
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
    
