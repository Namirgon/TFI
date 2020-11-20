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

        public override int IdDVV { get; set; }

       
        public static string CarlcularDigitoUsuario(UsuarioEntidad unUsuario)
        {

            string cadena =  unUsuario.Nombre + unUsuario.Apellido + unUsuario.NumeroDocumento + unUsuario.Email + unUsuario.NumeroTelefono;
            double resultado=0;

            foreach ( char  c in cadena)
            {

                resultado += char.GetNumericValue(c);

            }

            return resultado.ToString();
        }

       
    }
}
