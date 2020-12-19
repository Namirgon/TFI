using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.Funciones.Seguridad;
using EcommerceHelper.BLL.Servicios;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class VerLogs : System.Web.UI.Page , IObservador
    {

        List<BitacoraEntidad> unosLogs = new List<BitacoraEntidad>();
        UsuarioEntidad UsuarioEntidad = new UsuarioEntidad();
        BitacoraBLL ManagerBitacora = new BitacoraBLL();
        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public VerLogs() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            UsuarioEntidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!Page.IsPostBack)
            {

                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;



            }
            string[] unosPermisosTest = new string[] { "Bitacora" };
            if (UsuarioEntidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Private/MenuAdministracion.aspx");
            }

        }
        protected void grillaLogs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grillaLogs.PageIndex = e.NewPageIndex;
            unosLogs = ManagerBitacora.BitacoraVerLogs(idelTIpoLog.Value, DateTime.Parse(elIdFechaInicio.Value), DateTime.Parse(elIdFechaFin.Value));
            grillaLogs.DataSource = null;
            grillaLogs.DataSource = unosLogs;
            grillaLogs.DataBind();
        }

        protected void btnFiltrarLogs_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            try
            {
                if (string.IsNullOrWhiteSpace(elIdFechaInicio.Value) | string.IsNullOrWhiteSpace(elIdFechaFin.Value))
                {
                    sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("$('#currentdetail').modal('show');");
                    sb.Append("alert('Deben completarse ambas fechas');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "CompletarFechas", sb.ToString(), false);
                }
                else
                {
                    DateTime unaFechaInicio = DateTime.Parse(elIdFechaInicio.Value);
                    DateTime unaFechaFin = DateTime.Parse(elIdFechaFin.Value);
                    if (unaFechaInicio > unaFechaFin | unaFechaInicio < DateTime.Parse("1990/01/01") | unaFechaFin > DateTime.Parse("2999/12/12"))
                    {
                        sb.Append(@"<script type='text/javascript'>");
                        //sb.Append("$('#currentdetail').modal('show');");
                        sb.Append("alert('La fecha de inicio debe ser menor que la fecha de fin');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "FechaInicioFin", sb.ToString(), false);
                    }
                    else
                    {
                        unosLogs = ManagerBitacora.BitacoraVerLogs(idelTIpoLog.Value, unaFechaInicio, unaFechaFin);
                        grillaLogs.DataSource = null;
                        grillaLogs.DataSource = unosLogs;
                        grillaLogs.DataBind();
                    }
                }
            }
            catch (Exception es)
            {
                ServicioLog.CrearLog (es, "Filtrar Logs", UsuarioEntidad.Apellido , (UsuarioEntidad.IdUsuario).ToString()  );
                Response.Redirect("Error.aspx");
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