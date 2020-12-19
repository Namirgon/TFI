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
    public partial class NuestrosServicios : System.Web.UI.Page, IObservador
    {

        private List<object> ListaResultado = new List<object>(); //xxxxx
        HttpContext Current = HttpContext.Current; //xxxx
        List<MultiIdiomaEntidad> Traducciones = new List<MultiIdiomaEntidad>(); // xxxxx
        public NuestrosServicios() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Traducciones = new List<MultiIdiomaEntidad>();
                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;// xxxxxx este solo va en las paginas xxxxx
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