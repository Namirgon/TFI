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

        public int IdBitacora { get; set; }


        public string Email { get; set; }

        public DateTime Fecha { get; set; }

        public DateTime Hora { get; set; }

        public string Accion { get; set;}


        #endregion

    }
}
