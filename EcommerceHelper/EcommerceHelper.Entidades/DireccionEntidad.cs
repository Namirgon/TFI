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

        public ProvinciaEntidad _MiProvincia = new ProvinciaEntidad();

        public ProvinciaEntidad MiProvincia
        {
            get { return _MiProvincia; }
            set { _MiProvincia = value; }

        }

        public LocalidadEntidad _MiLocalidad = new LocalidadEntidad();

     
        public LocalidadEntidad MiLocalidad {
                    
            get { return _MiLocalidad; }
            set { _MiLocalidad = value; }
        }


        public TipoDireccionEntidad _MiTipoDireccion = new TipoDireccionEntidad();

        public TipoDireccionEntidad MiTipoDireccion
        {
            get { return _MiTipoDireccion; }

            set { _MiTipoDireccion = value; }

        }




        #endregion
    }
}
