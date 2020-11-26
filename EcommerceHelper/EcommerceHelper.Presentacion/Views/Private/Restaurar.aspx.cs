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
    public partial class Restaurar : System.Web.UI.Page
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
            string[] unosPermisosTest = new string[] { "Restaurar" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Public/Default.aspx");
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {


            string filePath = string.Empty;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            try
            {
                string NombreBD = Request["txtNombreBD"];
                if (!string.IsNullOrWhiteSpace(NombreBD))
                {
                    if (fileUpload.HasFile)
                    {
                        string fileExt = System.IO.Path.GetExtension(fileUpload.FileName);
                        if (fileExt.ToLower() != ".bak")
                        {
                            lblMsg.Text = "Únicamente se permiten archivos .bak";
                            lblMsg.ForeColor = System.Drawing.Color.Red;
                            return;
                        }
                        filePath = fileUpload.PostedFile.FileName;
                        if (File.Exists(Server.MapPath(@"../../Content/Files/" + filePath.Trim())))
                        {
                            File.Delete(Server.MapPath(@"../../Content/Files/" + filePath.Trim()));
                        }
                        fileUpload.PostedFile.SaveAs(Server.MapPath(@"../../Content/Files/" + filePath.Trim()));

                        if (!ServicioBackup.Restaurar(NombreBD, Server.MapPath(@"../../Content/Files/" + filePath.Trim())))
                        {
                            ServicioLog.CrearLogEventos("Restaurar", "Restauración fallida", usuarioentidad.Apellido,(usuarioentidad.IdUsuario).ToString());
                            sb.Append(@"<script type='text/javascript'>");
                            sb.Append("alert('No pudo restaurarse la base de datos');");
                            sb.Append(@"</script>");
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                       "RestauracionOK", sb.ToString(), false);
                        }
                        else
                        {
                            ServicioLog.CrearLogEventos("Restaurar", "Restauración realizada correctamente", usuarioentidad.Apellido ,(usuarioentidad.IdUsuario).ToString());
                            Session.Abandon();
                          
                            Response.Redirect("../../Private/MenuAdministracion.aspx", false);
                        }
                    }
                    else
                    {
                        sb.Append(@"<script type='text/javascript'>");
                        sb.Append("alert('Seleccione el archivo .bak');");
                        sb.Append(@"</script>");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                   "FaltaRuta", sb.ToString(), false);
                    }
                }
                else
                {
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("alert('Ingrese el nombre de la base de datos');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "IngresarNombreBD", sb.ToString(), false);
                }

            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "Restaurar", usuarioentidad.Apellido , (usuarioentidad.IdUsuario).ToString());               
                Response.Redirect("../../Shared/Error.aspx");
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../Private/MenuAdministracion.aspx");
        }
    }
}
