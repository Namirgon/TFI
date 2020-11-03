using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
   public  class ComprobanteEntidad
    {
        #region properties
        public int IdComprobante { get; set; }

        public TipoComprobanteEntidad MiTipoComprobante { get; set; }

        public SucursalEntidad MiSucursal { get; set; }

        public OrdenDeTrabajoEntidad MiOrdenDeTrabajo { get; set; }

        public DateTime Fecha { get; set; }

        public List<DetalleComprobanteEntidad> MisDetalleComprobante { get; set; }

        #endregion
    }
}
