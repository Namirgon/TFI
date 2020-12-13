using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Entidades;
using static System.Net.Mime.MediaTypeNames;

namespace EcommerceHelper.Presentacion.Views.Public
{

    
    public partial class MenuPrincipal : System.Web.UI.Page, IObservador
    {
        public MenuPrincipal() : base()
        {
            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx

        }

        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx

        List<ServicioEntidad> unServicios = new List<ServicioEntidad>();
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        ServicioBLL gestorServicio = new ServicioBLL();
        IdiomaEntidad IdiomaSeleccionado = new IdiomaEntidad();

        protected void Page_Load(object sender, EventArgs e)
        {
            ServicioBLL unServicioBLL = new ServicioBLL();
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre= Session["NomUsuario"].ToString();

            IdiomaSeleccionado = (IdiomaEntidad)Current.Session["Idioma"];
            if (usuarioentidad == null)
                Response.Redirect("Default.aspx");


            // Cargo el repeater con los servicios en venta
            unServicios = (List<ServicioEntidad>)unServicioBLL.SelectALLServicios();
            InfoServicio.DataSource = unServicios;
            InfoServicio.DataBind();

            Traducciones = new List<MultiIdiomaEntidad>();
            
            Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;


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

                OrdenDeTrabajoEntidad = GestorODT.OrdenDeTrabajoActivas(LogueadoId);
                
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
                unServicio = gestorServicio.FindServicio(IdServ);
                unItem._MiServicio = new ServicioEntidad();
                unItem.Precio = unServicio.Precio;
                unItem._MiServicio.IdServicio = unServicio.IdServicio;

                unaListaItemBLL.ItemOrdenDeTrabajoInsert(unItem);

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
        void IObservador.Traducirme()
        {

            ListaResultado.Clear();
            RecorrerControles(this);



            Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

            try
            {

                foreach (Control Control in ListaResultado)
                {

                    foreach (var traduccion in Traducciones)
                    {



                        if (Equals(Control.ID, traduccion.NombreDelControl))
                        {
                            string tipo;
                            tipo = Control.GetType().ToString();
                            //ESTO SON LOS <a>
                            if (Control is Label lbltradu)
                            {

                                // var mapeo = (Label)Control;
                                lbltradu.Text = traduccion.Texto;
                                //  mapeo.InnerText = traduccion.Texto;
                            }
                            //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                            else if ((Control) is System.Web.UI.WebControls.TextBox)
                            {

                                var mapeo = (System.Web.UI.WebControls.TextBox)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if ((Control) is System.Web.UI.WebControls.IButtonControl)
                            {
                                var mapeo = (System.Web.UI.WebControls.Button)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if ((Control) is System.Web.UI.WebControls.LinkButton)
                            {
                                var mapeo = (System.Web.UI.WebControls.LinkButton)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            else if ((Control) is System.Web.UI.WebControls.TextBox)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputText)Control;
                                mapeo.Value = traduccion.Texto;
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


// FIN CLASE