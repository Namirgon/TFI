using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Shared
{
    public partial class PaginaMaestraAdministracion : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string nombre = Session["NomUsuario"].ToString();
                lblNombreUsuario.Text = " Hola " + nombre;

            }
            catch (Exception ex)
            {

                Response.Redirect("/Views/Public/Default.aspx");
            }
        }
    }
}