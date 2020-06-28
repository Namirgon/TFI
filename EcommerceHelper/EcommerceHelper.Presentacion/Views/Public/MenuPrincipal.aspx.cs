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


            //if (usuarioentidad == null)
            //Response.Redirect("Default.aspx");


            // Cargo el repeater
            unServicios = (List<ServicioEntidad>)unServicioBLL.SelectALLServicios();
            InfoServicio.DataSource = unServicios;
            InfoServicio.DataBind();


        }
        // Lista de Deseo
        protected void BtnComprar_Click(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            UsuarioEntidad logueadoStatic;
             logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            
            ListaDeDeseoBLL unaListaDeseosBLL = new ListaDeDeseoBLL();
            ListaDeDeseoEntidad unaListaDeseo = new ListaDeDeseoEntidad();

            // El detalle está en encontrar el item padre del botón que se presionó
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            // Buscamos el control en ese item 
            Label lbl = (Label)item.FindControl("LblIdServicio");
            int IdServ = Int32.Parse(lbl.Text);

            // Carga la Lista de Deseos

            
                unaListaDeseo.NombreUsuario = logueadoStatic.Nombre;
                unaListaDeseo.NumeroDocumento = logueadoStatic.NumeroDocumento;
                unaListaDeseo.IdServicio = IdServ;
                unaListaDeseosBLL.ListaDeseosInsert(unaListaDeseo);






        }





    }


}


// FIN CLASE