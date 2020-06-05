using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
    public class DireccionEntidad
    {

        #region properties
        public int IdDireccion { get; set; }


        public string Calle { get; set; }

        public int Numero { get; set; }

        public string Piso { get; set; }

        public string Departamento { get; set; }

        public ProvinciaEntidad MiProvincia { get; set; }

        public int IdProvincia { get; set; }

        public LocalidadEntidad MiLocalidad { get; set; }

        public int IdLocalidad { get; set; }

        public TipoDireccionEntidad MiTipoDireccion { get; set; }

        public int IdTipoDireccion { get; set; }



        #endregion
    }
}
