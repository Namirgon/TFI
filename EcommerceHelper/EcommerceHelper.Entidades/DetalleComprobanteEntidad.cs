using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
   public  class DetalleComprobanteEntidad
    {
        #region properties

        public int IdDetalleComprobante { get; set; }


        public ComprobanteEntidad MiComprobante { get; set; }

        public TipoComprobanteEntidad MiTipoComprobante { get; set; }

        public SucursalEntidad MiSucursal { get; set; }

        public ServicioEntidad MiServicio { get; set; }


        public decimal PrecioUnitario { get; set; }


        #endregion
    }
}
