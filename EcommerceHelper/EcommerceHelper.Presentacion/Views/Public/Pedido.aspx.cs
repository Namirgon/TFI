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
using System.Text;
using EcommerceHelper.BLL.Servicios;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Pedido : System.Web.UI.Page, IObservador
    {
       
        public Pedido(): base()
        {

            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }

        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx


        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();


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
            
            if (ItemDeServicios.Count < 1 )
            {

                Response.Write("<script>alert('No posee pedidos')</script>");
                //Response.Redirect("../../NuestrosServicios.aspx");
            }
            else
            {

                GVPedido.DataSource = ItemDeServicios;
                GVPedido.DataBind();

            }

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

            OrdenDeTrabajoEntidad ExisteOrdenDeTrabajo;

            int numeroIdUsuario = logueadoStatic.IdUsuario;
            OrdenDeTrabajoBLL OrdenByIdUsuario = new OrdenDeTrabajoBLL();
            // lista 1 = consulta las ordenes de compras activas por el IdUsuario
            ExisteOrdenDeTrabajo = OrdenByIdUsuario.OrdenDeTrabajoActivas(numeroIdUsuario);

            //lista 2 = consulta a la tabla lista de deseos con el IdUsuario los IdServicios
            ItemDeServicios = GestorItemODT.ListaItemSelectAllByIdODT(ExisteOrdenDeTrabajo.IdOrdenDeTrabajo);
            bool bandera = false;
            // recorre la lista de Items
            foreach (ItemOrdenDeTrabajoEntidad unItem in ItemDeServicios)
            {
                int id = 0;
                id = unItem.IdItemOrdenDeTrabajo;
                string fecha = Request.Form["Fecha" + id ];
                string hora = Request.Form["Hora" + id];
                string cantidad= Request.Form["cantidad" + id];


                // pregunta que fecha y hora no sea nula o este vacia
                if   (string.IsNullOrEmpty(fecha) | string.IsNullOrEmpty(hora))
                  
                {
                    bandera = true;
                 
                }
            else { 
                unItem.Fecha = DateTime.Parse(fecha);
                unItem.Hora = DateTime.Parse(hora);
                unItem.Cantidad = Int32.Parse(cantidad);

                DateTime t = new DateTime();

                if (!DateTime.TryParse(hora, out t))
                {

                    t = Convert.ToDateTime(hora, CultureInfo.GetCultureInfo("en-Us").DateTimeFormat);

                }

                DateTime d = new DateTime();
                if (!DateTime.TryParse(fecha, out d))

                {
                    d = Convert.ToDateTime(fecha, CultureInfo.GetCultureInfo("en-Us").DateTimeFormat);

                }

                    GestorItemODT.ListaDeItemUpdate(id, d, t, Int32.Parse( cantidad));
                    CargarPedido();
                }
                if (bandera == true)
                {
                    if (!bandera)
                    {
                        Response.Redirect("../../Direccion.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Seleccione fecha y Hora')</script>");
                    }

                }
                
            }
          
           


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

                //case "btnConfirmar":
                //    {


                //         id = unItem.IdItemOrdenDeTrabajo;
                //        //string idinput = Request.Form["usr58"];
                //         string fecha = Request.Form["Fecha"+id];
                //         string hora = Request.Form["Hora"+id];

                //         unItem.Fecha = DateTime.Parse(fecha);
                //         unItem.Hora = DateTime.Parse(hora);



                //        DateTime t = new DateTime();

                //        if (!DateTime.TryParse(hora, out t))
                //        {

                //            t = Convert.ToDateTime(hora, CultureInfo.GetCultureInfo("en-Us").DateTimeFormat);

                //        }

                //        DateTime d = new DateTime();
                //        if (!DateTime.TryParse(fecha, out d))

                //        {
                //            d = Convert.ToDateTime(fecha, CultureInfo.GetCultureInfo("en-Us").DateTimeFormat);
                           
                //        }

                //        GestorItemODT.ListaDeItemUpdate(id, d, t);
                //        CargarPedido();

                //        break;
                //    }
                case "btnEliminar":

                    {

                            GestorItemODT.EliminarItem(id);
                            CargarPedido();
                            
                        

                        break;
                    }
            }

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

        protected void GVPedido_DataBound(object sender, EventArgs e)
        {
            GVPedido.HeaderRow.Cells[0].Visible = false;
            
            foreach(GridViewRow row in GVPedido.Rows)
            {
                row.Cells[0].Visible = false;
                Image img = new Image();
                img.ImageUrl = row.Cells[4].Text;
                img.Attributes.Add("width", "90%");

                row.Cells[4].Controls.Add(img);

                //     < input type = "text"  class="form-control"   placeholder="YYYY-MM-DD" autocomplete="off" name="DatePickerFecha" style=\"width:120px;background-color:#ffffff; align-self:center \">"
                LiteralControl txtFecha = new LiteralControl("<input type=\"date\" id=\"Fecha"+row.Cells[0].Text+ "\" name=\"Fecha" + row.Cells[0].Text + "\" min=\"" + DateTime.Now.Year.ToString()+"-"+DateTime.Now.Month.ToString()+"-"+DateTime.Now.Day.ToString() + "\" max=\"2021-01-19\">");

                row.Cells[5].Controls.Add(txtFecha);
                LiteralControl txtHora = new LiteralControl("<input type=\"time\" id=\"Hora" + row.Cells[0].Text + "\" name=\"Hora" + row.Cells[0].Text + "\" min=\"08:00\" max=\"15:00\" step=\"3600\" >");

                row.Cells[6].Controls.Add(txtHora);

                LiteralControl cantidad = new LiteralControl("<input type=\"number\" min=\"1\" max=\"10\" id=\"cantidad" + row.Cells[0].Text + "\" name=\"cantidad" + row.Cells[0].Text + "\" style=\"width:80px\">");

                row.Cells[7].Controls.Add(cantidad);

            }
}

        protected void btnIrADirecciones_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Public/MisDirecciones.aspx");
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

                //if ((Controlobj) is System.Web.UI.WebControls.DropDownList)
                //{
                //    RecorrerDropDown(((System.Web.UI.WebControls.DropDownList)Controlobj));
                //}


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