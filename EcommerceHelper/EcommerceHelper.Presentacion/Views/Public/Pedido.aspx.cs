using EcommerceHelper.Entidades;
using EcommerceHelper.Presentacion.Helpers.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.BLL;
using System.Web.Services;
using System.Globalization;
using System.Runtime;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Pedido : BasePage 
    {
       

        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;

        public List<ItemOrdenDeTrabajoEntidad> ItemDeServicios;

        public List<ServicioEntidad> ListaDeServicios = new List<ServicioEntidad>();
        ItemOrdenDeTrabajoBLL GestorItemODT = new ItemOrdenDeTrabajoBLL();

        ServicioBLL BuscarServicios = new ServicioBLL();

        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();


            if (!Page.IsPostBack)
            {
                CargarPedido();
                
             
            }
            else
            {
                // son los pedidos de servicio actuales
                ListaDeServicios = (List<ServicioEntidad>)Current.Session["ListaDeServicios"];
                // son la lista de los items
                ItemDeServicios = (List<ItemOrdenDeTrabajoEntidad>)Current.Session["DeseoDeServicios"];
                // OrdenesdeTrabajo Activas  por el IdUsuario
            }
        }

        public void CargarPedido()
        {

            UsuarioEntidad logueadoStatic;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            OrdenDeTrabajoBLL OrdenByIdUsuario = new OrdenDeTrabajoBLL();

            OrdenDeTrabajoBLL EstadoActivo = new OrdenDeTrabajoBLL();
            OrdenDeTrabajoEntidad ExisteOrdenDeTrabajo;
          
            int numeroIdUsuario = logueadoStatic.IdUsuario;

            // lista 1 = consulta las ordenes de compras activas por el IdUsuario
            ExisteOrdenDeTrabajo = OrdenByIdUsuario.OrdenDeTrabajoActivas(numeroIdUsuario);

            //lista 2 = consulta a la tabla lista de deseos con el IdUsuario los IdServicios
            ItemDeServicios = GestorItemODT.ListaItemSelectAllByIdODT(ExisteOrdenDeTrabajo.IdOrdenDeTrabajo);          

            GVPedido.DataSource = ItemDeServicios;
            GVPedido.DataBind();
          
        }

        protected void btnDatosPersonales(object sender, EventArgs e)
        {
            Response.Redirect("DatosPersonales.aspx");
        }

       

        [WebMethod]


       

        protected void BtnContinuar_Click(object sender, EventArgs e)
        {

            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];

            int  IdUsuario = logueadoStatic.IdUsuario;

            Response.Redirect("MisDirecciones.aspx");
        }

        protected void GVPedido_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Int32.Parse(GVPedido.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);

            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];

            int IdUsuario = logueadoStatic.IdUsuario;

            ItemOrdenDeTrabajoEntidad unItem;
            unItem = GestorItemODT.Find(id);
            switch (e.CommandName)
            {

                case "btnConfirmar":
                    {


                        id = unItem.IdItemOrdenDeTrabajo;
                        string fecha = Request.Form["DatePickerFecha"];
                        string hora = Request.Form["DatePickerTime"];

                        //unItem.IdItemOrdenDeTrabajo = IdUsuario;
                       unItem.Fecha = DateTime.Parse(fecha);
                        unItem.Hora = DateTime.Parse(hora);

                        DateTime t = new DateTime();

                        if (!  DateTime.TryParse(hora, out t))
                        {

                            t = Convert.ToDateTime(hora, CultureInfo.GetCultureInfo("en-Us").DateTimeFormat);

                        }

                        DateTime d = new DateTime();
                        if (!DateTime.TryParse(fecha, out d))

                        {
                            d = Convert.ToDateTime(fecha, CultureInfo.GetCultureInfo("en-Us").DateTimeFormat);
                            //d = DateTime.ParseExact(fecha, " dd/mm/yyyy", CultureInfo.InvariantCulture);
                        }
                                
                        GestorItemODT.ListaDeItemUpdate(id, d, t);

                        break;
                    }
                case "btnEliminar":

                    {

                            GestorItemODT.EliminarItem(id);
                            CargarPedido();
                            
                        

                        break;
                    }
            }

        }

        protected void GVPedido_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Image img = new Image();
            img.ImageUrl = e.Row.Cells[4].Text;
            img.Attributes.Add("width", "90%");
        
            e.Row.Cells[4].Controls.Add(img);
        }

        protected void GVPedido_RowEditing(object sender, GridViewEditEventArgs e)
        {
        }

        private void BindGrid()
        {
           
        }
        protected void GVPedido_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           
        }

        protected void GVPedido_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}