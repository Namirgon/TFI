using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
   public  class ReciboEntidad
    {

        #region Properties

        public int IdRecibo { get; set; }

        public OrdenDeTrabajoEntidad MiOrdenDeTrabajo { get; set; }


        public DateTime Fecha { get; set; }

        public FormaDePagoEntidad MiFormaDePago { get; set; }

        public decimal Importe { get; set; }
        #endregion
    }
}
