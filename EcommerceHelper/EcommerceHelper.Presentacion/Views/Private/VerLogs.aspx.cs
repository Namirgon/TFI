using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.Funciones.Seguridad;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class VerLogs : System.Web.UI.Page
    {

        List<BitacoraEntidad> unosLogs = new List<BitacoraEntidad>();
        UsuarioEntidad UsuarioEntidad = new UsuarioEntidad();
        BitacoraBLL ManagerBitacora = new BitacoraBLL();
        HttpContext Current = HttpContext.Current;
        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            UsuarioEntidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!Page.IsPostBack)
            {




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
    }
}