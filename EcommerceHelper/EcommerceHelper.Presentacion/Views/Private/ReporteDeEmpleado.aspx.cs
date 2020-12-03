using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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



                //ReportViewer1.LocalReport.DataSources.Clear();

                //ReportDataSource ds = new ReportDataSource("ReporteEmpleados", ve);

                //ReportViewer1.LocalReport.DataSources.Add(ds);

                //ReportViewer1.ProcessingMode = ProcessingMode.Local;
                //ReportViewer1.LocalReport.ReportPath = "Reportventas.rdlc";
                //ReportViewer1.LocalReport.Refresh();

            }



        }

        protected void BtnExcel_Click(object sender, EventArgs e)
        {

        }

        protected void BtnPdf_Click(object sender, EventArgs e)
        {

        }
    }
}