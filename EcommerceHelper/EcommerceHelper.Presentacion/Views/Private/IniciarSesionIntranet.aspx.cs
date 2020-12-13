using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.DAL.Servicios;
using EcommerceHelper.Entidades;
using EcommerceHelper.Entidades.Servicios;
using EcommerceHelper.Funciones.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class IniciarSesionIntranet : System.Web.UI.Page, IObservador
    {
        private List<object> ListaResultado = new List<object>(); //xxxxx
        HttpContext Current = HttpContext.Current; //xxxx
        List<MultiIdiomaEntidad> Traducciones = new List<MultiIdiomaEntidad>(); // xxxxx
        
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        BLL.Managers.FamiliaBLL UnManagerFamilia = new BLL.Managers.FamiliaBLL();
        
        protected T FindControlFromMaster<T>(string name) where T : Control
        {
            MasterPage master = this.Master;
            while (master != null)
            {
                T control = master.FindControl(name) as T;
                if (control != null)
                    return control;

                master = master.Master;
            }
            return null;
        }

        public IniciarSesionIntranet() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Traducciones = new List<MultiIdiomaEntidad>();
                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;// xxxxxx este solo va en las paginas xxxxx
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




        protected void btnComprar_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuestrosServicios.aspx");
        }



    


public void RealizarLogueo(string elUsuario, string laClave)
        {
            UsuarioEntidad usuario = new UsuarioEntidad();
            usuario.Email = elUsuario;
            usuario.Password = laClave;


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            UsuarioBLL BLLUsuario = new UsuarioBLL();
            UsuarioEntidad usuario = new UsuarioEntidad();


            List<string> LisDVHs = new List<string>();

            var VerificarIntegridad = BLLUsuario.GenerarCadenaDVHTablaEntera();

            foreach (var Usuario  in  VerificarIntegridad )
            {

                LisDVHs.Add(DigitoVerificadorH.CarlcularDigitoUsuario(Usuario)); // en la lista esta cada uno de los horizontales calculados nuevamente



            }
            Double Acum = 0;
       
            foreach (var valor in LisDVHs) // por cada valor en la lista de cada digito horizontal lo voy sumando para obtener el vertical
            {
                Acum += Convert.ToDouble(valor);
            }

           
            //Acum = DVHBLL.ConsultarDVH();
           
            DVV SumaDVV = DVVDAL.SelectTablaUsuario();

            double DVVBD = Convert.ToDouble(SumaDVV.dvv); //traigo el digito vertical de la base

            if (Acum == DVVBD)
            {
                usuario = BLLUsuario.IniciarSesion(TXTEmail.Text, TXTPassword.Text);

                if (usuario != null)

                {

                    usuario.Familia = UnManagerFamilia.FamiliaSelectNombreFamiliaByIdUsuario(usuario.IdUsuario);
                    usuario.Permisos = BLLUsuario.UsuarioTraerPermisos(usuario.Email, usuario.IdUsuario);
                    Session["NomUsuario"] = usuario.Nombre;
                    Session["Usuario"] = usuario;
                    ServicioLog.CrearLogEventos("Logueo", "Logueo Correcto", usuario.Apellido, (usuario.IdUsuario).ToString());

                    Response.Redirect("/Views/Private/MenuAdministracion.aspx");
                }
                else
                {

                    Response.Write("<script>alert('usuario o clave incorrecta')</script>");
                    limpiarCampos();
                }
            }
            else if (Acum!=DVVBD)
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('La Base de datos se encuentra corrupta, comuniquese con su Administrador');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                           "AgregarClickMsj1", sb.ToString(), false);
           
            }

          
          

            
        }    

        public void limpiarCampos()
        {
           TXTEmail.Text = string.Empty;
          TXTPassword.Text = string.Empty;

        }           



    }



}
