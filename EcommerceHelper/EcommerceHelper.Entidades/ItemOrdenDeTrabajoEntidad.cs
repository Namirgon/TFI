using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
   public  class ItemOrdenDeTrabajoEntidad
    {

        #region properties

        public int IdItemOrdenDeTrabajo { get; set; }

        public ServicioEntidad MiServicio { get; set; }

        public OrdenDeTrabajoEntidad MiOrdenDeTrabajo { get; set; }

        public UsuarioEntidad MiUsuario { get; set; }

        public int Cantidad { get; set; }

        public decimal Precio { get; set; }


        #endregion
    }
}
