using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
   public  class MultiIdiomaEntidad
    {

        #region properties

        public int IdMultiIdioma { get; set; }

        public IdiomaEntidad MiIdioma { get; set; }

        public string NombreDelControl { get; set; }

        public string Texto { get; set; }
        #endregion


       

    }
}
