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

        public UsuarioEntidad _MiUsuario = new UsuarioEntidad();

        public UsuarioEntidad MiUsuario
        {
            get { return _MiUsuario; }
            set { _MiUsuario= value; }

        }

        //public List<ItemOrdenDeTrabajoEntidad> _MisOrdenes = new List<ItemOrdenDeTrabajoEntidad>();

        //public List<ItemOrdenDeTrabajoEntidad> MisOrdenes
        //{
        //    get { return _MisOrdenes; }
        //    set { _MisOrdenes = value; }

        //}


        public DateTime Fecha { get; set; }

        public int IdEstado { get; set; }

        #endregion
    }
}
