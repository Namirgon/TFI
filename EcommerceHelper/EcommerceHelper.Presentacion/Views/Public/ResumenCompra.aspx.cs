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
    public partial class MiDireccion : BasePage
    {

        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        public List<ItemOrdenDeTrabajoEntidad> ItemDeServicios;
          ItemOrdenDeTrabajoBLL GestorItemODT = new ItemOrdenDeTrabajoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!this.IsPostBack)
            {

                CargarDirecciones();
                CargarPedido();
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

            MisDirecciones = ListDireccion.ListarDirecciones(numeroIdUsuario);


            GVMisDirecciones.DataSource = null;
            GVMisDirecciones.DataSource = MisDirecciones;
            GVMisDirecciones.DataBind();


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
                    
                    suma += item.Precio ;
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
    }
}