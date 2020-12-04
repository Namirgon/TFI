using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class ReporteDeEmpleado : System.Web.UI.Page
    {

        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();


            if (!Page.IsPostBack)
            {



            }
            string[] unosPermisosTest = new string[] { "ReporteDeEmpleado" };
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
                List<ReporteDeEmpleadoEntidad > ve = new List<ReporteDeEmpleadoEntidad>();

                ve = GestorReporte.ReporteEntreFechasEmpleado(FechaInicioReporte, FechaFinReporte);



                ReportViewer1.LocalReport.DataSources.Clear();

                ReportDataSource ds = new ReportDataSource("ReporteEmpleados", ve);

                ReportViewer1.LocalReport.DataSources.Add(ds);

                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = "ReportEmpleados.rdlc";
                ReportViewer1.LocalReport.Refresh();

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
                List<ReporteDeEmpleadoEntidad> ve = new List<ReporteDeEmpleadoEntidad>();

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


                ve = GestorReporte.ReporteEntreFechasEmpleado(FechaInicioReporte, FechaFinReporte);

                ReportDataSource ds = new ReportDataSource("ReporteEmpleados", ve);
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = "ReportEmpleados.rdlc";
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
                List<ReporteDeEmpleadoEntidad> ve = new List<ReporteDeEmpleadoEntidad>();

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


                ve = GestorReporte.ReporteEntreFechasEmpleado(FechaInicioReporte, FechaFinReporte);

                ReportDataSource ds = new ReportDataSource("ReporteEmpleados", ve);
                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = "ReportEmpleados.rdlc";
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


    }
}