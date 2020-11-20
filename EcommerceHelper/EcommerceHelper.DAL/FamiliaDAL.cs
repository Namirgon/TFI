using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Persistencia;
using EcommerceHelper.Funciones.Seguridad;
using Entidades.Servicios.Permisos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.DAL


{
  public  class FamiliaDAL
    {
        public List<FamiliaEntidad> SelectAll()
        {
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaSelectAll"))
            {
                List<FamiliaEntidad> familiaEntidadList = new List<FamiliaEntidad>();

                familiaEntidadList = Mapeador.Mapear<FamiliaEntidad>(dt);

                return familiaEntidadList;
            }
        }

        public void  UsuarioFamiliaUpdate(int UnUsuario, int UnaFamilia)
        {
            SqlParameter[] parameters = new SqlParameter[]{

                new SqlParameter("@IdFamilia", UnaFamilia),
                new SqlParameter("IdUsuario", UnUsuario)
            };
            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaUsuarioUpdate", parameters);



        }
        public void UsuarioFamiliaInsert(UsuarioEntidad unUsuario)
        {
            ValidationUtility.ValidateArgument("unUsuario", unUsuario);

            SqlParameter[] parameters = new SqlParameter[]
            {
               
                new SqlParameter("@Email", unUsuario.Email),
                new SqlParameter("@IdFamilia", unUsuario.Permisos[0].IdIFamPat)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioFamiliaInsert", parameters);
        }

        public bool FamiliaCrear(IFamPat nuevaFamilia)
        {
            SqlParameter[] parametersFamCrear = new SqlParameter[]
            {
                new SqlParameter("@NombreFamilia", nuevaFamilia.NombreIFamPat)
            };

            try
            {
                var Resultado = (decimal)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaCrear", parametersFamCrear);
                int IdFamRes = Decimal.ToInt32(Resultado);
                nuevaFamilia.IdIFamPat = IdFamRes;

                if (nuevaFamilia.CantHijos > 0)
                {
                    foreach (IFamPat unPermiso in (nuevaFamilia as Familia).ElementosFamPat)
                    {
                        //Asociar Familia con Familia
                        if (unPermiso.CantHijos > 0)
                        {
                            SqlParameter[] parametersRelFamFam = new SqlParameter[]
                            {
                            new SqlParameter("@IdFamiliaPadre", nuevaFamilia.IdIFamPat),
                            new SqlParameter("@IdFamiliaHijo", unPermiso.IdIFamPat)
                            };

                            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaFamiliaAsociar", parametersRelFamFam);
                        }
                        //Asociar Familia con Patente
                        else
                        {
                            SqlParameter[] parametersRelFamPat = new SqlParameter[]
                            {
                            new SqlParameter("@IdFamilia", nuevaFamilia.IdIFamPat),
                            new SqlParameter("@IdPatente", unPermiso.IdIFamPat)
                            };

                            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaPatenteAsociar", parametersRelFamPat);
                        }
                    }
                }
                return true;
            }
            catch (Exception es)
            {
                throw;
            }
        }
        public Familia FamiliaBuscar(string NombreIFamPat)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@NombreFamilia", NombreIFamPat)
            };

            try
            {
                using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaBuscar", parameters))
                {
                    Familia unaFam = new Familia();
                    unaFam = MapearFamiliaUno(ds);
                    return unaFam;
                }
            }
            catch (Exception es)
            {
                throw;
            }
        }
        public static Familia MapearFamiliaUno(DataSet ds)
        {
            Familia unaFamilia = new Familia();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    unaFamilia.IdIFamPat = (int)row["IdFamilia"];
                    unaFamilia.NombreIFamPat = row["NombreFamilia"].ToString();
                }
                return unaFamilia;
            }
            catch (Exception es)
            {
                throw;
            }
        }


        public bool FamiliaModificar(IFamPat AModifFamilia, List<IFamPat> FamQuitarMod, List<IFamPat> FamAgregarMod)
        {
            SqlParameter[] parametersFamModif = new SqlParameter[]
            {
                new SqlParameter("@NombreFamilia", AModifFamilia.NombreIFamPat),
                new SqlParameter("@IdFamilia", AModifFamilia.IdIFamPat)
            };

            try
            {
                SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaModificar", parametersFamModif);

                //Quitar Permisos
                if (FamQuitarMod.Count > 0)
                {
                    foreach (IFamPat unPermiso in FamQuitarMod)
                    {
                        //Quitar Familia
                        if (unPermiso.CantHijos > 0)
                        {
                            SqlParameter[] parametersFamQuitar = new SqlParameter[]
                            {
                            new SqlParameter("@IdFamiliaPadre", AModifFamilia.IdIFamPat),
                            new SqlParameter("@IdFamiliaHijo", unPermiso.IdIFamPat)
                            };

                            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaFamiliaDesasociar", parametersFamQuitar);
                        }
                        //Quitar Patente
                        else
                        {
                            SqlParameter[] parametersPatQuitar = new SqlParameter[]
                            {
                            new SqlParameter("@IdFamilia", AModifFamilia.IdIFamPat),
                            new SqlParameter("@IdPatente", unPermiso.IdIFamPat)
                            };

                            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaPatenteDesasociar", parametersPatQuitar);
                        }

                    }
                }
                //Agregar Permisos
                if (FamAgregarMod.Count > 0)
                {
                    foreach (IFamPat unPermiso in FamAgregarMod)
                    {
                        //Agregar Familia
                        if (unPermiso.CantHijos > 0)
                        {
                            SqlParameter[] parametersFamAgregar = new SqlParameter[]
                            {
                            new SqlParameter("@IdFamiliaPadre", AModifFamilia.IdIFamPat),
                            new SqlParameter("@IdFamiliaHijo", unPermiso.IdIFamPat)
                            };

                            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaFamiliaAsociar", parametersFamAgregar);
                        }
                        //Agregar Patente
                        else
                        {
                            SqlParameter[] parametersPatAgregar = new SqlParameter[]
                            {
                            new SqlParameter("@IdFamilia", AModifFamilia.IdIFamPat),
                            new SqlParameter("@IdPatente", unPermiso.IdIFamPat)
                            };

                            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaPatenteAsociar", parametersPatAgregar);
                        }
                    }
                }
                return true;
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public FamiliaEntidad FamiliaSelectNombreFamiliaByIdUsuario(int idUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdUsuario", idUsuario)
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaSelectNombreFamiliaByIdUsuario", parameters))
            {
                FamiliaEntidad FamiliaEntidad = new FamiliaEntidad();

                FamiliaEntidad = Mapeador.MapearFirst<FamiliaEntidad>(dt);

                return FamiliaEntidad;
            }
        }

        public List<IFamPat> PermisosTraerTodos()
        {

            List<IFamPat> unosPermisos = new List<IFamPat>();

            try
            {
                //Traigo las familias
                using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliasTraerTodas"))
                {
                    List<IFamPat> unasFamilias = new List<IFamPat>();
                    unasFamilias = MapearFamilias(ds);

                    if (unasFamilias != null && unasFamilias.Count() > 0)
                        unosPermisos.AddRange(unasFamilias);
                }
                //Traigo las patentes
                using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PatentesTraerTodas"))
                {
                    List<IFamPat> unasPatentes = new List<IFamPat>();
                    unasPatentes = MapearPatentes(ds);
                    if (unosPermisos != null && unosPermisos.Count() > 0)
                        unosPermisos.AddRange(unasPatentes);
                }
                return unosPermisos;

            }
            catch (Exception es)
            {
                throw;
            }
        }


        public static List<IFamPat> MapearFamilias(DataSet ds)
        {
            List<IFamPat> ResElementosFamPat = new List<IFamPat>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    IFamPat unaFamilia = new Familia();
                    unaFamilia.IdIFamPat = (int)row["IdFamilia"];
                    unaFamilia.NombreIFamPat = row["NombreFamilia"].ToString();
                    ResElementosFamPat.Add(unaFamilia);
                }
                return ResElementosFamPat;
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public static List<IFamPat> MapearPatentes(DataSet ds)
        {
            List<IFamPat> ResElementosFamPat = new List<IFamPat>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    IFamPat unaPatente = new Patente();
                    unaPatente.IdIFamPat = (int)row["IdPatente"];
                    unaPatente.NombreIFamPat = row["NombrePatente"].ToString();
                    ResElementosFamPat.Add(unaPatente);
                }
                return ResElementosFamPat;
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public void FamiliaTraerFamiliasHijas(IFamPat unaFamilia)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdFamilia", unaFamilia.IdIFamPat)
            };

            SqlParameter[] parameters2 = new SqlParameter[]
            {
                new SqlParameter("@IdFamilia", unaFamilia.IdIFamPat)
            };

            try
            {
                if (unaFamilia.GetType().Name == "Familia")
                {
                    //Busco las familias que contenga la FAMILIA en revisión y llamo a Agregar de la Entidad Familia y queda guardado en el argumento, por lo que no tengo q retornar nada
                    using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaTraerFamiliasHijas", parameters))
                    {
                        List<IFamPat> unasFamiliasHijas = new List<IFamPat>();
                        unasFamiliasHijas = MapearFamilias(ds);

                        foreach (IFamPat FamiliaHija in unasFamiliasHijas)
                        {
                            unaFamilia.Agregar(FamiliaHija);
                            FamiliaTraerFamiliasHijas(FamiliaHija);
                        }
                    }
                    //IDEM anterior pero con patentes.. Busco las patentes que contenga la FAMILIA en revisión y llamo a Agregar de la Entidad Familia y queda guardado en el argumento, por lo que no tengo q retornar nada
                    using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaTraerPatentes", parameters2))
                    {
                        List<IFamPat> unasPatentes = new List<IFamPat>();
                        unasPatentes = MapearPatentes(ds);

                        foreach (IFamPat unaPatente in unasPatentes)
                        {
                            unaFamilia.Agregar(unaPatente);
                        }
                    }
                }
            }
            catch (Exception es)
            {
                throw;
            }
        }
        public List<UsuarioEntidad> FamiliaUsuariosAsociados(int IdFamilia)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdFamilia", IdFamilia),
              
            };

            try
            {
                using (DataTable ds = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaUsuariosAsociados", parameters))
                {
                    List<UsuarioEntidad> unosUsuarios = new List<UsuarioEntidad>();
                    unosUsuarios = Mapeador.Mapear<UsuarioEntidad>(ds);
                    return unosUsuarios;
                }
            }
            catch (Exception es)
            {
                throw;
            }
        }


        public List<UsuarioEntidad> FamiliaUsuariosComprometidos(int IdFamilia)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdFamilia", IdFamilia),
             
            };

            try
            {
                using (DataTable ds = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaUsuariosComprometidos", parameters))
                {
                    List<UsuarioEntidad> unosUsuarios = new List<UsuarioEntidad>();
                    unosUsuarios = Mapeador.Mapear<UsuarioEntidad>(ds);
                    return unosUsuarios;
                }
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
                //Quitar Permisos
                //Quitar Familias asociadas
                SqlParameter[] parametersFamQuitar = new SqlParameter[]
                {
                    new SqlParameter("@IdFamiliaPadre", IdFamilia),
                    new SqlParameter("@IdFamiliaHijo", IdFamilia)
                };

                SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaEliminarAsocFamilias", parametersFamQuitar);

                //Quitar Patentes asociadas
                SqlParameter[] parametersPatQuitar = new SqlParameter[]
                {
                    new SqlParameter("@IdFamilia", IdFamilia)
                };

                SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaEliminarAsocPatentes", parametersPatQuitar);

                //Eliminar Familia
                SqlParameter[] parametersFam = new SqlParameter[]
                {
                    new SqlParameter("@IdFamilia", IdFamilia)
                };
                SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaDelete", parametersFam);
                return true;
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public void UsuarioUpdatePermisosFamilia(UsuarioEntidad Usuario)
        {
            ValidationUtility.ValidateArgument("elUsuario", Usuario);

            SqlParameter[] parameters = new SqlParameter[]
            {
               
                new SqlParameter("@Email", Usuario.Email),
                new SqlParameter("@IdFamilia", Usuario.Permisos[0].IdIFamPat)

            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioUpdatePermisosFamilia", parameters);
        }


        public void Insert(FamiliaEntidad familia)
        {
            ValidationUtility.ValidateArgument("familia", familia);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@NombreFamilia", familia.NombreFamilia)
            };

          //  familia.IdFamilia = (FamiliaEntidad.PermisoFamilia)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaInsert", parameters);
            var Resultado= (decimal)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaInsert", parameters);
            int IdFamilia = Decimal.ToInt32(Resultado);
            familia.IdFamilia = IdFamilia;
        }


        public void Update(FamiliaEntidad familia)
        {
            ValidationUtility.ValidateArgument("familia", familia);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdFamilia", familia.IdFamilia),
                new SqlParameter("@NombreFamilia", familia.NombreFamilia)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaUpdate", parameters);
        }


        public void Delete(int idFamilia)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdFamilia", idFamilia)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaDelete", parameters);
        }


        public FamiliaEntidad Select(int idFamilia)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdFamilia", idFamilia)
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaSelect", parameters))
            {
                FamiliaEntidad FamiliaEntidad = new FamiliaEntidad();

                FamiliaEntidad = Mapeador.MapearFirst<FamiliaEntidad>(dt);

                return FamiliaEntidad;
            }
        }



    }
}

