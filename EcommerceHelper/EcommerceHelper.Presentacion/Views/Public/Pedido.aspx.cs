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

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Pedido : System.Web.UI.Page
    {

        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;

        public List<ItemOrdenDeTrabajoEntidad> ItemDeServicios;
     
        public List<ServicioEntidad> ListaDeServicios = new List<ServicioEntidad>();
        ItemOrdenDeTrabajoBLL cargarLista = new ItemOrdenDeTrabajoBLL();
       
        ServicioBLL BuscarServicios = new ServicioBLL();
      
        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            //if (Current.Session["ListaDeServicios"] == null)
            //    Response.Redirect("MenuPrincipal.aspx");

            if (!Page.IsPostBack)
            {
                CargarDeseos();
                
            }
            else
            {
                // son los pedidos de servicio actuales
                  ListaDeServicios = (List<ServicioEntidad>)Current.Session["ListaDeServicios"];


                // son la lista de los items
                ItemDeServicios = (List<ItemOrdenDeTrabajoEntidad>)Current.Session["DeseoDeServicios"];
            }
        }

        public void CargarDeseos()
        {
            
            UsuarioEntidad logueadoStatic;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            //int numerodocumento = logueadoStatic.NumeroDocumento;
            int numeroIdUsuario = logueadoStatic.IdUsuario;

            //lista 1= consulta a la tabla lista de deseos con el numerodocumento los IdServicios
            //ItemDeServicios = cargarLista.ListaItemSelectAllByNumeroDocumento(numerodocumento);
            ItemDeServicios = cargarLista.ListaItemSelectAllByNumeroIdUsuario(numeroIdUsuario);
            // lista 2 = Con la lista 1 realizar la consulta a la tabla de servicios para traer *
            foreach ( ItemOrdenDeTrabajoEntidad s in ItemDeServicios)
            {
                ServicioEntidad _serv = new ServicioEntidad();
                _serv.IdServicio = s.IdServicio;

                 

                ListaDeServicios.Add(BuscarServicios.FindServicio(_serv.IdServicio));

            }
            
        } 

        protected void btnDatosPersonales(object sender , EventArgs e)
        {

            Response.Redirect("DatosPersonales.aspx");
        }

        //public static void DeleteItem(int id)
        //{
        //    var Current = HttpContext.Current;
        //    var list = (List<ListaDeDeseoEntidad>)Current.Session["usuario"];
        //    Current.Session["usuario"] = list.Where(x => x.IdDeseo != id).ToList();

        //}


        [WebMethod]
        public static void CancelarItemDeLaLista(int id)
        {

            var Current = HttpContext.Current;
            //la lista de deseo contiene el detalle del servicio mas dia y horario para el servicio
            var deseo= (List<ListaDeDeseoEntidad>)Current.Session["DeseoDeServicios"];
            // la lista de servicios contiene el detalle del servicio propiamente dicho .. titulo, imagen, descripcion y precio
            var list = (List<ServicioEntidad>)Current.Session["ListaDeServicios"];

            Current.Session["ListaDeServicios"] = list.Where(x => x.IdServicio == id).ToList();

            Current.Session["DeseoDeServicios"] = deseo.Where(x => x.IdServicio != id).ToList();

           


            foreach (ListaDeDeseoEntidad IdServ in deseo) 
            {


               ListaDeDeseoBLL CancelarDeseo = new ListaDeDeseoBLL();
               CancelarDeseo.ListaDeDeseosUpdate(IdServ);


            }
         
           
        }









        //Script order defined in master page


    }
}