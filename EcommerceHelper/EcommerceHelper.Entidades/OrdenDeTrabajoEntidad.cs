using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
    public class OrdenDeTrabajoEntidad
    {
        #region properties
        public int IdOrdenDeTrabajo { get; set; }

        public int IdUsuario { get; set; }



        public DateTime Fecha { get; set; }

        public int IdEstado { get; set; }

        #endregion
    }
}
