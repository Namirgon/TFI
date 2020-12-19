using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
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
    public partial class Restaurar : System.Web.UI.Page, IObservador
    {

        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
       
        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public Restaurar() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!Page.IsPostBack)
            {

                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

            }
            string[] unosPermisosTest = new string[] { "Restaurar" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Private/MenuAdministracion.aspx");
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
                        if (File.Exists(Path.GetFullPath(@"/Program Files/Microsoft SQL Server/MSSQL14.SQLEXPRESS01/MSSQL/Backup/" + filePath.Trim())))

                        //  if (File.Exists(Server.MapPath(@"../../Content/Files/" + filePath.Trim())))
                        {
                            // File.Delete(Server.MapPath(@"../../Content/Files/" + filePath.Trim()));
                            File.Delete(Path.GetFullPath(@"/Program Files/Microsoft SQL Server/MSSQL14.SQLEXPRESS01/MSSQL/Backup/" + filePath.Trim()));
                        }

                        //fileUpload.PostedFile.SaveAs(Server.MapPath(@"../../Content/Files/" + filePath.Trim()));
                        fileUpload.PostedFile.SaveAs(Path.GetFullPath(@"/Program Files/Microsoft SQL Server/MSSQL14.SQLEXPRESS01/MSSQL/Backup/" + filePath.Trim()));

                       // if (!ServicioBackup.Restaurar(NombreBD, Server.MapPath(@"../../Content/Files/" + filePath.Trim())))
                            if (!ServicioBackup.Restaurar(NombreBD, Path.GetFullPath(@"/Program Files/Microsoft SQL Server/MSSQL14.SQLEXPRESS01/MSSQL/Backup/" + filePath.Trim())))
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
                          
                          //  Response.Redirect("../Views/Private/MenuAdministracion.aspx");
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
            Response.Redirect("/Views/Private/MenuAdministracion.aspx");
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
