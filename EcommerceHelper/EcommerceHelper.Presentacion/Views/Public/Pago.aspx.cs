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

   
    public partial class Pago : System.Web.UI.Page, IObservador
    {
        TarjetaBLL GestorTarjeta = new TarjetaBLL();
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public Pago() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!this.IsPostBack)
            {
                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

                CargarTarjetas();
                
            }
        }
        public void CargarTarjetas()
        {

            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            int numeroIdUsuario = logueadoStatic.IdUsuario;

            List<TarjetaEntidad> MisTarjetas = new List<TarjetaEntidad>();


            MisTarjetas = GestorTarjeta.ListarTarjetas(numeroIdUsuario);
            if (MisTarjetas.Count== 0)
            {
                Response.Redirect("ABMTarjetasDeCredito.aspx");

            }
            else { 

            GVTarjetas.DataSource = null;
            GVTarjetas.DataSource = MisTarjetas;
            GVTarjetas.DataBind();
            }


        }

        protected void btnAMBTarjeta_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMTarjetasDeCredito.aspx");
        }

        protected void GVTarjetas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Int32.Parse(GVTarjetas.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);



            TarjetaEntidad unaTarjeta;
            unaTarjeta = GestorTarjeta.Find(id);
            int NumeroComprobante = 0;
            switch (e.CommandName)
            {
               
                case "btnSeleccionar":
                    {
                        UsuarioEntidad logueadoStatic;
                        logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
                        OrdenDeTrabajoBLL OrdenByIdUsuario = new OrdenDeTrabajoBLL();

                        OrdenDeTrabajoBLL EstadoActivo = new OrdenDeTrabajoBLL();
                        OrdenDeTrabajoEntidad OrdenDeTrabajo;

                        int numeroIdUsuario = logueadoStatic.IdUsuario;

                        // lista 1 = consulta las ordenes de compras activas por el IdUsuario
                        OrdenDeTrabajo = OrdenByIdUsuario.OrdenDeTrabajoActivas(numeroIdUsuario);


                        // Ingreso estado Finalizado / cerrado Orden de Trabajo
                         EstadoActivo.OrdenDeTrabajoUpdate(OrdenDeTrabajo );

                        ReciboBLL GestorRecibo = new ReciboBLL();
                        ReciboEntidad elPago = new ReciboEntidad();
                        List<ItemOrdenDeTrabajoEntidad> ItemServicios;
                        List<ItemOrdenDeTrabajoEntidad> ItemServicios2;
                        ItemOrdenDeTrabajoBLL GestorItemODT = new ItemOrdenDeTrabajoBLL();

                        //lista 2 = consulta a la tabla lista de deseos con el IdUsuario los IdServicios
                        ItemServicios = GestorItemODT.ResumenDeCompra(OrdenDeTrabajo.IdOrdenDeTrabajo);

                        decimal suma = 0;
                        foreach (ItemOrdenDeTrabajoEntidad item in ItemServicios)
                        {

                            suma += item.Precio;


                        }

                        // Items que conforman el comprobante del pago. Recibo
                        elPago.MiOrdenDeTrabajo = new OrdenDeTrabajoEntidad();
                        elPago.MiOrdenDeTrabajo.IdOrdenDeTrabajo = OrdenDeTrabajo.IdOrdenDeTrabajo;
                        elPago.MiFormaDePago = new FormaDePagoEntidad();
                        elPago.MiFormaDePago.IdFormaDePago = 2;
                        elPago.Importe = suma;
                        
                        GestorRecibo.RegistrarPago(elPago);

                        // WebServices que a traves de un ramdon simula el rechazo o aceptacion del pago
                        GestorRecibo.PagarOrdenDeTrabajo(unaTarjeta.NumeroTarjeta.ToString(), unaTarjeta.CodigoSeguridad, suma);

                        // Genera comprobante de tipo Factura = 1 , Sucursal General Rodriguez = 1 , Fecha = hoy

                        
                        ComprobanteEntidad NuevoComprobante = new ComprobanteEntidad();

                        NuevoComprobante.MiTipoComprobante = new TipoComprobanteEntidad();
                        NuevoComprobante.MiTipoComprobante.IdTipoComprobante = 1;
                        NuevoComprobante.MiSucursal = new SucursalEntidad();
                        NuevoComprobante.MiSucursal.IdSucursal = 1;
                        NuevoComprobante.MiOrdenDeTrabajo = new OrdenDeTrabajoEntidad();
                        NuevoComprobante.MiOrdenDeTrabajo.IdOrdenDeTrabajo = OrdenDeTrabajo.IdOrdenDeTrabajo;
                        NuevoComprobante.Fecha =  DateTime.Now.Date;

                        ComprobanteBLL GestorComprobante = new ComprobanteBLL();

                        NumeroComprobante=  GestorComprobante.RegistrarComprobante(NuevoComprobante);


                        //lista  = consulta a la tabla lista de deseos con el IdOrdenDeTrabajo
                        ItemServicios2 = GestorItemODT.ListaItemSelectAllByIdODT2(OrdenDeTrabajo.IdOrdenDeTrabajo);


                        // Genera por cada Item un detalle comprobante de tipo Factura = 1 , Sucursal General Rodriguez = 1 

                        foreach (ItemOrdenDeTrabajoEntidad item in ItemServicios2)
                        {
                            int SucursalGralRod = 1;
                            int CompFactura = 1;


                            DetalleComprobanteEntidad NuevoDetalleComprobante = new DetalleComprobanteEntidad();

                            NuevoDetalleComprobante.MiComprobante = new ComprobanteEntidad();
                            NuevoDetalleComprobante.MiComprobante.IdComprobante = NuevoComprobante.IdComprobante;
                            NuevoComprobante.MiTipoComprobante = new TipoComprobanteEntidad();
                            NuevoComprobante.MiTipoComprobante.IdTipoComprobante = CompFactura;
                            NuevoComprobante.MiSucursal = new SucursalEntidad();
                            NuevoComprobante.MiSucursal.IdSucursal = SucursalGralRod;
                            NuevoDetalleComprobante.MiServicio = new ServicioEntidad();
                            NuevoDetalleComprobante.MiServicio.IdServicio = item.MiServicio.IdServicio ;
                            NuevoDetalleComprobante.PrecioUnitario = item.Precio;

                            GestorComprobante.RegistrarDetalle(NuevoDetalleComprobante);

                        }

                        lblMensaje.Visible = true;
                        lblMensaje.Text = " 'Pago Exitoso !! Felicitaciones!! '";
                        
                      //  Response.Write("<script>alert('Pago Exitoso !! Felicitaciones!! ')</script>");

                        break;
                    }
                       
            }

            //Response.Write("<script>alert('El paso fue rechazado, intente nuevamente ')</script>");

        }

        protected void GVTarjetas_DataBound(object sender, EventArgs e)
        {
            GVTarjetas.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in GVTarjetas.Rows)
            {
                row.Cells[0].Visible = false;
            }
            GVTarjetas.HeaderRow.Cells[5].Visible = false;
            foreach (GridViewRow row in GVTarjetas.Rows)
            {
                row.Cells[5].Visible = false;
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