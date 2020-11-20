﻿using EcommerceHelper.Entidades;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

using System.Threading;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.BLL;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Default : System.Web.UI.Page , IObservador
    {
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        private List<object> ListaResultado = new List<object>(); //xxxxx
        IdiomaEntidad IdiomaSeleccionado = new IdiomaEntidad();

        List<MultiIdiomaEntidad> Traducciones   = new List<MultiIdiomaEntidad>(); // xxxxx



        protected T FindControlFromMaster<T>(string name) where T : Control
        {
            MasterPage master = this.Master;
            while (master != null)
            {
                T control = master.FindControl(name) as T;
                if (control != null)
                    return control;

                master = master.Master;
            }
            return null;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
               
            var Current = HttpContext.Current;
            EcommerceHelper.Presentacion.Shared.PaginaMaestra p = (EcommerceHelper.Presentacion.Shared.PaginaMaestra)this.Master;
          
            if (!IsPostBack)
            {
                //p.ElegirIdioma();
                //IdiomaSeleccionado.IdIdioma = Int32.Parse(ddlidioma.SelectedValue);
                //Session["Traducciones"] = IdiomaBLL.GetBLLServicioIdiomaUnico().DevuelverTodosLosTextos(IdiomaSeleccionado.IdIdioma);
                //Traducciones = (List<MultiIdiomaEntidad>)Current.Session["Traducciones"];
                //IdiomaBLL.GetBLLServicioIdiomaUnico().Traducir(IdiomaSeleccionado.IdIdioma);
                Traducciones = (List<MultiIdiomaEntidad>)Current.Session["Traducciones"]; // xxxxxx este solo va en las paginas xxxxx

                IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx

               
            }



        }

        void IObservador.Traducirme()
        {
            
            RecorrerControles(this);
         

            try
            {

                foreach (Control Control in ListaResultado)
                {

                    foreach (var traduccion in Traducciones )
                    {

                     

                        if (Equals(Control.ID, traduccion.NombreDelControl ))
                        {

                            //ESTO SON LOS <a>
                            if ((Control) is System.Web.UI.HtmlControls.HtmlAnchor)
                            {

                                var mapeo = (System.Web.UI.HtmlControls.HtmlAnchor)Control;
                                mapeo.InnerText = traduccion.Texto;
                            }
                            //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlInputControl)
                            {

                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputText)Control;
                                mapeo.Value = traduccion.Texto;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlButton)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlButton)Control;
                                mapeo.InnerText = traduccion.Texto;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlInputButton)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputButton)Control;
                                mapeo.Value = traduccion.Texto;
                            }
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlInputText)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputText)Control;
                                mapeo.Value = traduccion.Texto;
                            }

                        }

                    }

                }

            }
            catch
            {
            }

        }
        private void RecorrerControles(Control pObjetoContenedor)
        {
            foreach (Control Controlobj in pObjetoContenedor.Controls)
            {
                ListaResultado.Add(Controlobj);

                if ((Controlobj) is System.Web.UI.WebControls.DropDownList)
                {
                    RecorrerDropDown(((System.Web.UI.WebControls.DropDownList)Controlobj));
                }


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


        protected void btnComprar_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuestrosServicios.aspx");
        }



    }
}