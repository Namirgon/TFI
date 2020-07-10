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

        //protected void ImagenBtn_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (Calendar.Visible)
        //    {

        //        Calendar.Visible = false;
        //    }
        //    else
        //    {

        //        Calendar.Visible = true;
        //    }
        //    Calendar.Attributes.Add("style", "position:absolute ");
        //}

        //protected void Calendar_SelectionChanged(object sender, EventArgs e)
        //{
        //    Fecha.Text = Calendar.SelectedDate.ToString("dd/mm/yyyy");
        //    Calendar.Visible = false;
        //}

        protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date.DayOfWeek != DayOfWeek.Sunday)
            {

                e.Day.IsSelectable = true;
            }
            else
            {

                e.Cell.ApplyStyle(new Style { BackColor = System.Drawing.Color.Gray });
                e.Day.IsSelectable = false;
            }
        }

        protected void ImageButtonhora_Click(object sender, ImageClickEventArgs e)
        {

        }






        //Script order defined in master page


    }
}