using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.Entidades;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class IniciarSesion : System.Web.UI.Page
    {

        //DAL.NuevaConexion cn = new DAL.NuevaConexion();
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        public void RealizarLogueo(string elUsuario, string laClave)
        {
            UsuarioEntidad usuario = new UsuarioEntidad();
            usuario.Email = elUsuario;
            usuario.Password = laClave;

            //if (TXTEmail.Text == "")
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

            //if (!string.IsNullOrEmpty(usuario.Email))
            //{
            //usuario.Familia = unManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(usuario.IdUsuario);
            //Session["Usuario"] = usuario;
            ////Session["Permiso"] = unaFamilia.IdFamilia;
            //SetUsuarioLogueado(usuario.NombreUsuario);

            //CargarListaDeseosEnSession();

            //    if (usuario.IdUsuarioTipo == 2)
            //    {
            //        divLinkIntranet.Visible = true;
            //        Response.Redirect("/Areas/Intranet/Forms/ordenespedido.aspx");
            //    }

            //    Response.Redirect(Request.RawUrl);
            //}
            //else
            //{
            //    MensajeError.InnerText = "Usuario no registrado!";
            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string usuario = TXTEmail.Text;
            //string clave = TXTPassword.Text;
            BLL.UsuarioBLL BLLUsuario = new BLL.UsuarioBLL();
            //UsuarioEntidad usu = new UsuarioEntidad();
            BLLUsuario.IniciarSesion(TXTEmail.Text, TXTPassword.Text);
        
            //usu.Email = usuario;
            //usu.Password = clave;

        
            //string Consulta = BLLUsuario.IniciarSesion(usuario, clave);


            if (TXTEmail.Text == "")

            {
                EtiquetaEmail.Text = "Ingrese el Email";
                EtiquetaEmail.Visible = true;


            }
            else if (TXTPassword.Text == "")
                    {

                EtiquetaPassword.Text = "Ingrese la contraseña";
                EtiquetaPassword.Visible = true;
            } 

        }
    }
}