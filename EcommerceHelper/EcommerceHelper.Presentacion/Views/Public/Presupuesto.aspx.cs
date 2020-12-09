using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Public 
{
    public partial class Presupuesto : System.Web.UI.Page, IObservador
    {
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx

        public Presupuesto() : base()
        {

            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Traducciones = new List<MultiIdiomaEntidad>(); //xxxxxxxx copiar en formularios xxxxxxx

            Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl; //xxxxxxxx copiar en formularios xxxxxxx

        }



        protected void Enviar_Click(object sender, EventArgs e)
        {

            // nuestro variable mensage
            string nombre = txtnombre.Value;
            string apellido = txtapellidos.Value;
            string email = txtemail.Value;
            string calle = txtcalle.Value;
            string altura = txtaltura.Value;
            string piso = txtpiso.Value;
            string mensaje = txttexto.Value;

            // mensaje
            mensaje = "Hola Natalia:Mensaje de tu pagina " + Environment.NewLine + "Nombres: " + nombre + Environment.NewLine + "Apellido: " + apellido + Environment.NewLine + "Email: " + email + Environment.NewLine + "Calle:" + calle + Environment.NewLine + "Numero: " + altura + Environment.NewLine + "Piso: " + piso + Environment.NewLine + "Mensaje: " + mensaje;

            //configuracion de nuestro correo 
            System.Net.Mail.MailMessage correo = new System.Net.Mail.MailMessage();
            correo.From = new System.Net.Mail.MailAddress(email);
            //direccion de remitente
            correo.To.Add("servicioshelper333@gmail.com");
            string s = "Presupuesto";
            //Asunto de mensaje
            correo.Subject = s;
            // el cuerpo de nuestro mensaje
            correo.Body = mensaje;
            // si no queremos que el correo no sea en html ponemos false en este caso
            correo.IsBodyHtml = false;
            //Prioridad de mensaje en este caso es suma inportancia si queremos normal..asignas normal

            correo.Priority = System.Net.Mail.MailPriority.Normal;
            // credenciales para  conectar con el servidor de Gmail
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("smtp.gmail.com", 25);
            // ASIGNAS TU CREDENCIAL DE HOTMAIL..Y CONTRASEÑA
            smtp.Credentials = new System.Net.NetworkCredential("servicioshelper333@gmail.com", "helper2023");
            smtp.EnableSsl = true;
            try
            {
                // Y ASIGNAMOS EL EMVIO
                smtp.Send(correo);
                Limpiarcampos();
                // SI ALGO PASA NOS MUESTRA UN MENSAJE


            }
            catch (Exception ex)
            {
                throw ex;

            }

            Response.Redirect("Default.aspx");
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    
        public void Limpiarcampos()
        {

             txtnombre.Value= string.Empty;
             txtapellidos.Value =string.Empty ;
             txtemail.Value = string.Empty;
             txtcalle.Value = string.Empty;
             txtaltura.Value = string.Empty;
             txtpiso.Value = string.Empty;
             txttexto.Value = string.Empty;




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

                                // var mapeo = (Label)Control;
                                lbltradu.Text = traduccion.Texto;
                                //  mapeo.InnerText = traduccion.Texto;
                            }
                            //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                            else if ((Control) is System.Web.UI.WebControls.TextBox)
                            {

                                var mapeo = (System.Web.UI.WebControls.TextBox)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if ((Control) is System.Web.UI.WebControls.IButtonControl)
                            {
                                var mapeo = (System.Web.UI.WebControls.Button)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if ((Control) is System.Web.UI.WebControls.LinkButton)
                            {
                                var mapeo = (System.Web.UI.WebControls.LinkButton)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            else if ((Control) is System.Web.UI.WebControls.TextBox)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputText)Control;
                                mapeo.Value = traduccion.Texto;
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