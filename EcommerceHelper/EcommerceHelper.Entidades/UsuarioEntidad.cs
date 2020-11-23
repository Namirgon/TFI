using Entidades.Servicios.Permisos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.Entidades.Servicios;

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

        public Int64 NumeroTelefono { get; set; }

        public int IdTipoUsuario { get; set; }
        public int  DVH { get; set; }

        #endregion

        
       

        private FamiliaEntidad _Familia = new FamiliaEntidad();

        public FamiliaEntidad Familia
        {
            get { return _Familia; }

            set { _Familia = value; }
            
        }


        private List<IFamPat> _Permisos = new List<IFamPat>();

        public List<IFamPat> Permisos
        {
            get { return _Permisos; }
            set { _Permisos = value; }
        }




       
    }



}
