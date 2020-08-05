using EcommerceHelper.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.Entidades;

namespace EcommerceHelper.BLL
{
  public  class OrdenDeTrabajoBLL
    {

        private OrdenDeTrabajoDAL unaListaODTDAL = new OrdenDeTrabajoDAL();
        private OrdenDeTrabajoDAL GestorOrdenDeTrabajo = new OrdenDeTrabajoDAL();
        public int OrdenDeTrabajoInsert(OrdenDeTrabajoEntidad UnaOrden)
        {
            try
            {
                unaListaODTDAL.Insert(UnaOrden);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


        public int OrdenDeTrabajoUpdate(OrdenDeTrabajoEntidad unaOrden)
        {

            try
            {
                GestorOrdenDeTrabajo.FinalizarOrdenDeTrabajo(unaOrden);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public  OrdenDeTrabajoEntidad OrdenDeTrabajoActivas(int IdUsuario)
        {

            return unaListaODTDAL.SelectActivasByIdUsuario(IdUsuario);

        }
    }
}
