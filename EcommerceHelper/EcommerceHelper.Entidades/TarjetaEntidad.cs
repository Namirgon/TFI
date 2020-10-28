using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
    public class TarjetaEntidad
    {
        #region Properties

        public int IdTarjeta { get; set; }

        public int  IdUsuario { get; set; }

        public TipoTarjetaEntidad  MiTipoTarjeta { get; set;  }

        public string NombreTitular { get; set; }

        public Int64 NumeroTarjeta { get; set; }

        public DateTime FechaVencimiento { get; set; }


        public int CodigoSeguridad { get; set; }

        #endregion
    }
}
