using System;
using EcommerceHelper.Entidades;
using EcommerceHelper.DAL;
using System.Collections.Generic;

namespace EcommerceHelper.BLL
{
    public class UsuarioBLL
    {
        private ProvinciaDAL _dalProvicia;
        private UsuarioDAL _DalUsuario;// el campo "UsuarioBLL _DalUsuario " nunca se asigna y siempre tendra el valor predeterminado null
        public UsuarioBLL()
        {
           
            _dalProvicia = new ProvinciaDAL();
            _DalUsuario = new UsuarioDAL();
        }
        public UsuarioEntidad IniciarSesion(string Email, string Password) 
        {

            try
            {

                return _DalUsuario.BuscarUsuario(Email, Password);
              
            }
            catch (Exception ex)
            {
                throw ex;

            }

          
        }
        public List<ProvinciaEntidad> SelectALLProvincias()
        {
            DireccionBLL ManagerDireccion = new DireccionBLL();
            return ManagerDireccion.SelectALLProvincias();
            //return DalDeProvincia.SelectAll();
        }

        public List<SexoEntidad> SelectALLSexos()
        {
            SexoBLL ManagerSexo = new SexoBLL();
            return ManagerSexo.SelectALLSexos();
            //return DalDeProvincia.SelectAll();
        }

    }
}
