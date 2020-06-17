using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.BLL;
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


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            UsuarioBLL BLLUsuario = new UsuarioBLL();
            UsuarioEntidad usuario = new UsuarioEntidad();
            usuario = BLLUsuario.IniciarSesion(TXTEmail.Text, TXTPassword.Text);

            if (usuario != null)

            {
                Session["NomUsuario"] = usuario.Nombre;
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

    }
             }
    
