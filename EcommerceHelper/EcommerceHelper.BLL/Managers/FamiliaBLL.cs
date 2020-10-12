using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Seguridad;
using Entidades.Servicios.Permisos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace EcommerceHelper.BLL.Managers
{
   public class FamiliaBLL
    {


        private FamiliaDAL unaFamiliaDAL;

        public FamiliaBLL()
        {
            unaFamiliaDAL = new FamiliaDAL();
        }

        public List<FamiliaEntidad> FamiliaSelectAll()
        {
            return unaFamiliaDAL.SelectAll();
        }

        public FamiliaEntidad FamiliaSelectNombreFamiliaByIdUsuario(int idUsuario)
        {
            return unaFamiliaDAL.FamiliaSelectNombreFamiliaByIdUsuario(idUsuario);
        }
        public List<IFamPat> PermisosTraerTodos()
        {
            try
            {
                List<IFamPat> unasFamilias;
                unasFamilias = unaFamiliaDAL.PermisosTraerTodos();
                FamiliaTraerSubPermisos(unasFamilias);
                return unasFamilias;
            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "PermisosTraerTodos", "", "");
                throw;
            }
        }

        public void FamiliaTraerSubPermisos(List<IFamPat> unasFamilias)
        {
            try
            {
                //Por cada familia/patente reviso si tiene subpermisos para agregarselos
                foreach (IFamPat unaFamilia in unasFamilias)
                {
                  unaFamiliaDAL.FamiliaTraerFamiliasHijas(unaFamilia);
                }


            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "FamiliaTraerSubPermisos", "", "");
                throw;
            }
        }

        public List<UsuarioEntidad> FamiliaUsuariosAsociados(int IdFamilia)
        {
            try
            {
                return unaFamiliaDAL.FamiliaUsuariosAsociados(IdFamilia);
            }
            catch (Exception es)
            {
                throw;
            }
        }


        public List<UsuarioEntidad> FamiliaUsuariosComprometidos(int IdFamilia)
        {
            try
            {
                return unaFamiliaDAL.FamiliaUsuariosComprometidos(IdFamilia);
            }
            catch (Exception es)
            {
                throw;
            }
        }
        public bool FamiliaEliminar(int IdFamilia)
        {
            try
            {
                if (unaFamiliaDAL.FamiliaEliminar(IdFamilia))
                    return true;
                return false;
            }
            catch (Exception es)
            {
                throw;
            }
        }

    }
}
