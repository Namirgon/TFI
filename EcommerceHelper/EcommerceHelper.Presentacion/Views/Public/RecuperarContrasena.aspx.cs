using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SimpleCrypto;
using EcommerceHelper.Funciones.Seguridad;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using EcommerceHelper.BLL.Servicios;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class RecuperarContrasena : System.Web.UI.Page, IObservador
    {
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        UsuarioBLL GestorUsuario = new UsuarioBLL();
        private IdiomaEntidad idioma;
        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx

        public RecuperarContrasena() : base (){

            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx

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
            idioma = new IdiomaEntidad();
            if (!IsPostBack)
            {

                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

                //idioma = (IdiomaEntidad)Session["Idioma"];
                //if (idioma == null)
                //{
                //    idioma = new IdiomaEntidad();
                //    idioma.Descripcion = "es";
                //    Session["Idioma"] = idioma;
                //}
            }
            else
            {
                //idioma.Descripcion = Master.obtenerIdiomaCombo();
               // Session["Idioma"] = idioma;
            }

            //DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlIdioma");
            //if (lblIdioma != null)
            //{
            //    lblIdioma.SelectedValue = idioma.Descripcion;
            //}
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

        }

        protected void BtnRecuperar_Click(object sender, EventArgs e)
        {

            string mail = TXTEmail.Text;

            var usuario = GestorUsuario.BuscarMail(mail);

            string Email = usuario.ToString();
            if ( usuario!=null)
            {

                // genera una contraseña automaticamente
                ICryptoService cryptoService= new PBKDF2();

                // conformada con letras mayusculas y minusculas y un tamaño de 10 caracteres
                // esta contraseña se la voy a mandar al usuario para que pueda entrar
              
                string nuevapassword =  RandomPassword.Generate(10, PasswordGroup.Lowercase, PasswordGroup.Uppercase);

                // y la encriptamos 
                string contraseaencriptada = ServicioSecurizacion.AplicarHash(nuevapassword);
                GestorUsuario.ActualizarPassword(mail, contraseaencriptada);
                EnviarEmail(usuario.Email, nuevapassword);
                Response.Redirect("IniciarSesion.aspx");


            }

            else
            {

                Response.Write("<script>alert('No se encontro el Usuario')</script>");

            }

        }

        public void EnviarEmail(string EmailA, string ContraenaRecuperada)
        {

            string correoAdministrador = ConfigurationManager.AppSettings["correoelectronico"].ToString();
            string contraseniaAdministrador = ConfigurationManager.AppSettings["contraseniacorreo"].ToString();

            string Asunto = "Recuperacion de Contraseña de Servicios de Limpieza Domestica Helper";
            string body = "Su nueva contraseña para ingresar a Helper es : <strong> "+ ContraenaRecuperada + "</strong>";


            // configuraciones SMTP

            var smtp = new SmtpClient();
            {

                smtp.Host = "smtp.gmail.com";
                smtp.Port = 25;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(correoAdministrador, contraseniaAdministrador);
                smtp.Timeout = 200000;


            }
            try
            {
                smtp.Send(correoAdministrador, EmailA, Asunto, body);
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Fallo el mensaje, el correo no se pudo enviar')</script>");
                //throw;

            }
        }
        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
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
                            //string tipo;
                            //tipo = Control.GetType().ToString();
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

    }
}