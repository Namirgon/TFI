using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class MisDirecciones : System.Web.UI.Page
    {


        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;

        protected void Page_Load(object sender, EventArgs e)
        {


            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!Page.IsPostBack)
            {


                CargarDirecciones();
            }
        }

        

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GVMisDirecciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int id = Int32.Parse(GVMisDirecciones.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);

            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];

            int IdUsuario = logueadoStatic.IdUsuario;

            OrdenDeTrabajoBLL OrdenByIdUsuario = new OrdenDeTrabajoBLL();
            OrdenDeTrabajoBLL EstadoActivo = new OrdenDeTrabajoBLL();
            ItemOrdenDeTrabajoBLL GestorItemODT = new ItemOrdenDeTrabajoBLL();
            OrdenDeTrabajoEntidad ExisteOrdenDeTrabajo;
            List<ItemOrdenDeTrabajoEntidad> ItemsIdItem;
           

            // lista 1 = consulta las ordenes de compras activas por el IdUsuario
            ExisteOrdenDeTrabajo = OrdenByIdUsuario.OrdenDeTrabajoActivas(IdUsuario);

            //lista 2 = consulta a la tabla lista de deseos con el IdUsuario los IdServicios
            ItemsIdItem = GestorItemODT.ListaItemSelectAllByIdODT(ExisteOrdenDeTrabajo.IdOrdenDeTrabajo);

            switch (e.CommandName)
            {

                case "btnConfirmar":
                    {
                        foreach (ItemOrdenDeTrabajoEntidad item in ItemsIdItem)
                        {

                            int idItem = item.IdItemOrdenDeTrabajo;


                            item.MiDireccion = new DireccionEntidad();
                            item.MiDireccion.IdDireccion= id;

                            GestorItemODT.InsertDireccion(id, idItem);
                        }

                        break;
                    }
                case "btnEliminar":

                    {

                        UsuarioBLL gestorUsuario = new UsuarioBLL();

                        gestorUsuario.EliminarDireccion(id, IdUsuario);
                        CargarDirecciones();
                        break;
                    }
            }

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  

        }

        public void CargarDirecciones()
        {

            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            int numeroIdUsuario = logueadoStatic.IdUsuario;

            List<DireccionEntidad> MisDirecciones = new List<DireccionEntidad>();
            DireccionBLL ListDireccion = new DireccionBLL();

            MisDirecciones=  ListDireccion.ListarDirecciones(numeroIdUsuario);

           
                GVMisDirecciones.DataSource = null;
                GVMisDirecciones.DataSource = MisDirecciones;
                GVMisDirecciones.DataBind();

         


        }



       
        protected void linkAltaDireccion_Click(object sender, EventArgs e)
        {
            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            Response.Redirect("Direccion.aspx");
        }

        protected void chbItem_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void BtnContinuar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResumenCompra.aspx");
        }

        protected void GVMisDirecciones_DataBound(object sender, EventArgs e)
        {
            GVMisDirecciones.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in GVMisDirecciones.Rows)
            {
                row.Cells[0].Visible = false;
            }
        }

    }
}