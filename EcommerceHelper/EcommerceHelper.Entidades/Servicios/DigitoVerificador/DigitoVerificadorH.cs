using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades.Servicios
{
    public class DigitoVerificadorH : BaseEntidad
    {
        public string DVH { get; set; }
        public DigitoVerificadorH()

        {

        }

        public override int Id { get; set; }

        public static string getDigitoEncriptado(object unObjeto)
        {
            string digitoAEncriptar = DVGReflection.GetDVH(unObjeto);
            EncriptarSHA256 e = new EncriptarSHA256(digitoAEncriptar);
            string digitoEncriptado = e.Hashear();
            return digitoEncriptado;
        }

    }
}
