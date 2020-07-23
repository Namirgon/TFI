using EcommerceHelper.Entidades;
using EcommerceHelper.Presentacion.Helpers.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.BLL;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Pedido1 : System.Web.UI.Page
    {

        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        public List<ListaDeDeseoEntidad> DeseoDeServicios;
        public List<ServicioEntidad> ListaDeServicios = new List<ServicioEntidad>();
        ListaDeDeseoBLL cargarLista = new ListaDeDeseoBLL();
        ServicioBLL BuscarServicios = new ServicioBLL();
        ListaDeDeseoBLL CancelarDeseo = new ListaDeDeseoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!Page.IsPostBack)
            {
                CargarDeseos();
                //Calendar.Visible = false;
            }
        }

        public void CargarDeseos()
        {
            
            UsuarioEntidad logueadoStatic;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            int numerodocumento = logueadoStatic.NumeroDocumento;

            //lista 1= consulta a la tabla lista de deseos con el numerodocumento los IdServicios
            DeseoDeServicios = cargarLista.ListaDeseosSelectAllByNumeroDocumento(numerodocumento);

            // lista 2 = Con la lista 1 realizar la consulta a la tabla de servicios para traer *
             foreach ( ListaDeDeseoEntidad s in DeseoDeServicios)
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

        public static void DeleteItem(int id)
        {
            var Current = HttpContext.Current;
            var list = (List<ListaDeDeseoEntidad>)Current.Session["usuario"];
            Current.Session["usuario"] = list.Where(x => x.IdDeseo != id).ToList();

        }



        public void CancelarDeseoDeLaLista(int id)
        {

            var Current = HttpContext.Current;
            var list = (List<ListaDeDeseoEntidad>)Current.Session["usuario"];
            Current.Session["usuario"] = list.Where(x => x.IdDeseo == id).ToList();

            foreach (ListaDeDeseoEntidad x in list)
            {

                CancelarDeseo.ListaDeDeseosUpdate(x);
            }
            CargarDeseos();
        }









        //Script order defined in master page


    }
}