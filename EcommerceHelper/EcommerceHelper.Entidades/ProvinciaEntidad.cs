using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
    public class ProvinciaEntidad
    {

        #region properties
        public int IdProvincia { get; set; }


        public string Descripcion { get; set; }

        public List<LocalidadEntidad> misLocalidades { get; set; }
        #endregion
    }
}
