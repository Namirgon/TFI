using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Entidades;
using EcommerceHelper.Entidades.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class GestionEmpleado : System.Web.UI.Page
    {

        public List<ProvinciaEntidad> unasProvincias = new List<ProvinciaEntidad>();
        private UsuarioBLL unManagerUsuario = new UsuarioBLL();
        public DireccionEntidad UnaDireccion = new DireccionEntidad();
        private DireccionBLL UnManagerDireccion = new DireccionBLL();

        private SexoBLL unManagerSexo = new SexoBLL();
        public List<SexoEntidad> unSexo = new List<SexoEntidad>();
        UsuarioEntidad usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            usuario = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

          
            if (!Page.IsPostBack)
            {
                cargarSexo();
              
                cargarProvincias();
                cargarLocalidades();
                //CargarGrillaEmpleado();


            }
            string nombre = Session["NomUsuario"].ToString();
            // nombre de la patente de la pagina
            string[] unosPermisosTest = new string[] { "GestionEmpleado" };
            if (usuario == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Public/Default.aspx");
            }
        }
        public void cargarProvincias(int? elIndice = null)
        {
            ddProvincia.DataSource = null;
            unasProvincias = unManagerUsuario.SelectALLProvincias();
            ddProvincia.DataSource = unasProvincias;
            ddProvincia.DataValueField = "IdProvincia";
            ddProvincia.DataTextField = "Descripcion";
            ddProvincia.DataBind();
            if (elIndice != null)
                ddProvincia.SelectedIndex = (int)elIndice;
        }

        public void cargarLocalidades()
        {
            ddLocalidad.DataSource = null;
            ddLocalidad.DataSource = unasProvincias.Find(X => X.IdProvincia == (Int32.Parse(ddProvincia.SelectedValue))).misLocalidades;
            ddLocalidad.DataValueField = "IdLocalidad";
            ddLocalidad.DataTextField = "Descripcion";
            ddLocalidad.DataBind();
        }
        protected void ddProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {

            int aux = Int32.Parse(ddProvincia.SelectedValue);
            aux--;
            cargarProvincias(aux);
            cargarLocalidades();


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

        //public void CargarGrillaEmpleado()
        //{
        //   //List<  UsuarioEntidad > var = new  List<UsuarioEntidad>();
        //   //  var=   unManagerUsuario.SelectALLEmpleados();
           
        //   // foreach (var us in var)
        //   // {
        //   //     DireccionEntidad dir = new DireccionEntidad();
        //   //      us.MiDireccion

        //   // }

        //    GVGrillaEmpleado.DataSource = unManagerUsuario.SelectALLEmpleados();

        //    GVGrillaEmpleado.DataBind();
        //}

        protected void GVGrillaEmpleado_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Int32.Parse(GVGrillaEmpleado.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);

          

            usuario = unManagerUsuario.Select(id);

            switch (e.CommandName)
            {              

                case "BtnModificar":
                    {
                        //var IdUsuario = usuario.IdUsuario;  
                        txtNombre.Text = usuario.Nombre;
                        txtApellido.Text = usuario.Apellido;
                        txtDNI.Text = usuario.NumeroDocumento.ToString() ;
                        txtTelefono.Text = usuario.NumeroTelefono.ToString();
                        ddSexo.SelectedValue = usuario.MiSexo.IdSexo.ToString();
                        txtusuario.Text = usuario.Email;                        

                        foreach (var d in usuario.MiDireccion)
                        {
                            //var IdDireccion = d.IdDireccion;
                            txtCalle.Text = d.Calle;
                            txtNumero.Text = d.Numero.ToString();
                            txtPiso.Text = d.Piso.ToString();
                            txtDepartamento.Text = d.Departamento.ToString();
                            UnaDireccion.MiProvincia = new ProvinciaEntidad();
                            ddProvincia.SelectedValue = d.MiProvincia.IdProvincia.ToString();
                            UnaDireccion.MiLocalidad = new LocalidadEntidad();
                            ddLocalidad.SelectedValue = d.MiLocalidad.IdLocalidad.ToString();


                        }

                        break;
                    }
                case "BtnEliminar":

                    {
                        //unManagerUsuario.DeleteEmpleado(id);
                        
                        break;
                    }
            }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

            UsuarioEntidad unUsuario = new UsuarioEntidad();

            // actualizar Empleado
            unUsuario.IdUsuario = unUsuario.IdUsuario;
            unUsuario.Nombre = txtNombre.Text;
            unUsuario.Apellido = txtApellido.Text;
            unUsuario.Email = txtusuario.Text;
            unUsuario.MiSexo = new SexoEntidad();
            unUsuario.MiSexo.IdSexo = Int32.Parse(ddSexo.SelectedValue);
            unUsuario.NumeroDocumento = Int32.Parse(txtDNI.Text);
            unUsuario.NumeroTelefono = Int32.Parse(txtTelefono.Text);
            unUsuario.DVH = int.Parse(DigitoVerificadorH.CarlcularDigitoUsuario(unUsuario));


            unManagerUsuario.UpdateDatosEmpleado(unUsuario);

            DireccionEntidad direccion = new DireccionEntidad(); ;

            // Actualizar Direccion
            UnaDireccion.IdDireccion = direccion.IdDireccion;
            UnaDireccion.Calle = txtCalle.Text;
            UnaDireccion.Numero = Int32.Parse(txtNumero.Text);
            UnaDireccion.Piso = txtPiso.Text;
            UnaDireccion.Departamento = txtDepartamento.Text;
            UnaDireccion.MiProvincia = new ProvinciaEntidad();
            UnaDireccion.MiProvincia.IdProvincia = Int32.Parse(ddProvincia.SelectedValue);
            UnaDireccion.MiLocalidad = new LocalidadEntidad();
            UnaDireccion.MiLocalidad.IdLocalidad = Int32.Parse(ddLocalidad.SelectedValue);
           

            unManagerUsuario.UpdateDireccionEmpleado(UnaDireccion, unUsuario);

            DVVBLL managerDVV = new DVVBLL();

            managerDVV.InsertarDVV("DVV", "Usuario");


            EcommerceHelper.Funciones.Seguridad.ServicioLog.CrearLogEventos("Modificacion Empleado", "Update Empleado: " + unUsuario.Apellido, "modificado correctamente", (unUsuario.IdUsuario).ToString());
            Response.Redirect("/Views/Private/MenuAdministracion.aspx");
        }
    }

      
    
}