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

        public ServicioEntidad _MiServicio = new ServicioEntidad();

        public ServicioEntidad MiServicio
        {
            get { return _MiServicio; }
            set { _MiServicio = value; }


        }

        public string  NombreUsuario { get; set; }

        public UsuarioEntidad _MiUsuario = new UsuarioEntidad();

        public UsuarioEntidad MiUsuario
        {
            get { return _MiUsuario; }
            set { _MiUsuario = value; }

        }

        public DireccionEntidad _MiDireccion = new DireccionEntidad();

        public DireccionEntidad MiDireccion
        {
            get { return _MiDireccion; }
            set { _MiDireccion = value; }

        }


        public OrdenDeTrabajoEntidad _MiOrdenDeTrabajo = new OrdenDeTrabajoEntidad();

        public OrdenDeTrabajoEntidad MiOrdenDeTrabajo
        {
            get { return _MiOrdenDeTrabajo; }
            set { _MiOrdenDeTrabajo = value; }

        }
        public decimal Precio { get; set; }

        public DateTime Fecha { get; set; }
        public DateTime Hora { get; set; }

        public int Cantidad { get; set; }


        #endregion
    }
}
