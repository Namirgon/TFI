using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Entidades
{
    public class UsuarioEntidad
    {

        #region properties

        public int IdUsuario { get; set; }

        public TipoUsuarioEntidad MiUsuario { get; set; }

        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public TipoDeDocumentoEntidad MiDocumento { get; set; }

        public int NumeroDocumento { get; set; }

        public SexoEntidad MiSexo { get; set; }

        public List<DireccionEntidad > MiDireccion { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public TipoTelefonoEntidad MiTelefono { get; set; }

        public int NumeroTelefono { get; set; }

        #endregion
    }


    //public  RegistrarUsuario(UsuarioEntidad usuario)
    //{



    //}

}
