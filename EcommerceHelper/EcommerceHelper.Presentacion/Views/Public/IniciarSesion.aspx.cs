using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Managers;
using EcommerceHelper.Entidades;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Funciones.Seguridad;
using System.Globalization;
using System.Threading;
using System.Web.Services;
using EcommerceHelper.Presentacion.Shared;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class IniciarSesion : System.Web.UI.Page , IObservador


    {



        BLL.Managers.FamiliaBLL UnManagerFamilia = new BLL.Managers.FamiliaBLL();
        UsuarioBLL UnServicioFamilia = new UsuarioBLL();
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
       
        private IdiomaEntidad idioma;
        private List<object> ListaResultado = new List<object>(); //xxxxx
        HttpContext Current = HttpContext.Current; //xxxx
        List<MultiIdiomaEntidad> Traducciones = new List<MultiIdiomaEntidad>(); // xxxxx


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



         

            Traducciones = (List<MultiIdiomaEntidad>)Current.Session["Traducciones"]; // xxxxxx este solo va en las paginas xxxxx

            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx



        }
        void IObservador.Traducirme()
        {

            RecorrerControles(this);

            Traducciones = (List<MultiIdiomaEntidad>)Current.Session["Traducciones"]; // xxxxxx este solo va en las paginas xxxxx
            try
            {

                foreach (Control Control in ListaResultado)
                {

                    foreach (var traduccion in Traducciones)
                    {



                        if (Equals(Control.ID, traduccion.NombreDelControl))
                        {

                            //ESTO SON LOS <a>
                            if ((Control) is System.Web.UI.HtmlControls.HtmlAnchor)
                            {

                                var mapeo = (System.Web.UI.HtmlControls.HtmlAnchor)Control;
                                mapeo.InnerText = traduccion.Texto;
                            }
                            //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlInputControl)
                            {

                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputText)Control;
                                mapeo.Value = traduccion.Texto;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlButton)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlButton)Control;
                                mapeo.InnerText = traduccion.Texto;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlInputButton)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputButton)Control;
                                mapeo.Value = traduccion.Texto;
                            }
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlInputText)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputText)Control;
                                mapeo.Value = traduccion.Texto;
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

                if ((Controlobj) is System.Web.UI.WebControls.DropDownList)
                {
                    RecorrerDropDown(((System.Web.UI.WebControls.DropDownList)Controlobj));
                }


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
    }
}
    
