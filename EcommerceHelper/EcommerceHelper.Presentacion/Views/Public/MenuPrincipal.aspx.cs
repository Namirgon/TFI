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
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();

        protected void Page_Load(object sender, EventArgs e)
        {
            ServicioBLL unServicioBLL = new ServicioBLL();
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];


            unServicios = (List<ServicioEntidad>)unServicioBLL.SelectALLServicios();
            InfoServicio.DataSource = unServicios;
            InfoServicio.DataBind();
        }
        // Lista de Deseos
        public static void AgregarDeseo(string  IdServicio)
        {

            var Current = HttpContext.Current;
            var logueadoStatic = (UsuarioEntidad)Current.Session["NomUsuario"];
            List<ListaDeDeseoEntidad> listaDeseosSesion = new List<ListaDeDeseoEntidad>();
            List<ServicioEntidad> unaListaServicios = new List<ServicioEntidad>();
            ListaDeDeseoBLL unaListaDeseosBLL = new ListaDeDeseoBLL();
            ListaDeDeseoEntidad unaListaDeseo = new ListaDeDeseoEntidad();
            ServicioBLL unServicioBLL = new ServicioBLL();

            unaListaServicios = (List<ServicioEntidad>)Current.Session["ListaDeseos"];

            unaListaDeseo.NumeroDocumento = logueadoStatic.NumeroDocumento;
            unaListaDeseo.NombreUsuario = logueadoStatic.Nombre;
            unaListaDeseo.IdServicio = Int32.Parse(IdServicio);

           // var cotizacionStatic = (MonedaEmpresaEntidad)Current.Session["Cotizacion"];
            //Guardar en BD el nuevo deseo
            if (unaListaDeseosBLL.ListaDeseosInsert(unaListaDeseo) > 0)
            {
                //Agregar el deseo a la sesión actual
                ServicioEntidad unServicioEntidad = new ServicioEntidad();
                // unProductoEntidad = unProductoCore.Find(unaListaDeseo.IdProducto, 1);
                unServicioEntidad= unServicioBLL.Find(unaListaDeseo.IdServicio);
                unaListaServicios.Add(unServicioEntidad);
                Current.Session["ListaDeseos"] = unaListaServicios;

            }

        }


    }

} // FIN CLASE