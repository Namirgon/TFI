using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
   public  class ListaDeDeseoEntidad
    {
        #region Properties
        /// <summary>
        /// Gets or sets the NuemeroDocumento value.
        /// </summary>
        public int NumeroDocumento{ get; set; }

        /// <summary>
        /// Gets or sets the NombreUsuario value.
        /// </summary>
        public string NombreUsuario { get; set; }

        /// <summary>
        /// Gets or sets the identifier servicio.
        /// </summary>
        public int IdServicio { get; set; }


     

        public int IdDeseo { get; set; }

        #endregion
    }
}
