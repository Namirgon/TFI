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

    public partial class Facturacion : System.Web.UI.Page, IObservador
    {
        UsuarioEntidad UsuarioEntidad = new UsuarioEntidad();
     
        List<ComprobanteEntidad> Facturas = new List<ComprobanteEntidad>();
        ComprobanteBLL GestorComprobante = new ComprobanteBLL();
        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public Facturacion() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            UsuarioEntidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            

            if (!Page.IsPostBack)
            {
                CargarGrillaFactura();
                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;



            }
            // nombre de la patente de la pagina
            string[] unosPermisosTest = new string[] { "Facturacion" };
            if (UsuarioEntidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Public/Default.aspx");
            }
        }


        public void CargarGrillaFactura()
        {

            Facturas = GestorComprobante.FindAllFacturas();

            gvFacturas.DataSource = Facturas;
            gvFacturas.DataBind();



        }

        protected void gvFacturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Int32.Parse(gvFacturas.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);


            ComprobanteEntidad Factura;
           

            // Busca el IdFactura para traer todos sus datos
            Factura = GestorComprobante.FindComprobante(id);
            switch (e.CommandName)
            {
                
                case "btnVerDetalle":
                    {

                        OrdenDeTrabajoEntidad unaOrden = new OrdenDeTrabajoEntidad();
                        OrdenDeTrabajoBLL gestorODT = new OrdenDeTrabajoBLL();


                        // Busca la OrdenDeTrabajo que figura en la Factura.
                        unaOrden = gestorODT.SelectODT(Factura.MiOrdenDeTrabajo.IdOrdenDeTrabajo);
                      
                         List< ItemOrdenDeTrabajoEntidad> unItem = new List<ItemOrdenDeTrabajoEntidad>();
                         ItemOrdenDeTrabajoBLL GestorItem = new ItemOrdenDeTrabajoBLL();

                        // Busca los Item que pertenecen a la OrdenDeTrabajo
                        unItem = GestorItem.ListaItemSelectAllByIdODT(unaOrden.IdOrdenDeTrabajo);

                        // ventana emergente 

                        DetalleFactura.DataSource = unItem;
                        DetalleFactura.DataBind();



                        break;
                    }
                case "btnGenerarNC":

                    {
                        // Genera comprobante de tipo Nota de Credito = 2 , Sucursal General Rodriguez = 1 , Fecha = hoy


                        ComprobanteEntidad NuevoComprobante = new ComprobanteEntidad();

                        NuevoComprobante.MiTipoComprobante = new TipoComprobanteEntidad();
                        NuevoComprobante.MiTipoComprobante.IdTipoComprobante = 2;
                        NuevoComprobante.MiSucursal = new SucursalEntidad();
                        NuevoComprobante.MiSucursal.IdSucursal = 1;
                        NuevoComprobante.MiOrdenDeTrabajo = new OrdenDeTrabajoEntidad();
                        NuevoComprobante.MiOrdenDeTrabajo.IdOrdenDeTrabajo = Factura.MiOrdenDeTrabajo.IdOrdenDeTrabajo;
                        NuevoComprobante.Fecha = DateTime.Now.Date;

                        ComprobanteBLL GestorComprobante = new ComprobanteBLL();

                        GestorComprobante.RegistrarComprobante(NuevoComprobante);



                        break;

                    }




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
        //protected void gvFacturas_DataBound(object sender, EventArgs e)
        //{
        //    gvFacturas.HeaderRow.Cells[0].Visible = false;
        //    foreach (GridViewRow row in gvFacturas.Rows)
        //    {
        //        row.Cells[0].Visible = false;

        //    }
        //}
    }

}