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

   
    public partial class Pago : BasePage
    {
        TarjetaBLL GestorTarjeta = new TarjetaBLL();
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!this.IsPostBack)
            {
               
               
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


            GVTarjetas.DataSource = null;
            GVTarjetas.DataSource = MisTarjetas;
            GVTarjetas.DataBind();


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
                        ItemOrdenDeTrabajoBLL GestorItemODT = new ItemOrdenDeTrabajoBLL();

                        //lista 2 = consulta a la tabla lista de deseos con el IdUsuario los IdServicios
                        ItemServicios = GestorItemODT.ResumenDeCompra(OrdenDeTrabajo.IdOrdenDeTrabajo);

                        decimal suma = 0;
                        foreach (ItemOrdenDeTrabajoEntidad item in ItemServicios)
                        {

                            suma += item.Precio;


                        }

                        elPago.MiOrdenDeTrabajo = new OrdenDeTrabajoEntidad();
                        elPago.MiOrdenDeTrabajo.IdOrdenDeTrabajo = OrdenDeTrabajo.IdOrdenDeTrabajo;
                        elPago.MiFormaDePago = new FormaDePagoEntidad();
                        elPago.MiFormaDePago.IdFormaDePago = 2;
                        elPago.Importe = suma;
                        
                        GestorRecibo.RegistrarPago(elPago);
                        GestorRecibo.PagarOrdenDeTrabajo(unaTarjeta.NumeroTarjeta.ToString(), unaTarjeta.CodigoSeguridad, suma);

                        //Response.Write("<script>alert('Pago Exitoso')</script>");
                        break;
                    }
               
            }
        }
    }
}