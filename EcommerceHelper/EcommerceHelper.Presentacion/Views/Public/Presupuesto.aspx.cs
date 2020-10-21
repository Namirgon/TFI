using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Presupuesto : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}