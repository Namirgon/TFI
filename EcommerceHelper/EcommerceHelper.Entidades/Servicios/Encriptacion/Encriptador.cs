using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades.Servicios
{
  public abstract  class Encriptador: BaseEntidad

    {

        public string valorInicial;

        public string valorEncriptado;

        public abstract string Hashear();
    }
}
