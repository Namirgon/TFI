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

   
    public partial class Pago : BasePage
    {
        TarjetaBLL GestorTarjeta = new TarjetaBLL();
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!this.IsPostBack)
            {
               
               
                    CargarTarjetas();
                
            }
        }
        public void CargarTarjetas()
        {

            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            int numeroIdUsuario = logueadoStatic.IdUsuario;

            List<TarjetaEntidad> MisTarjetas = new List<TarjetaEntidad>();


            MisTarjetas = GestorTarjeta.ListarTarjetas(numeroIdUsuario);


            GVTarjetas.DataSource = null;
            GVTarjetas.DataSource = MisTarjetas;
            GVTarjetas.DataBind();


        }

        protected void btnAMBTarjeta_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMTarjetasDeCredito.aspx");
        }

        protected void GVTarjetas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Int32.Parse(GVTarjetas.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);



            TarjetaEntidad unaTarjeta;
            unaTarjeta = GestorTarjeta.Find(id);
            switch (e.CommandName)
            {

                case "btnSeleccionar":
                    {

                        Response.Write("<script>alert('Pago Exitoso')</script>");
                        break;
                    }
               
            }
        }
    }
}