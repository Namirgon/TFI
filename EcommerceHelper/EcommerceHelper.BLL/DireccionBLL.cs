using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.DAL;


namespace EcommerceHelper.BLL
{
    public class DireccionBLL
    {
       
       

        private LocalidadDAL GestorLocalidad = new LocalidadDAL();
        private ProvinciaDAL GestorProvincia = new ProvinciaDAL();
        private TipoDomicilioDAL GestorTipoDomicilio = new TipoDomicilioDAL();

        private DireccionDAL UnaDireccion = new DireccionDAL();

        public List<ProvinciaEntidad> SelectALLProvincias()
        {
            List<ProvinciaEntidad> unasProv = new List<ProvinciaEntidad>();
            unasProv = GestorProvincia.SelectAll();
            List<LocalidadEntidad> unasLocal = new List<LocalidadEntidad>();
            unasLocal = GestorLocalidad.LocalidadSelectAll();
            unasProv.ForEach(X => X.misLocalidades = unasLocal.Where(y => y.MiProvincia.IdProvincia == X.IdProvincia).ToList());
            return unasProv;
        }
        public List<TipoDireccionEntidad> SelectALLTipoDomicilio()
        {
            TipoDomicilioBLL GestorTipoDomicilio = new TipoDomicilioBLL();

            return GestorTipoDomicilio.SelectALLTipoDomicilio();


            //return DalDeProvincia.SelectAll();
        }

        public List<DireccionEntidad> ListarDirecciones (int IdUsuario)
        {
            return UnaDireccion.ListarDireccionesDAL (IdUsuario);

        }
        public List<DireccionEntidad> ListarDireccionesPedido(int IdItemOrdenDeTrabajo)
        {
            return UnaDireccion.ListarDireccionesPedido(IdItemOrdenDeTrabajo);

        }

    }
}
