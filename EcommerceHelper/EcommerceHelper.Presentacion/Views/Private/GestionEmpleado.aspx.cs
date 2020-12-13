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
    public partial class GestionEmpleado : System.Web.UI.Page , IObservador
    {

        public List<ProvinciaEntidad> unasProvincias = new List<ProvinciaEntidad>();
        private UsuarioBLL unManagerUsuario = new UsuarioBLL();
        public DireccionEntidad UnaDireccion = new DireccionEntidad();
        private DireccionBLL UnManagerDireccion = new DireccionBLL();

        private SexoBLL unManagerSexo = new SexoBLL();
        public List<SexoEntidad> unSexo = new List<SexoEntidad>();
        UsuarioEntidad usuario;
        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public GestionEmpleado() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }

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
                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;


            }
            string nombre = Session["NomUsuario"].ToString();
            // nombre de la patente de la pagina
            string[] unosPermisosTest = new string[] { "GestionEmpleado" };
            if (usuario == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Private/MenuAdministracion.aspx");
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

                case "btnModificar":
                    {
                        hfModificar.Value  = usuario.IdUsuario.ToString();  
                        txtNombre.Text = usuario.Nombre;
                        txtApellido.Text = usuario.Apellido;
                        txtDNI.Text = usuario.NumeroDocumento.ToString() ;
                        txtTelefono.Text = usuario.NumeroTelefono.ToString();
                        ddSexo.SelectedValue = usuario.MiSexo.IdSexo.ToString();
                        txtusuario.Text = usuario.Email;                        

                        foreach (var d in usuario.MiDireccion)
                        {
                             hfDireccion.Value = d.IdDireccion.ToString();
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

                case "btnGuardar":
                    {


                        // actualizar Empleado
                        usuario.IdUsuario = Int32.Parse(hfModificar.Value);
                        usuario.Nombre = txtNombre.Text;
                        usuario.Apellido = txtApellido.Text;
                        usuario.Email = txtusuario.Text;
                        usuario.MiSexo = new SexoEntidad();
                        usuario.MiSexo.IdSexo = Int32.Parse(ddSexo.SelectedValue);
                        usuario.NumeroDocumento = Int32.Parse(txtDNI.Text);
                        usuario.NumeroTelefono = Int32.Parse(txtTelefono.Text);
                        usuario.DVH = int.Parse(DigitoVerificadorH.CarlcularDigitoUsuario(usuario));


                        unManagerUsuario.UpdateDatosEmpleado2(usuario);

                        DireccionEntidad direccion = new DireccionEntidad(); 
               

                        // Actualizar Direccion
                        UnaDireccion.IdDireccion = Int32.Parse( hfDireccion.Value);
                       
                        UnaDireccion.Calle = txtCalle.Text;
                        UnaDireccion.Numero = Int32.Parse(txtNumero.Text);
                        UnaDireccion.Piso = txtPiso.Text;
                        UnaDireccion.Departamento = txtDepartamento.Text;
                        UnaDireccion.MiProvincia = new ProvinciaEntidad();
                        UnaDireccion.MiProvincia.IdProvincia = Int32.Parse(ddProvincia.SelectedValue);
                        UnaDireccion.MiLocalidad = new LocalidadEntidad();
                        UnaDireccion.MiLocalidad.IdLocalidad = Int32.Parse(ddLocalidad.SelectedValue);


                        unManagerUsuario.UpdateDireccionEmpleado(UnaDireccion);

                        DVVBLL managerDVV = new DVVBLL();

                        managerDVV.InsertarDVV("DVV", "Usuario");


                        EcommerceHelper.Funciones.Seguridad.ServicioLog.CrearLogEventos("Modificacion Empleado", "Update Empleado: " + usuario.Apellido, "modificado correctamente", (usuario.IdUsuario).ToString());
                        Response.Redirect("/Views/Private/MenuAdministracion.aspx");

                        break;
                    }
                case "BtnEliminar":

                    {
                        //unManagerUsuario.DeleteEmpleado(id);
                        
                        break;
                    }
            }

        }

        //protected void btnModificar_Click(object sender, EventArgs e)
        //{

        //    UsuarioEntidad unUsuario = new UsuarioEntidad();

        //    // actualizar Empleado
        //    unUsuario.IdUsuario = unUsuario.IdUsuario;
        //    unUsuario.Nombre = txtNombre.Text;
        //    unUsuario.Apellido = txtApellido.Text;
        //    unUsuario.Email = txtusuario.Text;
        //    unUsuario.MiSexo = new SexoEntidad();
        //    unUsuario.MiSexo.IdSexo = Int32.Parse(ddSexo.SelectedValue);
        //    unUsuario.NumeroDocumento = Int32.Parse(txtDNI.Text);
        //    unUsuario.NumeroTelefono = Int32.Parse(txtTelefono.Text);
        //    unUsuario.DVH = int.Parse(DigitoVerificadorH.CarlcularDigitoUsuario(unUsuario));


        //    unManagerUsuario.UpdateDatosEmpleado(unUsuario);

        //    DireccionEntidad direccion = new DireccionEntidad(); ;

        //    // Actualizar Direccion
        //    UnaDireccion.IdDireccion = direccion.IdDireccion;
        //    UnaDireccion.Calle = txtCalle.Text;
        //    UnaDireccion.Numero = Int32.Parse(txtNumero.Text);
        //    UnaDireccion.Piso = txtPiso.Text;
        //    UnaDireccion.Departamento = txtDepartamento.Text;
        //    UnaDireccion.MiProvincia = new ProvinciaEntidad();
        //    UnaDireccion.MiProvincia.IdProvincia = Int32.Parse(ddProvincia.SelectedValue);
        //    UnaDireccion.MiLocalidad = new LocalidadEntidad();
        //    UnaDireccion.MiLocalidad.IdLocalidad = Int32.Parse(ddLocalidad.SelectedValue);
           

        //    unManagerUsuario.UpdateDireccionEmpleado(UnaDireccion);

        //    DVVBLL managerDVV = new DVVBLL();

        //    managerDVV.InsertarDVV("DVV", "Usuario");


        //    EcommerceHelper.Funciones.Seguridad.ServicioLog.CrearLogEventos("Modificacion Empleado", "Update Empleado: " + unUsuario.Apellido, "modificado correctamente", (unUsuario.IdUsuario).ToString());
        //    Response.Redirect("/Views/Private/MenuAdministracion.aspx");
        //}

        protected void GVGrillaEmpleado_DataBound(object sender, EventArgs e)
        {
            GVGrillaEmpleado.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in GVGrillaEmpleado.Rows)
            {
                row.Cells[0].Visible = false;
            }
            GVGrillaEmpleado.HeaderRow.Cells[7].Visible = false;
            foreach (GridViewRow row in GVGrillaEmpleado.Rows)
            {
                row.Cells[7].Visible = false;
            }
        }
    

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Private/MenuAdministracion.aspx");
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