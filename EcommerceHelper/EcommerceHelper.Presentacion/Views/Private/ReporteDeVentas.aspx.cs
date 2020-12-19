using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Entidades;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class ReporteDeVentas : System.Web.UI.Page
    {

        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        
        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx

        //public ReporteDeVentas() : base()
        //{



        //   IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();


            if (!Page.IsPostBack)
            {

                //Traducciones = new List<MultiIdiomaEntidad>();

                //Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

            }
            string[] unosPermisosTest = new string[] { "ReporteDeVentas" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Private/MenuAdministracion.aspx");
            }
        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {


                     if (FechaInicio.Text == "" || FechaFin.Text == "")
                     {
                          LbMensaje.Text = "Debe seleccionar fechas";
                          LbMensaje.Visible = true;


                     }

            else
            {


                LbMensaje.Visible = false;


                DateTime FechaInicioReporte = DateTime.Parse(FechaInicio.Text);
                DateTime FechaFinReporte = DateTime.Parse(FechaFin.Text);
                ReporteBLL GestorReporte = new ReporteBLL();
             List<ReporteDeVentasEntidad> ve = new List<ReporteDeVentasEntidad>();

             ve=  GestorReporte.ReporteEntreFechas(FechaInicioReporte, FechaFinReporte);



            ReportViewer1.LocalReport.DataSources.Clear();

            ReportDataSource ds = new ReportDataSource("ReporteEntreFechas", ve);

            ReportViewer1.LocalReport.DataSources.Add(ds);

            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = "Reportventas.rdlc";
            ReportViewer1.LocalReport.Refresh();

            }

        }

        protected void BtnPdf_Click(object sender, EventArgs e)
        {
            ExportarPDF();
           
        }

        private void ExportarPDF()
        {



            if (FechaInicio.Text == "" || FechaFin.Text == "")
            {
                LbMensaje.Text = "Debe seleccionar fechas";
                LbMensaje.Visible = true;


            }

            else
            {


                LbMensaje.Visible = false;

                DateTime FechaInicioReporte = DateTime.Parse(FechaInicio.Text);
                DateTime FechaFinReporte = DateTime.Parse(FechaFin.Text);

                ReporteBLL GestorReporte = new ReporteBLL();
                List<ReporteDeVentasEntidad> ve = new List<ReporteDeVentasEntidad>();

                Warning[] warnings;
                string[] streamIds;
                string contentType;
                string encoding;
                string extension;
                string deviceInfo = @"<DeviceInfo>
                      <OutputFormat>EMF</OutputFormat>
                      <PageWidth>8.5in</PageWidth>
                      <PageHeight>11in</PageHeight>
                      <MarginTop>0.25in</MarginTop>
                      <MarginLeft>0.25in</MarginLeft>
                      <MarginRight>0.25in</MarginRight>
                      <MarginBottom>0.25in</MarginBottom>
                    </DeviceInfo>";


                ve = GestorReporte.ReporteEntreFechas(FechaInicioReporte, FechaFinReporte);

                ReportDataSource ds = new ReportDataSource("ReporteEntreFechas", ve);
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = "Reportventas.rdlc";
                ReportViewer1.LocalReport.DataSources.Add(ds);
                ReportViewer1.LocalReport.Refresh();

                //Export the RDLC Report to Byte Array.
                byte[] bytes = ReportViewer1.LocalReport.Render("PDF", deviceInfo, out contentType, out encoding, out extension, out streamIds, out warnings);

                //Download the RDLC Report in Word, Excel, PDF and Image formats.
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = contentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=RDLC." + extension);
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.End();

            }
        }
       

        protected void BtnExcel_Click(object sender, EventArgs e)
        {
            ExportarExcel();
        }

        private void ExportarExcel()
        {


            if (FechaInicio.Text == "" || FechaFin.Text == "")
            {
                LbMensaje.Text = "Debe seleccionar fechas";
                LbMensaje.Visible = true;


            }

            else
            {


                LbMensaje.Visible = false;

                DateTime FechaInicioReporte = DateTime.Parse(FechaInicio.Text);
                DateTime FechaFinReporte = DateTime.Parse(FechaFin.Text);

                ReporteBLL GestorReporte = new ReporteBLL();
                List<ReporteDeVentasEntidad> ve = new List<ReporteDeVentasEntidad>();

                Warning[] warnings;
                string[] streamIds;
                string contentType;
                string encoding;
                string extension;
                string deviceInfo = @"<DeviceInfo>
                      <OutputFormat>EMF</OutputFormat>
                      <PageWidth>8.5in</PageWidth>
                      <PageHeight>11in</PageHeight>
                      <MarginTop>0.25in</MarginTop>
                      <MarginLeft>0.25in</MarginLeft>
                      <MarginRight>0.25in</MarginRight>
                      <MarginBottom>0.25in</MarginBottom>
                    </DeviceInfo>";


                ve = GestorReporte.ReporteEntreFechas(FechaInicioReporte, FechaFinReporte);

                ReportDataSource ds = new ReportDataSource("ReporteEntreFechas", ve);
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = "Reportventas.rdlc";
                ReportViewer1.LocalReport.DataSources.Add(ds);
                ReportViewer1.LocalReport.Refresh();

                //Export the RDLC Report to Byte Array.
                byte[] bytes = ReportViewer1.LocalReport.Render("EXCEL", deviceInfo, out contentType, out encoding, out extension, out streamIds, out warnings);

                //Download the RDLC Report in Word, Excel, PDF and Image formats.
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = contentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=RDLC." + extension);
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.End();

            }
        }

        
        //void IObservador.Traducirme()
        //{

        //    ListaResultado.Clear();
        //    RecorrerControles(this);



        //    Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

        //    try
        //    {

        //        foreach (Control Control in ListaResultado)
        //        {
                   
        //            foreach (var traduccion in Traducciones)
        //            {



        //                if (Equals(Control.ID, traduccion.NombreDelControl))
        //                {
                            
        //                    //ESTO SON LOS <a>
        //                    if (Control is Label lbltradu)
        //                    {

        //                        lbltradu.Text = traduccion.Texto;
                         
        //                    }
        //                    //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
        //                    else if (Control is TextBox)
        //                    {

        //                        var mapeo = (TextBox)Control;
        //                        mapeo.Text = traduccion.Texto;
        //                    }
        //                    //ESTOS SON LOS <BUTTON>
        //                    else if (Control is IButtonControl)
        //                    {
        //                        var mapeo = (IButtonControl )Control;
        //                        mapeo.Text = traduccion.Texto;
        //                    }
        //                    //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
        //                    else if ((Control) is LinkButton)
        //                    {
        //                        var mapeo = (LinkButton)Control;
        //                        mapeo.Text = traduccion.Texto;
        //                    }
        //                    else if (Control is Button  )
        //                    {
        //                        var mapeo = (Button )Control;
        //                        mapeo.Text = traduccion.Texto;
        //                    }

        //                }

        //            }

        //        }

        //    }
        //    catch (Exception es)
        //    {
        //        throw;
        //    }

        //}
        //private void RecorrerControles(Control pObjetoContenedor)
        //{
        //    foreach (Control Controlobj in pObjetoContenedor.Controls)
        //    {
        //        ListaResultado.Add(Controlobj);


        //        if (Controlobj.Controls.Count > 0)
        //        {
        //            RecorrerControles(Controlobj);
        //        }

        //        ListaResultado.Add(Controlobj);
        //    }
        //}

        //private void RecorrerDropDown(System.Web.UI.WebControls.DropDownList pMenuStrip)
        //{
        //    ListaResultado.Add(pMenuStrip);
        //    foreach (System.Web.UI.WebControls.ListItem item in pMenuStrip.Items)
        //    {
        //        ListaResultado.Add(item);
        //    }


        //}

    }
}