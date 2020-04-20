using System;
using EcommerceHelper.Entidades;
using EcommerceHelper.DAL;
namespace EcommerceHelper.BLL
{
    public class UsuarioBLL
    {

        private UsuarioDAL _DalUsuario;// el campo "UsuarioBLL _DalUsuario " nunca se asigna y siempre tendra el valor predeterminado null
        public UsuarioBLL()
        {

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


    }
}
