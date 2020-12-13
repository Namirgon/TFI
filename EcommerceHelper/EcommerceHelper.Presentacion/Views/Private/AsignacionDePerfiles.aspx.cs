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
    public partial class AsignacionDePerfilesaspx : System.Web.UI.Page , IObservador
    {
      List<  UsuarioEntidad >ListEmpleados = new List<UsuarioEntidad> ();
        UsuarioBLL GestorUsuario = new UsuarioBLL();
        List<FamiliaEntidad> ListFamilia = new List<FamiliaEntidad>();
        FamiliaBLL GestorFamilia = new FamiliaBLL();

        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public AsignacionDePerfilesaspx() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                cargarEmpleados();
                cargarFamilias();
                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;


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

        void IObservador.Traducirme()
        {

            ListaResultado.Clear();
            RecorrerControles(this);



            Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

            try
            {

                foreach (Control Control in ListaResultado)
                {
                    //if (Control.ID == "CerrarSesion")
                    //    Control.ID = Control.ID;
                    //string tipo;
                    //tipo = Control.GetType().ToString();
                    foreach (var traduccion in Traducciones)
                    {



                        if (Equals(Control.ID, traduccion.NombreDelControl))
                        {
                            //string tipo;
                            //tipo = Control.GetType().ToString();
                            //ESTO SON LOS <a>
                            if (Control is Label lbltradu)
                            {

                                lbltradu.Text = traduccion.Texto;

                            }
                            //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                            else if (Control is TextBox)
                            {

                                var mapeo = (TextBox)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if (Control is IButtonControl)
                            {
                                var mapeo = (IButtonControl)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if ((Control) is LinkButton)
                            {
                                var mapeo = (LinkButton)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            else if (Control is Button)
                            {
                                var mapeo = (Button)Control;
                                mapeo.Text = traduccion.Texto;
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

                //if ((Controlobj) is System.Web.UI.WebControls.DropDownList)
                //{
                //    RecorrerDropDown(((System.Web.UI.WebControls.DropDownList)Controlobj));
                //}


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