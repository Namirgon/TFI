using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.BLL
{
   public  class BitacoraBLL
    {

        BitacoraDAL GestorBitacora = new BitacoraDAL();

        public List<BitacoraEntidad> BitacoraVerLogs(string unTipoLog, DateTime? fechaInicio = null, DateTime? fechaFin = null)
        {
            try
            {
                return GestorBitacora.BitacoraVerLogs(unTipoLog, fechaInicio, fechaFin);
            }
            catch (Exception es)
            {
                throw;
            }
        }
    }
}
