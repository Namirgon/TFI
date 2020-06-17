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

        public ServicioEntidad MiServicio { get; set; }

       

        public UsuarioEntidad MiUsuario { get; set; }

        public UsuarioEntidad MiDNI { get; set; }

        public DireccionEntidad MiDireccion { get; set; }
        public decimal Precio { get; set; }

        public DateTime Fecha { get; set; }
        public DateTime Hora { get; set; }


        #endregion
    }
}
