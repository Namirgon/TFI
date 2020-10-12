using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class IniciarSesionIntranet : BasePage
    {

        private IdiomaEntidad idioma;
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        BLL.Managers.FamiliaBLL UnManagerFamilia = new BLL.Managers.FamiliaBLL();

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
                idioma = (IdiomaEntidad)Session["Idioma"];
                if (idioma == null)
                {
                    idioma = new IdiomaEntidad();
                    idioma.Descripcion = "es";
                    Session["Idioma"] = idioma;
                }
            }
            else
            {
                idioma.Descripcion = Master.obtenerIdiomaCombo();
                Session["Idioma"] = idioma;
            }

            DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlIdioma");
            if (lblIdioma != null)
            {
                lblIdioma.SelectedValue = idioma.Descripcion;
            }
            usuarioentidad = (UsuarioEntidad)Session["Usuario"];

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

                usuario.Familia = UnManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(usuario.IdUsuario);
                usuario.Permisos = BLLUsuario.UsuarioTraerPermisos(usuario.Email, usuario.IdUsuario);
                Session["NomUsuario"] = usuario.Nombre;
                Session["Usuario"] = usuario;
                ServicioLog.CrearLogEventos("Logueo", "Logueo Correcto", usuario.Apellido, (usuario.IdUsuario).ToString());

                Response.Redirect("/Views/Private/MenuAdministracion.aspx");
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
