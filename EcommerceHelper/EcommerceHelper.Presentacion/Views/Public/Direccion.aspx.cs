using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.Entidades;
using EcommerceHelper.BLL;
using System.Globalization;
using System.Text;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class Direccion : System.Web.UI.Page
    {
        private UsuarioBLL unManagerUsuario = new UsuarioBLL();
        public List<ProvinciaEntidad> unasProvincias = new List<ProvinciaEntidad>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack){

                cargarProvincias();
                cargarLocalidades();
            }

        }

        public void cargarProvincias(int? elIndice = null)
        {
            ddProvincia.DataSource = null;
            unasProvincias = unManagerUsuario.SelectALLProvincias();
            ddProvincia.DataSource = unasProvincias;
            ddProvincia.DataValueField = "IdProvincia";
            ddProvincia.DataTextField = "Descripcion";
            ddProvincia.DataBind();
            if (elIndice != null)
                ddProvincia.SelectedIndex = (int)elIndice;
        }

        public void cargarLocalidades()
        {
            ddLocalidad.DataSource = null;
            ddLocalidad.DataSource = unasProvincias.Find(X => X.IdProvincia == (int.Parse(ddProvincia.SelectedValue))).misLocalidades;
            ddLocalidad.DataValueField = "IdLocalidad";
            ddLocalidad.DataTextField = "Descripcion";
            ddLocalidad.DataBind();
        }

        protected void ddProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int aux = Int32.Parse(ddProvincia.SelectedValue);
                aux--;
                cargarProvincias(aux);
                cargarLocalidades();

            }
        }

       
    }
}