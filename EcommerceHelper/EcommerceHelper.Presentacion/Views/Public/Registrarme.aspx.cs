using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;
using EcommerceHelper.Funciones.Seguridad;
using EcommerceHelper.Entidades.Servicios;
using EcommerceHelper.DAL.Servicios;
using EcommerceHelper.BLL.Servicios;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Registrarme : System.Web.UI.Page , IObservador
    {
        public Registrarme(): base()
        {
            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx

        }

        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        private SexoBLL unManagerSexo = new SexoBLL();
        public List<SexoEntidad> unSexo = new List<SexoEntidad>();


        private TipoDomicilioBLL unManagerTipoDomicilio = new TipoDomicilioBLL();
        public List<TipoDireccionEntidad> unTipoDireccion = new List<TipoDireccionEntidad>();


        private TipoTelefonoBLL unManagerTipoTelefono = new TipoTelefonoBLL();
        public List<TipoTelefonoEntidad> unTipoTelefono = new List<TipoTelefonoEntidad>();

        public UsuarioEntidad unUsuario = new UsuarioEntidad();

        public DireccionEntidad UnaDireccion = new DireccionEntidad();
        private DireccionBLL UnManagerDireccion = new DireccionBLL();
        private UsuarioBLL unManagerUsuario = new UsuarioBLL();

        public List<ProvinciaEntidad> unasProvincias = new List<ProvinciaEntidad>();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                cargarSexo();
                CargarTipoTelefono();
                cargarProvincias();
                cargarLocalidades();
                cargarTipodeDireccion();
                Traducciones = new List<MultiIdiomaEntidad>();
                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

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

        public void cargarTipodeDireccion()
        {
            DDLTipodeDireccion.DataSource = null;
            unTipoDireccion = unManagerTipoDomicilio.SelectALLTipoDomicilio();
            DDLTipodeDireccion.DataSource = unTipoDireccion;
            DDLTipodeDireccion.DataValueField = "IdTipoDireccion";
            DDLTipodeDireccion.DataTextField = "Descripcion";
            DDLTipodeDireccion.DataBind();

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
            // revisa si el usuario ya existe 
            UsuarioEntidad Existe = new UsuarioEntidad();
            string email = txtusuario.Text;
            Existe =  unManagerUsuario.BuscarMail(email);
            if (Existe != null)
            {

                lblMensaje.Visible = true;
                lblMensaje.Text = "El Usuario ya se encuentra registrado";

            }
            else
            {


                try
                {
                    var NroUsuario = 0;
                    if (Page.IsValid)

                    {
                       
                        unUsuario.MiUsuario = new TipoUsuarioEntidad();
                        unUsuario.MiUsuario.IdTipoUsuario = 2; // cliente
                        unUsuario.Email = txtusuario.Text;
                        unUsuario.Password = ServicioSecurizacion.AplicarHash(txtcontrasena.Text);
                        unUsuario.Nombre = txtNombre.Text;
                        unUsuario.Apellido = txtApellido.Text;
                        unUsuario.MiSexo = new SexoEntidad();
                        unUsuario.MiSexo.IdSexo = Int32.Parse(ddSexo.SelectedValue);
                        unUsuario.NumeroDocumento = Int32.Parse(txtDNI.Text);
                        unUsuario.MiTelefono = new TipoTelefonoEntidad();
                        unUsuario.MiTelefono.IdTipoTelefono = Int32.Parse(ddTipoTelefono.SelectedValue);
                        unUsuario.MiDocumento = new TipoDeDocumentoEntidad();
                        unUsuario.MiDocumento.IdTipoDeDocumento = 1;
                        unUsuario.NumeroTelefono = Int32.Parse(txtTelefono.Text);


                        unUsuario.DVH = int.Parse(DigitoVerificadorH.CarlcularDigitoUsuario(unUsuario));

                        // inserta el usuario y trae el IdUsuario del nuevo Usuario creado
                        NroUsuario = unManagerUsuario.RegistrarUsuario(unUsuario);


                        int familia = unUsuario.MiUsuario.IdTipoUsuario = 2; // cliente
                      
                        // Inserto en la tabla FamiliaUsuario el nuevo Cliente
                        unManagerUsuario.InsertFamiliaUsuario(unUsuario.IdUsuario, familia, email);

                        //Direccion
                        UnaDireccion.Calle = txtCalle.Text;
                        UnaDireccion.Numero = Int32.Parse(txtNumero.Text);
                        UnaDireccion.Piso = txtPiso.Text;
                        UnaDireccion.Departamento = txtDepartamento.Text;
                        UnaDireccion.MiProvincia = new ProvinciaEntidad();
                        UnaDireccion.MiProvincia.IdProvincia = Int32.Parse(ddProvincia.SelectedValue);
                        UnaDireccion.MiLocalidad = new LocalidadEntidad();
                        UnaDireccion.MiLocalidad.IdLocalidad = Int32.Parse(ddLocalidad.SelectedValue);
                        UnaDireccion._MiTipoDireccion = new TipoDireccionEntidad();
                        UnaDireccion._MiTipoDireccion.IdTipoDireccion = Int32.Parse(DDLTipodeDireccion.SelectedValue);

                        unManagerUsuario.InsertDireccionDeFacturacion(UnaDireccion, unUsuario);

                        limpiarCampos();
                        EcommerceHelper.Funciones.Seguridad.ServicioLog.CrearLogEventos("Alta usuario", "Alta usuario: " + unUsuario.Apellido, "creado correctamente", (unUsuario.IdUsuario).ToString());

                        DVVBLL managerDVV = new DVVBLL();

                        managerDVV.InsertarDVV("DVV", "Usuario");
                        lblMensaje.Visible = false;
                    }
                    else
                    {


                    }

                }
                catch (Exception ex)
                {
                    EcommerceHelper.Funciones.Seguridad.ServicioLog.CrearLog(ex, "Alta Usuario", unUsuario.Apellido, (unUsuario.IdUsuario).ToString());
                    Response.Redirect("/Shared/ErrorCliente.aspx");

                }
            }
        }
        public void limpiarCampos()
        {
            txtNombre.Text = string.Empty;
            txtApellido.Text = string.Empty;
            txtDNI.Text = string.Empty;
            txtcontrasena.Text = string.Empty;
            ddLocalidad.SelectedIndex = 0;
            ddProvincia.SelectedIndex = 0;
            ddSexo.SelectedIndex = 0;
            ddTipoTelefono.SelectedIndex = 0;
            txtTelefono.Text = string.Empty;
            txtCalle.Text = string.Empty;
            txtNumero.Text = string.Empty;
            txtPiso.Text = string.Empty;
            txtDepartamento.Text = string.Empty;
            txtusuario.Text = string.Empty;
            txtrepetircontrasena.Text = string.Empty;
        }

        protected void txtTelefono_TextChanged(object sender, EventArgs e)
        {

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

                    foreach (var traduccion in Traducciones)
                    {



                        if (Equals(Control.ID, traduccion.NombreDelControl))
                        {
                            string tipo;
                            tipo = Control.GetType().ToString();
                            //ESTO SON LOS <a>
                            if (Control is Label lbltradu)
                            {

                                // var mapeo = (Label)Control;
                                lbltradu.Text = traduccion.Texto;
                                //  mapeo.InnerText = traduccion.Texto;
                            }
                            //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                            else if ((Control) is System.Web.UI.WebControls.TextBox)
                            {

                                var mapeo = (System.Web.UI.WebControls.TextBox)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if ((Control) is System.Web.UI.WebControls.IButtonControl)
                            {
                                var mapeo = (System.Web.UI.WebControls.Button)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if ((Control) is System.Web.UI.WebControls.LinkButton)
                            {
                                var mapeo = (System.Web.UI.WebControls.LinkButton)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            else if ((Control) is System.Web.UI.WebControls.TextBox)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputText)Control;
                                mapeo.Value = traduccion.Texto;
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

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Public/Default.aspx");
        }
    }
}