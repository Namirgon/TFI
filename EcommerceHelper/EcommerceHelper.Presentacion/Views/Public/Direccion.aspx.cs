﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.Entidades;
using EcommerceHelper.BLL;
using System.Globalization;
using System.Text;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Direccion : System.Web.UI.Page
    {
        private UsuarioBLL unManagerUsuario = new UsuarioBLL();
        public List<ProvinciaEntidad> unasProvincias = new List<ProvinciaEntidad>();

        public DireccionEntidad UnaDireccion = new DireccionEntidad();
        private DireccionBLL UnManagerDireccion = new DireccionBLL();
        private TipoDomicilioBLL unManagerTipoDomicilio = new TipoDomicilioBLL();
        public List<TipoDireccionEntidad> unTipoDireccion = new List<TipoDireccionEntidad>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {

                cargarProvincias();
                cargarLocalidades();
                cargarTipodeDireccion();
            }

        }
        public void cargarTipodeDireccion()
        {
            DDLTipodeDireccion.DataSource = null;
            unTipoDireccion = unManagerTipoDomicilio.SelectALLTipoDomicilio();
            DDLTipodeDireccion.DataSource = unTipoDireccion;
            DDLTipodeDireccion.DataValueField = "IdTipoDireccion";
            DDLTipodeDireccion.DataTextField = "Descripcion";
            DDLTipodeDireccion.DataBind();

        }
        public void cargarProvincias(int? elIndice = null)
        {
            ddProvincia.DataSource = null;
            unasProvincias = unManagerUsuario.SelectALLProvincias();
            ddProvincia.DataSource = unasProvincias;
            ddProvincia.DataValueField = "IdProvincia";
            ddProvincia.DataTextField = "Descripcion";
            ddProvincia.DataBind();
            if (elIndice != null)
                ddProvincia.SelectedIndex = (int)elIndice;
        }

        public void cargarLocalidades()
        {
            ddLocalidad.DataSource = null;
            ddLocalidad.DataSource = unasProvincias.Find(X => X.IdProvincia == (int.Parse(ddProvincia.SelectedValue))).misLocalidades;
            ddLocalidad.DataValueField = "IdLocalidad";
            ddLocalidad.DataTextField = "Descripcion";
            ddLocalidad.DataBind();
        }

        protected void ddProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int aux = Int32.Parse(ddProvincia.SelectedValue);
                aux--;
                cargarProvincias(aux);
                cargarLocalidades();

            }
        }


        protected void btnNuevaDireccion_Click(object sender, EventArgs e)
        {
            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            int numeroIdUsuario = logueadoStatic.IdUsuario;
            try
            {
                
                if (Page.IsValid)

                {
                    //Direccion
                    UnaDireccion.Calle = txtCalle.Text;
                    UnaDireccion.Numero = Int32.Parse(txtNumero.Text);
                    UnaDireccion.Piso = txtPiso.Text;
                    UnaDireccion.Departamento = txtDepartamento.Text;
                    UnaDireccion.MiProvincia = new ProvinciaEntidad();
                    UnaDireccion.MiProvincia.IdProvincia = Int32.Parse(ddProvincia.SelectedValue);
                    UnaDireccion.MiLocalidad = new LocalidadEntidad();
                    UnaDireccion.MiLocalidad.IdLocalidad = Int32.Parse(ddLocalidad.SelectedValue);
                    UnaDireccion._MiTipoDireccion = new TipoDireccionEntidad();
                    UnaDireccion._MiTipoDireccion.IdTipoDireccion = Int32.Parse(DDLTipodeDireccion.SelectedValue);

                    unManagerUsuario.InsertDireccionDeFacturacion(UnaDireccion, logueadoStatic );

                    limpiarCampos();
                    EcommerceHelper.Funciones.Seguridad.ServicioLog.CrearLogEventos("Nueva Direccion", "Ingreso nueva direccion: " + logueadoStatic.Apellido, "creada correctamente", (logueadoStatic.IdUsuario).ToString());
                    Response.Redirect("MisDirecciones.aspx");
                }
            
             
                else
                {
                   
                    
                }

            }
            catch(Exception ex)
            {
                EcommerceHelper.Funciones.Seguridad.ServicioLog.CrearLog(ex, "Nueva Direccion", logueadoStatic.Apellido, (logueadoStatic.IdUsuario).ToString());
                Response.Redirect("/Shared/Error.aspx");

            }
        }

        public void limpiarCampos()
        {

            ddLocalidad.SelectedIndex = 0;
            ddProvincia.SelectedIndex = 0;
            txtCalle.Text = string.Empty;
            txtNumero.Text = string.Empty;
            txtPiso.Text = string.Empty;
            txtDepartamento.Text = string.Empty;

        }
    }

}