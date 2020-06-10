using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class MenuPrincipal : System.Web.UI.Page
    {

        List<ServicioEntidad> unServicios = new List<ServicioEntidad>();
        protected void Page_Load(object sender, EventArgs e)
        {
            ServicioBLL unServicioBLL = new ServicioBLL();



            unServicios = (List<ServicioEntidad>)unServicioBLL.SelectALLServicios();
            InfoServicio.DataSource = unServicios;
            InfoServicio.DataBind();
        }


    }
}