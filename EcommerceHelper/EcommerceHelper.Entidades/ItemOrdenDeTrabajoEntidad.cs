using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
    public class ItemOrdenDeTrabajoEntidad
    {

        #region properties

        public int IdItemOrdenDeTrabajo { get; set; }

        public int IdServicio { get; set; }

       

        public string  NombreUsuario { get; set; }

        public int IdUsuario { get; set; }

        public int  IdDireccion { get; set; }


        public int IdOrdenDeTrabajo { get; set; }
        public decimal Precio { get; set; }

        public DateTime Fecha { get; set; }
        public DateTime Hora { get; set; }


        #endregion
    }
}
