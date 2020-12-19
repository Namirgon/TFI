using EcommerceHelper.Entidades;
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
using EcommerceHelper.Presentacion.Shared;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Default : System.Web.UI.Page, IObservador
    {
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
       
        IdiomaEntidad IdiomaSeleccionado = new IdiomaEntidad();
        private IdiomaEntidad idioma;
        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public Default() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }



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
           

            EcommerceHelper.Presentacion.Shared.PaginaMaestra p = (EcommerceHelper.Presentacion.Shared.PaginaMaestra)this.Master;
            idioma = new IdiomaEntidad();
            if (!IsPostBack)
            {

                //idioma = (IdiomaEntidad)Session["Idioma"];
                //if (idioma == null)
                //{
                //    idioma = new IdiomaEntidad();
                //    idioma.Descripcion = "Español";
                //    Session["Idioma"] = idioma;
                //}
                Traducciones = new List<MultiIdiomaEntidad>();
             
                 Traducciones=   IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

            }
            else
            {

                // crear ddl de idioma en master page administracion 

              //idioma.Descripcion = Master.ElegirIdioma();
             //  Session["Idioma"] = idioma;

            }
            //DropDownList lblIdioma = FindControlFromMaster<DropDownList>("ddlIdioma");
            //if (lblIdioma != null)
            //{
            //    lblIdioma.SelectedValue = idioma.Descripcion;
            //}




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
                                var mapeo = (IButtonControl )Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if ((Control) is LinkButton)
                            {
                                var mapeo = (LinkButton)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            else if (Control is Button  )
                            {
                                var mapeo = (Button )Control;
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


        protected void btnComprar_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuestrosServicios.aspx");
        }



    }
}