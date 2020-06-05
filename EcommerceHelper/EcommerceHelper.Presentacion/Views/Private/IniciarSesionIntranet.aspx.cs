using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class IniciarSesionIntranet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void RealizarLogueo(string elUsuario, string laClave)
        {
            UsuarioEntidad usuario = new UsuarioEntidad();
            usuario.Email = elUsuario;
            usuario.Password = laClave;


            if (!string.IsNullOrEmpty(usuario.Email))
            {
                EtiquetaEmail.Text = "Ingrese el Email";
                EtiquetaEmail.Visible = true;


            }
            else if (!string.IsNullOrEmpty(usuario.Password))
            {

                EtiquetaPassword.Text = "Ingrese la contraseña";
                EtiquetaPassword.Visible = true;
            }
            else
            {
                Response.Redirect("/Views/Public/NuestrosServicios.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (TXTEmail.Text == " ")

            {
                EtiquetaEmail.Text = "Ingrese el Email";
                EtiquetaEmail.Visible = true;


            }
            else if (TXTPassword.Text == " ")
            {

                EtiquetaPassword.Text = "Ingrese la contraseña";
                EtiquetaPassword.Visible = true;
            }



            BLL.UsuarioBLL BLLUsuario = new BLL.UsuarioBLL();
            BLLUsuario.IniciarSesion(TXTEmail.Text, TXTPassword.Text);


            //Response.Redirect("/ Views / Public / NuestrosServicios.aspx");
        }




    }



}
