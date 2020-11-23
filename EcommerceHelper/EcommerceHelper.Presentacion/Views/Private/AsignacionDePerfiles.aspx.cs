using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Managers;
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
    public partial class AsignacionDePerfilesaspx : System.Web.UI.Page
    {
      List<  UsuarioEntidad >ListEmpleados = new List<UsuarioEntidad> ();
        UsuarioBLL GestorUsuario = new UsuarioBLL();
        List<FamiliaEntidad> ListFamilia = new List<FamiliaEntidad>();
        FamiliaBLL GestorFamilia = new FamiliaBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                cargarEmpleados();
                cargarFamilias();



            }
        }

        public void cargarEmpleados()
        {


            ddlEmpleado.DataSource = null;
            ListEmpleados = GestorUsuario.SelectALLEmpleados();
          
            DDLIDEmpleado.DataSource = ListEmpleados.Select(a => a.IdUsuario);
            DDLIDEmpleado.DataBind();
            ddlEmpleado.DataSource = ListEmpleados.Select(a => a.Apellido + ", " + a.Nombre);
            ddlEmpleado.DataBind();


        }


        public void cargarFamilias()
        {
            ddlFamilia.DataSource = null;
            ListFamilia = GestorFamilia.FamiliaSelectAll();
            ddlFamilia.DataSource = ListFamilia;
            ddlFamilia.DataValueField = "IdFamilia";
            ddlFamilia.DataTextField = "NombreFamilia";
            ddlFamilia.DataBind();

        }




        protected void BtnAceptar_Click1(object sender, EventArgs e)
        {


            int IdUsuario = Int32.Parse(DDLIDEmpleado.Items[ddlEmpleado.SelectedIndex].ToString());
            int IdFamilia = int.Parse(ddlFamilia.SelectedValue);

            UsuarioEntidad unEmpleado = new UsuarioEntidad();
            unEmpleado = GestorUsuario.Select(IdUsuario);

            // calculo nuevo DVH
            unEmpleado.DVH = int.Parse(DigitoVerificadorH.CarlcularDigitoUsuario(unEmpleado));
            unEmpleado.MiUsuario = new TipoUsuarioEntidad();
            unEmpleado.MiUsuario.IdTipoUsuario = IdFamilia;
           
            // Grabo datos actualizados del empleado
            GestorUsuario.UpdateDatosEmpleado(unEmpleado);


            // actualizo taba FamiliaUsuario
            GestorFamilia.UsuarioFamiliaUpdate(IdUsuario, IdFamilia);

            // Actualizo tabla DVV
            DVVBLL managerDVV = new DVVBLL();
            managerDVV.InsertarDVV("DVV", "Usuario");

            cargarEmpleados();
            
        }

        protected void BtnCancelar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("MenuAdministracion.aspx");
        }
    }
}