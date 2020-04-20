using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
   public class LocalidadEntidad
    {

        #region properties
        public int IdLocalidad { get; set; }

        public string Descripcion { get; set; }

        public ProvinciaEntidad MiProvincia { get; set; }
        #endregion
    }
}
