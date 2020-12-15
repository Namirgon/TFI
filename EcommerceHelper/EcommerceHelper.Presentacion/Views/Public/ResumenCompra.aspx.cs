using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class MiDireccion : System.Web.UI.Page, IObservador
    {

        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();

        public List<ItemOrdenDeTrabajoEntidad> ItemDeServicios;
          ItemOrdenDeTrabajoBLL GestorItemODT = new ItemOrdenDeTrabajoBLL();
        public MiDireccion() : base()
        {

            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }

        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx

        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!this.IsPostBack)
            {

                CargarDirecciones();
                CargarPedido();

                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;
            }
        }

        public void CargarDirecciones()
        {

            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            int numeroIdUsuario = logueadoStatic.IdUsuario;

            List<DireccionEntidad> MisDirecciones = new List<DireccionEntidad>();
            DireccionBLL ListDireccion = new DireccionBLL();


            OrdenDeTrabajoBLL OrdenByIdUsuario = new OrdenDeTrabajoBLL();
            ItemOrdenDeTrabajoBLL GestorItemODT = new ItemOrdenDeTrabajoBLL();
            OrdenDeTrabajoEntidad ExisteOrdenDeTrabajo;
            List<ItemOrdenDeTrabajoEntidad> ItemsIdItem;
            // lista 1 = consulta las ordenes de compras activas por el IdUsuario
            ExisteOrdenDeTrabajo = OrdenByIdUsuario.OrdenDeTrabajoActivas(numeroIdUsuario);

            //lista 2 = consulta a la tabla lista de deseos con el IdUsuario los IdServicios
            ItemsIdItem = GestorItemODT.ListaItemSelectAllByIdODT3(ExisteOrdenDeTrabajo.IdOrdenDeTrabajo);

            
                foreach (ItemOrdenDeTrabajoEntidad item in ItemsIdItem)
                {
                    MisDirecciones = ListDireccion.ListarDireccionesPedido(item.IdItemOrdenDeTrabajo);
                    GVMisDirecciones.DataSource = null;
                    GVMisDirecciones.DataSource = MisDirecciones;
                    GVMisDirecciones.DataBind();

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

            try
            {  //lista 2 = consulta a la tabla lista de deseos con el IdUsuario los IdServicios
                ItemDeServicios = GestorItemODT.ResumenDeCompra(ExisteOrdenDeTrabajo.IdOrdenDeTrabajo);

                GVPedido.DataSource = ItemDeServicios;
                GVPedido.DataBind();
                decimal suma = 0;
                foreach (ItemOrdenDeTrabajoEntidad item in ItemDeServicios)
                {
                    
                    suma += item.Precio * item.Cantidad ;
                    txtTotal.Text = " $ " + suma.ToString();
                   

                }
               
            }
            catch

            {

                Response.Write("<script>alert('Le falta asignar fecha y hora a alguún servicio')</script>");
            }

        }

        protected void GVMisDirecciones_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GVMisDirecciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GVPedido_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GVPedido_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GVPedido_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Image img = new Image();
            img.ImageUrl = e.Row.Cells[3].Text;
            img.Attributes.Add("width", "90%");

            e.Row.Cells[3].Controls.Add(img);
        }

        protected void GVPedido_DataBound(object sender, EventArgs e)
        {
            GVPedido.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in GVPedido.Rows)
            {
                row.Cells[0].Visible = false;
            }
        }

        protected void GVMisDirecciones_DataBound(object sender, EventArgs e)
        {
            GVMisDirecciones.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in GVMisDirecciones.Rows)
            {
                row.Cells[0].Visible = false;
            }
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