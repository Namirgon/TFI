using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using static System.Net.Mime.MediaTypeNames;

namespace EcommerceHelper.Presentacion.Views.Public
{

    
    public partial class MenuPrincipal : BasePage
    {

        List<ServicioEntidad> unServicios = new List<ServicioEntidad>();
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        ServicioBLL gestorServicio = new ServicioBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            ServicioBLL unServicioBLL = new ServicioBLL();
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre= Session["NomUsuario"].ToString();


            if (usuarioentidad == null)
                Response.Redirect("Default.aspx");


            // Cargo el repeater con los servicios en venta
            unServicios = (List<ServicioEntidad>)unServicioBLL.SelectALLServicios();
            InfoServicio.DataSource = unServicios;
            InfoServicio.DataBind();


        }
        // grabo en BD Lista de Pedidos del cliente
        protected void BtnComprar_Click(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            UsuarioEntidad logueadoStatic;

            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];




            OrdenDeTrabajoBLL GestorODT = new OrdenDeTrabajoBLL();
            OrdenDeTrabajoEntidad OrdenDeTrabajoEntidad = new OrdenDeTrabajoEntidad();

            int LogueadoId = logueadoStatic.IdUsuario;
            OrdenDeTrabajoEntidad = GestorODT.OrdenDeTrabajoActivas(LogueadoId);

            if (OrdenDeTrabajoEntidad.IdEstado == 0)

            {
                OrdenDeTrabajoEntidad._MiUsuario.IdUsuario = LogueadoId;
                GestorODT.OrdenDeTrabajoInsert(OrdenDeTrabajoEntidad);
            }
            else
            {
                //OrdenDeTrabajoEntidad = GestorODT.OrdenDeTrabajoActivas(LogueadoId);



                ItemOrdenDeTrabajoBLL unaListaItemBLL = new ItemOrdenDeTrabajoBLL();
                ItemOrdenDeTrabajoEntidad unItem = new ItemOrdenDeTrabajoEntidad();

                // El detalle está en encontrar el item padre del botón que se presionó
                Button btn = (Button)sender;
                RepeaterItem item = (RepeaterItem)btn.NamingContainer;

                // Buscamos el control en ese item 
                Label lbl = (Label)item.FindControl("LblIdServicio");
                int IdServ = Int32.Parse(lbl.Text);

                // Carga la Lista de items

                unItem.MiOrdenDeTrabajo = new OrdenDeTrabajoEntidad();
                unItem.MiOrdenDeTrabajo.IdOrdenDeTrabajo = OrdenDeTrabajoEntidad.IdOrdenDeTrabajo;
                unItem.NombreUsuario = logueadoStatic.Nombre;
                unItem.MiUsuario.IdUsuario = logueadoStatic.IdUsuario;
                //unItem._MiServicio = new ServicioEntidad();
                //unItem._MiServicio.IdServicio = IdServ;

                ServicioEntidad unServicio;
                 unServicio=  gestorServicio.FindServicio(IdServ);
                unItem._MiServicio = new ServicioEntidad();
                unItem.Precio = unServicio.Precio;
                unItem._MiServicio.IdServicio = unServicio.IdServicio;

                unaListaItemBLL.ItemOrdenDeTrabajoInsert(unItem);

            }
        }


    }


}   


// FIN CLASE