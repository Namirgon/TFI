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
    public partial class NotaDeDebitoaspx : System.Web.UI.Page
    {

        UsuarioEntidad UsuarioEntidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        List<ComprobanteEntidad> NotasDeDebito = new List<ComprobanteEntidad>();
        ComprobanteBLL GestorComprobante = new ComprobanteBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            UsuarioEntidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            // nombre de la patente de la pagina
            string[] unosPermisosTest = new string[] { "NotaDeDebito" };
            if (UsuarioEntidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Public/Default.aspx");
            }

            if (!Page.IsPostBack)
            {
                CargarGrillaNotaDeDebito();


            }
        }

        public void CargarGrillaNotaDeDebito()
        {

            NotasDeDebito = GestorComprobante.FindAllND();

            gvNotaDeDebito.DataSource = NotasDeDebito;
            gvNotaDeDebito.DataBind();



        }

        protected void gvNotaDeDebito_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Int32.Parse(gvNotaDeDebito.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);


            ComprobanteEntidad NotaDeDebito;


            // Busca el IDNotaDeDebito para traer todos sus datos
            NotaDeDebito = GestorComprobante.FindComprobante(id);
            switch (e.CommandName)
            {

                case "btnVerDetalle":
                    {

                        OrdenDeTrabajoEntidad unaOrden = new OrdenDeTrabajoEntidad();
                        OrdenDeTrabajoBLL gestorODT = new OrdenDeTrabajoBLL();


                        // Busca la OrdenDeTrabajo que figura en la Factura.
                        unaOrden = gestorODT.SelectODT(NotaDeDebito.MiOrdenDeTrabajo.IdOrdenDeTrabajo);

                        List<ItemOrdenDeTrabajoEntidad> unItem = new List<ItemOrdenDeTrabajoEntidad>();
                        ItemOrdenDeTrabajoBLL GestorItem = new ItemOrdenDeTrabajoBLL();

                        // Busca los Item que pertenecen a la OrdenDeTrabajo
                        unItem = GestorItem.ListaItemSelectAllByIdODT(unaOrden.IdOrdenDeTrabajo);

                        // ventana emergente 

                        DetalleND.DataSource = unItem;
                        DetalleND.DataBind();



                        break;
                    }


            }
        }
    }
}