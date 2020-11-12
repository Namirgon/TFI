using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.DAL.Servicios;
using EcommerceHelper.Entidades;
using EcommerceHelper.Entidades.Servicios;
using EcommerceHelper.Funciones.Seguridad;
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
                //idioma.Descripcion = Master.obtenerIdiomaCombo();
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


            List<string> LisDVHs = new List<string>();

            var VerificarIntegridad = BLLUsuario.GenerarCadenaDVHTablaEntera();

            foreach (var Usuario  in  VerificarIntegridad )
            {

                LisDVHs.Add(DigitoVerificadorH.CarlcularDigitoUsuario(Usuario)); // en la lista esta cada uno de los horizontales calculados nuevamente



            }
            Double Acum = 0;
       
            foreach (var valor in LisDVHs) // por cada valor en la lista de cada digito horizontal lo voy sumando para obtener el vertical
            {
                Acum += Convert.ToDouble(valor);
            }

           
            //Acum = DVHBLL.ConsultarDVH();
           
            DVV SumaDVV = DVVDAL.SelectTablaUsuario();

            double DVVBD = Convert.ToDouble(SumaDVV.dvv); //traigo el digito vertical de la base

            if (Acum == DVVBD)
            {
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
            else if (Acum!=DVVBD)
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('La Base de datos se encuentra corrupta, comuniquese con su Administrador');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "AgregarClickMsj1", sb.ToString(), false);
           
            }

          
          

            
        }    

        public void limpiarCampos()
        {
           TXTEmail.Text = string.Empty;
          TXTPassword.Text = string.Empty;

        }           



    }



}
