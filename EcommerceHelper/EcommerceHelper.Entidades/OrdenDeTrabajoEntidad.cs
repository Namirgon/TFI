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

        public UsuarioEntidad MiUsuario { get; set; }


        public string Detalle { get; set; }

        public DateTime Fecha { get; set; }

        #endregion
    }
}
