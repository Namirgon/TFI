using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Seguridad;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class BackUp : System.Web.UI.Page
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
            string[] unosPermisosTest = new string[] { "BackUp" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Public/Default.aspx");
            }
        }

        protected void btnUpload_Click1(object sender, EventArgs e)
        {

            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            try
            {
              
                if (!string.IsNullOrWhiteSpace(txtNombreArchivo.Text))
                {
                    string nombre = txtNombreArchivo.Text.Trim() + ".bak";
                  
                    string ruta = Server.MapPath(@"../../Content/Files/" + nombre);
                    if (File.Exists(ruta))
                    {
                        File.Delete(ruta);
                    }
                    if (ServicioBackup.Respaldar( ruta))
                    {
                        ServicioLog.CrearLogEventos("Backup", "Backup realizado correctamente", usuarioentidad.Apellido ,(usuarioentidad.IdUsuario).ToString());
                        Current.Response.ContentType = "application/octet-stream";
                      
                        Current.Response.AppendHeader("Content-Disposition", "attachment; filename=\" "+nombre );
                    
                        Current.Response.TransmitFile(Server.MapPath(@"../../Content/Files/" + nombre));
                        Current.Response.Flush();
                       
                        Current.Response.SuppressContent = true;
                        Current.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        ServicioLog.CrearLogEventos("Backup", "Backup fallido", usuarioentidad.Apellido ,(usuarioentidad.IdUsuario).ToString());
                        sb.Append(@"<script type='text/javascript'>");
                      
                        sb.Append("alert('No pudo realizarse el backup');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "BackupFallido", sb.ToString(), false);
                    }
                }
                else
                {
                    sb.Append(@"<script type='text/javascript'>");
                  
                    sb.Append("alert('Complete el campo Nombre');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "CompletarNombre", sb.ToString(), false);
                }

            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "Backup", usuarioentidad.Apellido , (usuarioentidad.IdUsuario).ToString());
                Response.Redirect("/Shared/Error.aspx");
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
