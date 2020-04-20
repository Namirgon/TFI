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

        public UsuarioEntidad  MiUsuario { get; set; }

        public TipoTarjetaEntidad  MiTipoTarjeta { get; set;  }

        public string NombreTitular { get; set; }

        public int NumeroTarjeta { get; set; }

        public DateTime FechaVencimiento { get; set; }


        public int CodigoSeguridad { get; set; }

        #endregion
    }
}
