using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{

    public partial class Facturacion : System.Web.UI.Page
    {
        UsuarioEntidad UsuarioEntidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        List<ComprobanteEntidad> Facturas = new List<ComprobanteEntidad>();
        ComprobanteBLL GestorComprobante = new ComprobanteBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            UsuarioEntidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            

            if (!Page.IsPostBack)
            {
                CargarGrillaFactura();


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

        protected void gvFacturas_DataBound(object sender, EventArgs e)
        {
            gvFacturas.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in gvFacturas.Rows)
            {
                row.Cells[0].Visible = false;

            }
        }
    }

}