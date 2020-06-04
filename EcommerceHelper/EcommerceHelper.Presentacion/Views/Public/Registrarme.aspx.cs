using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Registrarme : System.Web.UI.Page
    {
        private SexoBLL unManagerSexo = new SexoBLL();
        public List<SexoEntidad> unSexo = new List<SexoEntidad>();

        private TipoTelefonoBLL  unManagerTipoTelefono= new TipoTelefonoBLL();
        public List<TipoTelefonoEntidad> unTipoTelefono = new List<TipoTelefonoEntidad>();

        public UsuarioEntidad unUsuario = new UsuarioEntidad();
        private UsuarioEntidad unManagerUsuario = new UsuarioEntidad();
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarSexo();
            CargarTipoTelefono();
        }

        public void cargarSexo()
        {
            ddSexo.DataSource = null;
            unSexo = unManagerSexo.SelectALLSexos();
            ddSexo.DataSource = unSexo;
            ddSexo.DataValueField = "IdSexo";
            ddSexo.DataTextField = "Descripcion";
            ddSexo.DataBind();
          
        }

        public void CargarTipoTelefono()
        {
            ddTipoTelefono.DataSource = null;
            unTipoTelefono = unManagerTipoTelefono.SelectALLTipoTelefono();
            ddTipoTelefono.DataSource = unTipoTelefono;
            ddTipoTelefono.DataValueField = "IdTipoTelefono";
            ddTipoTelefono.DataTextField = "Descripcion";
            ddTipoTelefono.DataBind();

        }

        protected void BtnContinuar_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)

            {
                unUsuario.Email = txtusuario.Text;
                unUsuario.Password = txtcontrasena.Text;
                unUsuario.Nombre = txtNombre.Text;
                unUsuario.Apellido = txtApellido.Text;
                unUsuario.MiSexo.IdSexo = ddSexo.SelectedIndex + 1;
                unUsuario.NumeroDocumento = Int32.Parse( txtDNI.Text);
                unUsuario.MiTelefono.IdTipoTelefono = ddTipoTelefono.SelectedIndex + 1;
                unUsuario.NumeroTelefono = Int32.Parse(txtTelefono.Text);


                //unManagerUsuario.RegistrarUsuario(unUsuario);

            }


        }
    }
}