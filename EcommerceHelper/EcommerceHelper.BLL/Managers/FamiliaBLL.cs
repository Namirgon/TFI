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


        public bool FamiliaCrear(IFamPat nuevaFamilia)
        {
            try
            {
                if (unaFamiliaDAL.FamiliaCrear(nuevaFamilia))
                    return true;
                return false;
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
        public Familia FamiliaBuscar(string NombreIFamPat)
        {
            try
            {
                return unaFamiliaDAL.FamiliaBuscar(NombreIFamPat);
            }
            catch (Exception es)
            {
                throw;
            }
        }


        public bool FamiliaModificar(IFamPat AModifFamilia, List<IFamPat> FamQuitarMod, List<IFamPat> FamAgregarMod)
        {
            try
            {
                if (unaFamiliaDAL.FamiliaModificar(AModifFamilia, FamQuitarMod, FamAgregarMod))
                    return true;
                return false;
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public void FamiliaUnaTraerSubPermisos(IFamPat unaFamilia)
        {
            try
            {
                //Reviso si tiene subpermisos para agregarselos
                unaFamiliaDAL.FamiliaTraerFamiliasHijas(unaFamilia);
            }
            catch (Exception es)
            {
                ServicioLog.CrearLog(es, "FamiliaUnaTraerSubPermisos", "", "");
                throw;
            }
        }

        public static bool BuscarPermiso(List<IFamPat> PermisosVer, string[] unTagControl)
        {
            foreach (var unTag in unTagControl)
            {
                foreach (IFamPat unPermiso in PermisosVer)
                {
                    if (unPermiso.CantHijos > 0)
                    {
                        if (BuscarSubPermisos((unPermiso as Familia).ElementosFamPat, unTag))
                            return true;
                    }
                    else
                        if (unPermiso.NombreIFamPat == unTag)
                        return true;
                }
            }
            return false;
        }


        public static bool BuscarSubPermisos(List<IFamPat> PermisosVer, string unTagControl)
        {
            bool Res = false;
            foreach (IFamPat unPer in PermisosVer)
            {
                if (unPer.CantHijos > 0)
                {
                    if (BuscarSubPermisos((unPer as Familia).ElementosFamPat, unTagControl))
                    {
                        Res = true;
                        break;
                    }
                }
                else
                {
                    if (unPer.NombreIFamPat == unTagControl)
                    {
                        Res = true;
                        break;
                    }
                }
            }
            return Res;
        }



        public void UsuarioFamiliaInsert(UsuarioEntidad unUsuario)
        {
            unaFamiliaDAL.UsuarioFamiliaInsert(unUsuario);
        }

        public void UsuarioFamiliaUpdate(int unUsuario, int unaFamilia)
        {
           unaFamiliaDAL.UsuarioFamiliaUpdate(unUsuario, unaFamilia);
        }


        public void UsuarioUpdatePermisosFamilia(UsuarioEntidad elUsuario)
        {
            unaFamiliaDAL.UsuarioUpdatePermisosFamilia(elUsuario);
        }





    }
}
