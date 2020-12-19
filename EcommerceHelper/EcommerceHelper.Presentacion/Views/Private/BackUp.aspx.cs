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
    public partial class BackUp : System.Web.UI.Page, IObservador
    {


        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
      

        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public BackUp() : base()
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
            string[] unosPermisosTest = new string[] { "BackUp" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Private/MenuAdministracion.aspx");
            }
        }

        protected void btnUpload_Click1(object sender, EventArgs e)
        {
            //Resguardo resg = new Resguardo();
            //    resg.Usuario = (Usuario) Session["usuario"];
            //    resg.Fecha = DateTime.Now;
            //    resg.Tipo = "BackUP";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            try
            {
              
                if (!string.IsNullOrWhiteSpace(txtNombreArchivo.Text))
                {
                    string nombre = txtNombreArchivo.Text.Trim() + ".bak";
                    //Directory directorio;
                    //directorio.CreateDirectory(path);

                    //C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\Backup
                    string ruta = Path.GetFullPath(@"/Program Files/Microsoft SQL Server/MSSQL14.SQLEXPRESS01/MSSQL/Backup/" + nombre);
                    //if (!Directory.Exists(ruta))
                    //{
                    //    Directory.CreateDirectory(ruta);
                    //}
                    //string nombre = "backUp-" + DateTime.Now.ToString("dd-MM-yyyy-hhmmss") + ".bak";
                    //resg.Nombre = nombre;
                    //resg.Path = path;
                    //string pathCompleto = objeto.Path + objeto.Nombre;
                    //string ruta = Path.GetFullPath(@"/Windows/Backup/" + nombre);
                    if (File.Exists(ruta))
                    {
                        File.Delete(ruta);
                    }
                    //if (ServicioBackup.Respaldar(ruta))

                    if (ServicioBackup.Respaldar(ruta))
                    {
                        ServicioLog.CrearLogEventos("Backup", "Backup realizado correctamente", usuarioentidad.Apellido ,(usuarioentidad.IdUsuario).ToString());
                        //// Current.Response.ContentType = "application/octet-stream";

                        //// Current.Response.AppendHeader("Content-Disposition", "attachment; filename=\" "+nombre );

                        //// Current.Response.TransmitFile(Path.GetFullPath(@" / Program Files / Microsoft SQL Server / MSSQL14.SQLEXPRESS01 / MSSQL / Backup" + nombre));
                        ////// Current.Response.TransmitFile(Server.MapPath(@"../../Content/Files/" + nombre));
                        //// Current.Response.Flush();

                        //// Current.Response.SuppressContent = true;
                        //// Current.ApplicationInstance.CompleteRequest();
                        txtNombreArchivo.Text = string.Empty;
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
                Response.Redirect("/Shared/ErrorAdmin.aspx");
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
          
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

        protected void Cancelar_Click(object sender, EventArgs e)
        {
           // txtNombreArchivo.Text = string.Empty;
          
        }

        protected void Cancelar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("../Private/MenuAdministracion.aspx");
        }
    }
}
