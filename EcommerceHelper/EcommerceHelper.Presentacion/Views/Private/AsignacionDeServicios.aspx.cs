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
    public partial class AsignacionDeServicios : System.Web.UI.Page
    {
        List<UsuarioEntidad> ListEmpleados = new List<UsuarioEntidad>();
        UsuarioBLL GestorUsuario = new UsuarioBLL();
        UsuarioEntidad usuario;
        List<ComprobanteEntidad> Facturas = new List<ComprobanteEntidad>();
        ComprobanteBLL GestorComprobante = new ComprobanteBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            usuario = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            if (!IsPostBack)
            {

                CargarGrillaFactura();
                cargarEmpleados();

            }
            string[] unosPermisosTest = new string[] { "AsignacionDeServicios" };
            if (usuario == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Public/Default.aspx");
            }
        }

        public void cargarEmpleados()
        {


            ddlEmpleado.DataSource = null;
            ListEmpleados = GestorUsuario.SelectALLEmpleadoDeLimpieza();

            DDLIDEmpleado.DataSource = ListEmpleados.Select(a => a.IdUsuario);
            DDLIDEmpleado.DataBind();
            ddlEmpleado.DataSource = ListEmpleados.Select(a => a.Apellido + ", " + a.Nombre);
            ddlEmpleado.DataBind();


        }

        public void CargarGrillaFactura()
        {

            Facturas = GestorComprobante.FindAllFacturasSinAsignar();

            gvFacturas.DataSource = Facturas;
            gvFacturas.DataBind();



        }
        protected void gvFacturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Int32.Parse(gvFacturas.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);


            ComprobanteEntidad Factura;
            OrdenDeTrabajoEntidad unaOrden = new OrdenDeTrabajoEntidad();
            OrdenDeTrabajoBLL gestorODT = new OrdenDeTrabajoBLL();
            List<ItemOrdenDeTrabajoEntidad> unItem = new List<ItemOrdenDeTrabajoEntidad>();
            ItemOrdenDeTrabajoBLL GestorItem = new ItemOrdenDeTrabajoBLL();



            // Busca el IdFactura para traer todos sus datos
            Factura = GestorComprobante.FindComprobante(id);
            switch (e.CommandName)
            {

                case "btnVerDetalle":
                    {
                   

                        // Busca la OrdenDeTrabajo que figura en la Factura.
                        unaOrden = gestorODT.SelectODT(Factura.MiOrdenDeTrabajo.IdOrdenDeTrabajo);

                       
                        // Busca los Item que pertenecen a la OrdenDeTrabajo
                        unItem = GestorItem.ResumenDeCompra(unaOrden.IdOrdenDeTrabajo);

                        // ventana emergente 

                        DetalleFactura.DataSource = unItem;
                        DetalleFactura.DataBind();

                        break;
                    }
                case "btnSeleccionar":

                    {
                        // recarga el ddlist de usuarios empleados que tienen el mismo idlocalidad que el usuario cliente

                       
                        // Busca la OrdenDeTrabajo que figura en la Factura.
                        unaOrden = gestorODT.SelectODT(Factura.MiOrdenDeTrabajo.IdOrdenDeTrabajo);

                        // Busca los Item que pertenecen a la OrdenDeTrabajo
                        unItem = GestorItem.ResumenDeCompraByIdLocalidad(unaOrden.IdOrdenDeTrabajo);

                        foreach (ItemOrdenDeTrabajoEntidad x in unItem)
                        {
                            int idloc = x.MiDireccion.MiLocalidad.IdLocalidad;
        
                            //busca en la tabla el iddireccion para obtener el idlocalidad


                            ddlEmpleado.DataSource = null;
                           ListEmpleados = GestorUsuario.SelectALLEmpleadoDeLimpiezabyLocalidad(idloc );

                            DDLIDEmpleado.DataSource = ListEmpleados.Select(a => a.IdUsuario);
                            DDLIDEmpleado.DataBind();
                            ddlEmpleado.DataSource = ListEmpleados.Select(a => a.Apellido + ", " + a.Nombre);
                            ddlEmpleado.DataBind();
                        }




                        break;

                    }

                //BtnAsignar
                case "BtnAsignar":
                    {
                        // Busca la OrdenDeTrabajo que figura en la Factura.
                        unaOrden = gestorODT.SelectODT(Factura.MiOrdenDeTrabajo.IdOrdenDeTrabajo);


                        
                            int IdEmpleado = Int32.Parse(DDLIDEmpleado.Items[ddlEmpleado.SelectedIndex].ToString());
                            int IdOdt = unaOrden.IdOrdenDeTrabajo;

                            GestorItem.UsuarioServicioInsert(IdEmpleado, IdOdt);


                        
                        CargarGrillaFactura();

                        break;
                    }

            }


        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {

            //ItemOrdenDeTrabajoEntidad asignarItem = new ItemOrdenDeTrabajoEntidad();

            //asignarItem.MiUsuario = new UsuarioEntidad();
            //asignarItem.MiUsuario.IdUsuario = int.Parse(ddlEmpleado.SelectedValue);
           // asignarItem.IdItemOrdenDeTrabajo =
        }

        protected void DetalleFactura_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            
        }

        protected void DetalleFactura_DataBound(object sender, EventArgs e)
        {
            //DetalleFactura.HeaderRow.Cells[0].Visible = false;

            //DetalleFactura.Rows[0].Visible = false;

        }

        protected void gvFacturas_DataBound(object sender, EventArgs e)
        {
            gvFacturas.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in gvFacturas.Rows)
            {
                row.Cells[0].Visible = false;
                
            }
        }

       

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuAdministracion.aspx");
        }
    }
}