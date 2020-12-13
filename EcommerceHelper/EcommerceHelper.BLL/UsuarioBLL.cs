using System;
using EcommerceHelper.Entidades;
using EcommerceHelper.DAL;
using System.Collections.Generic;
using Entidades.Servicios.Permisos;
using EcommerceHelper.Funciones.Seguridad;
using EcommerceHelper.BLL.Managers;

namespace EcommerceHelper.BLL
{
    public class UsuarioBLL
    {

        private ProvinciaDAL _dalProvicia;
        private DireccionDAL _DalDireccion;
        private UsuarioDAL _DalUsuario;// el campo "UsuarioBLL _DalUsuario " nunca se asigna y siempre tendra el valor predeterminado null
        public UsuarioBLL()
        {

            _dalProvicia = new ProvinciaDAL();
            _DalUsuario = new UsuarioDAL();
            _DalDireccion = new DireccionDAL();
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


        public UsuarioEntidad  BuscarMail(string Email)
        {

            try
            {
              
                    return _DalUsuario.BuscarEmail(Email);
       
            }
            catch (Exception ex)
            {


                throw ex;   

            }


        }

        public UsuarioEntidad ActualizarPassword(string Email, string nuevaPassword)
        {

            try
            {

                return _DalUsuario.ActualizarPassword(Email, nuevaPassword);

            }
            catch (Exception ex)
            {


                throw ex;

            }


        }


        public List< UsuarioEntidad> GenerarCadenaDVHTablaEntera() 
        {
            try
            {
                return _DalUsuario.SelectAllUsuaariosParaDVH();
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

        }

        public List<SexoEntidad> SelectALLSexos()
        {
            SexoBLL ManagerSexo = new SexoBLL();
            return ManagerSexo.SelectALLSexos();

        }

        public List<UsuarioEntidad> SelectALLEmpleados()
        {

            return _DalUsuario.SelectAllEmpleados();

        }
        public List<UsuarioEntidad> SelectALLEmpleadoDeLimpieza()
        {

            return _DalUsuario.SelectAllEmpleadoDeLimpieza();

        }
        public List<UsuarioEntidad> SelectALLEmpleadoDeLimpiezabyLocalidad(int idLoc)
        {

            return _DalUsuario.SelectALLEmpleadoDeLimpiezabyLocalidad(idLoc);

        }
        public int RegistrarUsuario(UsuarioEntidad usuario)
        {
            try
            {
                _DalUsuario.Insert(usuario);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public int InsertFamiliaUsuario(int usuario, int familia, string email)
        {
            try
            {
                _DalUsuario.InsertFamiliaUsuario(usuario, familia, email);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public List<IFamPat> UsuarioTraerPermisos(string email, int IdUsuario)
        {

            FamiliaBLL ManagerFamilia = new FamiliaBLL();

            try
            {
                List<IFamPat> unasFamilias;
                //Primero traigo los permisos directos que tiene usuario (Familias y Patentes)
                unasFamilias = _DalUsuario.UsuarioTraerPermisos(email , IdUsuario);
                //Segundo veo si aquellos permisos (1), tienen subpermisos (Familias y/o Patentes) y los agrego. La variable unasFamilias se modifica en las funciones de la BLL y DAL directamente.
                ManagerFamilia.FamiliaTraerSubPermisos(unasFamilias);
                return unasFamilias;

            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "UsuarioTraerPermisos", email ,  (IdUsuario).ToString());
                throw;
            }
        }



        public void InsertDireccionDeFacturacion(DireccionEntidad direccion, UsuarioEntidad elUsuario)
        {
            try
            {
                var id = _DalDireccion.Insert(direccion);
                direccion.IdDireccion = id;
                _DalUsuario.UsuarioDireccionCrear(direccion, elUsuario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public bool UsuarioModificarPermisos(List<IFamPat> PerAgregar, List<IFamPat> PerQuitar, string email)
        {
            try
            {
                if (PerAgregar.Count > 0)
                    _DalUsuario.UsuarioAgregarPermisos(PerAgregar, email);
                if (PerQuitar.Count > 0)
                    _DalUsuario.UsuarioQuitarPermisos(PerQuitar, email);
                return true;
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public UsuarioEntidad Select(int Id)
        {
            return _DalUsuario.Select(Id);

        }

        public void UpdateDatosEmpleado(UsuarioEntidad UnUsuario)
        {
            // falta re calcular el DVH
           _DalUsuario.UpdateDatosEmpleado(UnUsuario);


        }
        public void UpdateDatosEmpleado2(UsuarioEntidad UnUsuario)
        {
            // falta re calcular el DVH
            _DalUsuario.UpdateDatosEmpleado2(UnUsuario);


        }

        public void UpdateDireccionEmpleado(DireccionEntidad direccion)
        {
            try
            {
                _DalDireccion.UpdateDireccionEmpleado(direccion);
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public void EliminarDireccion(int IdDireccion, int IdUsuario)
        {

            _DalDireccion.EliminarDireccion(IdDireccion, IdUsuario);
        }


    }



}