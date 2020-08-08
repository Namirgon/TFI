﻿using System;
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

    
    public partial class MenuPrincipal : System.Web.UI.Page
    {

        List<ServicioEntidad> unServicios = new List<ServicioEntidad>();
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        

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
        // grabo en BD Lista de Deseos del cliente
        protected void BtnComprar_Click(object sender, EventArgs e)
        {


            var Current = HttpContext.Current;
            UsuarioEntidad logueadoStatic;
         
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];


            OrdenDeTrabajoEntidad NuevaOrden = new OrdenDeTrabajoEntidad();
            OrdenDeTrabajoBLL OrdenByIdUsuario = new OrdenDeTrabajoBLL();

            OrdenDeTrabajoBLL EstadoActivo = new OrdenDeTrabajoBLL();
            OrdenDeTrabajoEntidad ExisteOrdenDeTrabajo ;

            int LogueadoId = logueadoStatic.IdUsuario;
            ExisteOrdenDeTrabajo = EstadoActivo.OrdenDeTrabajoActivas(LogueadoId);

            
            

            if ( ExisteOrdenDeTrabajo.IdEstado == 0 )
                
            {
                NuevaOrden.IdUsuario = logueadoStatic.IdUsuario;
                OrdenByIdUsuario.OrdenDeTrabajoInsert(NuevaOrden);
            }
            else
            {
                ExisteOrdenDeTrabajo= OrdenByIdUsuario.OrdenDeTrabajoActivas(LogueadoId);


            }

            ItemOrdenDeTrabajoBLL unaListaItemBLL = new ItemOrdenDeTrabajoBLL();
            ItemOrdenDeTrabajoEntidad unItem = new ItemOrdenDeTrabajoEntidad();

            // El detalle está en encontrar el item padre del botón que se presionó
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            // Buscamos el control en ese item 
            Label lbl = (Label)item.FindControl("LblIdServicio");
            int IdServ = Int32.Parse(lbl.Text);

            // Carga la Lista de items

            unItem.IdOrdenDeTrabajo = ExisteOrdenDeTrabajo.IdOrdenDeTrabajo;
            unItem.NombreUsuario = logueadoStatic.Nombre;
            unItem.IdUsuario= logueadoStatic.IdUsuario;
            unItem.IdServicio = IdServ;
                
            unaListaItemBLL.ItemOrdenDeTrabajoInsert(unItem);

        }


    }


}   


// FIN CLASE