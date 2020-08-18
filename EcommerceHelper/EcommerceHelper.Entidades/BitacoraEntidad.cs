using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
    public class BitacoraEntidad
    {
        #region properties
        /// <summary>
        /// Gets or sets the IdBitacoraLog value.
        /// </summary>
        public int IdBitacoraLog { get; set; }

        /// <summary>
        /// Gets or sets the CUIT value.
        /// </summary>
        public int IdUsuario { get; set; }

        /// <summary>
        /// Gets or sets the NombreUsuario value.
        /// </summary>
        public string NombreUsuario { get; set; }

        /// <summary>
        /// Gets or sets the Evento value.
        /// </summary>
        public string TipoLog { get; set; }

        public string Accion { get; set; }
        public string Mensaje { get; set; }

        /// <summary>
        /// Gets or sets the FechaEvento value.
        /// </summary>
        public DateTime Fecha { get; set; }

        #endregion

    }
}
