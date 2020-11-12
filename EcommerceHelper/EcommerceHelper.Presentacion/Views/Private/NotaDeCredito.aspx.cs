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
    public partial class NotaDeCredito : System.Web.UI.Page
    {

        UsuarioEntidad UsuarioEntidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        List<ComprobanteEntidad> NotasDeCredito = new List<ComprobanteEntidad>();
        ComprobanteBLL GestorComprobante = new ComprobanteBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            UsuarioEntidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();


            // nombre de la patente de la pagina
            string[] unosPermisosTest = new string[] { "NotaDeCredito" };
            if (UsuarioEntidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Public/Default.aspx");
            }


            if (!Page.IsPostBack)
            {
                CargarGrillaNotaDeCredito();


            }
        }

        public void CargarGrillaNotaDeCredito()
        {

            NotasDeCredito = GestorComprobante.FindAllNC();

            gvNotaDeCredito.DataSource = NotasDeCredito;
            gvNotaDeCredito.DataBind();



        }

        protected void gvNotaDeCredito_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Int32.Parse(gvNotaDeCredito.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);


            ComprobanteEntidad NotaDeCredito;


            // Busca el IDNotaDeCredito para traer todos sus datos
            NotaDeCredito = GestorComprobante.FindComprobante(id);
            switch (e.CommandName)
            {

                case "btnVerDetalle":
                    {

                        OrdenDeTrabajoEntidad unaOrden = new OrdenDeTrabajoEntidad();
                        OrdenDeTrabajoBLL gestorODT = new OrdenDeTrabajoBLL();


                        // Busca la OrdenDeTrabajo que figura en la Factura.
                        unaOrden = gestorODT.SelectODT(NotaDeCredito.MiOrdenDeTrabajo.IdOrdenDeTrabajo);

                        List<ItemOrdenDeTrabajoEntidad> unItem = new List<ItemOrdenDeTrabajoEntidad>();
                        ItemOrdenDeTrabajoBLL GestorItem = new ItemOrdenDeTrabajoBLL();

                        // Busca los Item que pertenecen a la OrdenDeTrabajo
                        unItem = GestorItem.ListaItemSelectAllByIdODT(unaOrden.IdOrdenDeTrabajo);

                        // ventana emergente 

                        DetalleNC.DataSource = unItem;
                        DetalleNC.DataBind();



                        break;
                    }
                case "btnGenerarND":

                    {
                        // Genera comprobante de tipo Nota de Debito = 3 , Sucursal General Rodriguez = 1 , Fecha = hoy


                        ComprobanteEntidad NuevoComprobante = new ComprobanteEntidad();

                        NuevoComprobante.MiTipoComprobante = new TipoComprobanteEntidad();
                        NuevoComprobante.MiTipoComprobante.IdTipoComprobante = 3;
                        NuevoComprobante.MiSucursal = new SucursalEntidad();
                        NuevoComprobante.MiSucursal.IdSucursal = 1;
                        NuevoComprobante.MiOrdenDeTrabajo = new OrdenDeTrabajoEntidad();
                        NuevoComprobante.MiOrdenDeTrabajo.IdOrdenDeTrabajo = NotaDeCredito.MiOrdenDeTrabajo.IdOrdenDeTrabajo;
                        NuevoComprobante.Fecha = DateTime.Now.Date;

                        ComprobanteBLL GestorComprobante = new ComprobanteBLL();

                        GestorComprobante.RegistrarComprobante(NuevoComprobante);



                        break;

                    }




            }
        }
    }
}