using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class AsignacionDeServicios : System.Web.UI.Page, IObservador
    {
        List<UsuarioEntidad> ListEmpleados = new List<UsuarioEntidad>();
        UsuarioBLL GestorUsuario = new UsuarioBLL();
        UsuarioEntidad usuario;
        List<ComprobanteEntidad> Facturas = new List<ComprobanteEntidad>();
        ComprobanteBLL GestorComprobante = new ComprobanteBLL();
     
        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public AsignacionDeServicios() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            usuario = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            if (!IsPostBack)
            {

                CargarGrillaFactura();
                cargarEmpleados();
                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;




            }
            string[] unosPermisosTest = new string[] { "AsignacionDeServicios" };
            if (usuario == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Public/Default.aspx");
            }
        }

        public void cargarEmpleados()
        {


            ddlEmpleado.DataSource = null;
            ListEmpleados = GestorUsuario.SelectALLEmpleadoDeLimpieza();

            DDLIDEmpleado.DataSource = ListEmpleados.Select(a => a.IdUsuario);
            DDLIDEmpleado.DataBind();
            ddlEmpleado.DataSource = ListEmpleados.Select(a => a.Apellido + ", " + a.Nombre);
            ddlEmpleado.DataBind();


        }

        public void CargarGrillaFactura()
        {

            Facturas = GestorComprobante.FindAllFacturasSinAsignar();

            gvFacturas.DataSource = Facturas;
            gvFacturas.DataBind();



        }
        protected void gvFacturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Int32.Parse(gvFacturas.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);


            ComprobanteEntidad Factura;
            OrdenDeTrabajoEntidad unaOrden = new OrdenDeTrabajoEntidad();
            OrdenDeTrabajoBLL gestorODT = new OrdenDeTrabajoBLL();
            List<ItemOrdenDeTrabajoEntidad> unItem = new List<ItemOrdenDeTrabajoEntidad>();
            ItemOrdenDeTrabajoBLL GestorItem = new ItemOrdenDeTrabajoBLL();



            // Busca el IdFactura para traer todos sus datos
            Factura = GestorComprobante.FindComprobante(id);
            switch (e.CommandName)
            {

                case "btnVerDetalle":
                    {
                   

                        // Busca la OrdenDeTrabajo que figura en la Factura.
                        unaOrden = gestorODT.SelectODT(Factura.MiOrdenDeTrabajo.IdOrdenDeTrabajo);

                       
                        // Busca los Item que pertenecen a la OrdenDeTrabajo
                        unItem = GestorItem.ResumenDeCompra(unaOrden.IdOrdenDeTrabajo);

                        // ventana emergente 

                        DetalleFactura.DataSource = unItem;
                        DetalleFactura.DataBind();

                        break;
                    }
                case "btnSeleccionar":

                    {
                        // recarga el ddlist de usuarios empleados que tienen el mismo idlocalidad que el usuario cliente

                       
                        // Busca la OrdenDeTrabajo que figura en la Factura.
                        unaOrden = gestorODT.SelectODT(Factura.MiOrdenDeTrabajo.IdOrdenDeTrabajo);

                        // Busca los Item que pertenecen a la OrdenDeTrabajo
                        unItem = GestorItem.ResumenDeCompraByIdLocalidad(unaOrden.IdOrdenDeTrabajo);

                        foreach (ItemOrdenDeTrabajoEntidad x in unItem)
                        {
                            int idloc = x.MiDireccion.MiLocalidad.IdLocalidad;
        
                            //busca en la tabla el iddireccion para obtener el idlocalidad


                            ddlEmpleado.DataSource = null;
                           ListEmpleados = GestorUsuario.SelectALLEmpleadoDeLimpiezabyLocalidad(idloc );

                            DDLIDEmpleado.DataSource = ListEmpleados.Select(a => a.IdUsuario);
                            DDLIDEmpleado.DataBind();
                            ddlEmpleado.DataSource = ListEmpleados.Select(a => a.Apellido + ", " + a.Nombre);
                            ddlEmpleado.DataBind();
                        }




                        break;

                    }

                //BtnAsignar
                case "BtnAsignar":
                    {
                        // Busca la OrdenDeTrabajo que figura en la Factura.
                        unaOrden = gestorODT.SelectODT(Factura.MiOrdenDeTrabajo.IdOrdenDeTrabajo);


                        
                            int IdEmpleado = Int32.Parse(DDLIDEmpleado.Items[ddlEmpleado.SelectedIndex].ToString());
                            int IdOdt = unaOrden.IdOrdenDeTrabajo;

                            GestorItem.UsuarioServicioInsert(IdEmpleado, IdOdt);


                        
                        CargarGrillaFactura();

                        break;
                    }

            }


        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {

            //ItemOrdenDeTrabajoEntidad asignarItem = new ItemOrdenDeTrabajoEntidad();

            //asignarItem.MiUsuario = new UsuarioEntidad();
            //asignarItem.MiUsuario.IdUsuario = int.Parse(ddlEmpleado.SelectedValue);
           // asignarItem.IdItemOrdenDeTrabajo =
        }

        protected void DetalleFactura_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            
        }

        protected void DetalleFactura_DataBound(object sender, EventArgs e)
        {
            //DetalleFactura.HeaderRow.Cells[0].Visible = false;

            //DetalleFactura.Rows[0].Visible = false;

        }

        protected void gvFacturas_DataBound(object sender, EventArgs e)
        {
            gvFacturas.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in gvFacturas.Rows)
            {
                row.Cells[0].Visible = false;
                
            }
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

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuAdministracion.aspx");
        }
    }
}