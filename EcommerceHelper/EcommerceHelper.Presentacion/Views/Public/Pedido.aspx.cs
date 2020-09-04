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
    public partial class Pedido : BasePage 
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
            ItemDeServicios = cargarLista.ListaItemSelectAllByIdODT(ExisteOrdenDeTrabajo.IdOrdenDeTrabajo);

            // lista 3 = Con la lista 1 realizar la consulta a la tabla de servicios para traer *
            foreach (ItemOrdenDeTrabajoEntidad s in ItemDeServicios)
            {
                ServicioEntidad _serv = new ServicioEntidad();
                _serv.IdServicio = s._MiServicio .IdServicio;



                ListaDeServicios.Add(BuscarServicios.FindServicio(_serv.IdServicio));

            }

        }

        protected void btnDatosPersonales(object sender, EventArgs e)
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
        public static void CancelarItemDeLaLista(int id) // llega el IdServicio
        {

            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            OrdenDeTrabajoBLL OrdenByIdUsuario = new OrdenDeTrabajoBLL();

            OrdenDeTrabajoBLL EstadoActivo = new OrdenDeTrabajoBLL();
            OrdenDeTrabajoEntidad ExisteOrden = new OrdenDeTrabajoEntidad();

            int numeroIdUsuario = logueadoStatic.IdUsuario;

            List<ItemOrdenDeTrabajoEntidad> ItemDeServicio;
            ItemOrdenDeTrabajoBLL ListaItem = new ItemOrdenDeTrabajoBLL();
            List<ServicioEntidad> ListaDeServicio = new List<ServicioEntidad>();

            ServicioBLL BuscarServicios = new ServicioBLL();

            // lista 1 = consulta las ordenes de compras activas por el IdUsuario
            ExisteOrden = OrdenByIdUsuario.OrdenDeTrabajoActivas(numeroIdUsuario);

            //lista 2 = consulta a la tabla lista de pedidos con el IdUsuario los IdServicios
            ItemDeServicio = ListaItem.ListaIdItems (ExisteOrden.IdOrdenDeTrabajo);

            // lista 3 = Con la lista 2 realizar la busqueda del IdServicio que se quiere eliminar

            foreach (ItemOrdenDeTrabajoEntidad s in ItemDeServicio)
   
            {

                if (id == s._MiServicio .IdServicio   )
                {
                    //ItemDeServicio.FindIndex(item =>  s.IdItemOrdenDeTrabajo== item.IdItemOrdenDeTrabajo );
                    ListaItem.EliminarItem(s.IdItemOrdenDeTrabajo);
                }
                else
                {

                }
                // revisar porque me elimina todos los IdServicios del mismo servicio de la ordendetrabajoactiva
               
            }

            
          
            
            //foreach (ItemOrdenDeTrabajoEntidad s in ItemDeServicio)
            //{
            //    ServicioEntidad _serv = new ServicioEntidad();
            //    _serv.IdServicio = s.IdServicio;



            //    ListaDeServicio.Add(BuscarServicios.FindServicio(_serv.IdServicio));

            //}



            //var Current = HttpContext.Current;
            ////la lista de deseo contiene el detalle del servicio mas dia y horario para el servicio
            //var deseo= (List<ListaDeDeseoEntidad>)Current.Session["DeseoDeServicios"];
            //// la lista de servicios contiene el detalle del servicio propiamente dicho .. titulo, imagen, descripcion y precio
            //var list = (List<ServicioEntidad>)Current.Session["ListaDeServicios"];

            //Current.Session["ListaDeServicios"] = list.Where(x => x.IdServicio == id).ToList();

            //Current.Session["DeseoDeServicios"] = deseo.Where(x => x.IdServicio != id).ToList();




            //foreach (ListaDeDeseoEntidad IdServ in deseo) 
            //{


            //   ListaDeDeseoBLL CancelarDeseo = new ListaDeDeseoBLL();
            //   CancelarDeseo.ListaDeDeseosUpdate(IdServ);


            //}


        }

       

        protected void BtnContinuar_Click(object sender, EventArgs e)
        {
            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            Response.Redirect("MisDirecciones.aspx");
        }









        //Script order defined in master page


    }
}