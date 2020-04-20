using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
    public class ServicioEntidad
    {

        #region properties
        public int IdServicio { get; set; }
        public string Titulo { get; set; } 
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }

        public string URLimagen { get; set; }


        #endregion
    }
}
