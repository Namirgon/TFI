﻿using Entidades.Servicios.Permisos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades.Servicios.Permisos;
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

        public int NumeroTelefono { get; set; }

        public int IdUsuarioTipo { get; set; }
        public DigitoVerificadorH DVH { get; set; }

        #endregion

        public List<ListaDeDeseoEntidad> misDeseos { get; set; }
       

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
