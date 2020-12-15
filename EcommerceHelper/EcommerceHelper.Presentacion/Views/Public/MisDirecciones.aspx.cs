using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class MisDirecciones : System.Web.UI.Page , IObservador
    {


        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
      

        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public MisDirecciones() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }

        protected void Page_Load(object sender, EventArgs e)
        {


            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!Page.IsPostBack)
            {

                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;
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

            MisDirecciones = ListDireccion.ListarDirecciones(numeroIdUsuario);

            if (MisDirecciones.Count == 0)
            {

                Response.Redirect("Direccion.aspx");
            }
            else
            {
                GVMisDirecciones.DataSource = null;
                GVMisDirecciones.DataSource = MisDirecciones;
                GVMisDirecciones.DataBind();
            }

            


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