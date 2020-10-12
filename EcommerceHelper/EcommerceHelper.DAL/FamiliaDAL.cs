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

        #region Methods

        /// <summary>
        /// Saves a record to the Familia table.
        /// </summary>
        public void Insert(FamiliaEntidad familia)
        {
            ValidationUtility.ValidateArgument("familia", familia);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@NombreFamilia", familia.NombreFamilia)
            };

            familia.IdFamilia = (FamiliaEntidad.PermisoFamilia)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaInsert", parameters);
        }

        /// <summary>
        /// Updates a record in the Familia table.
        /// </summary>
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

        /// <summary>
        /// Deletes a record from the Familia table by its primary key.
        /// </summary>
        public void Delete(int idFamilia)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdFamilia", idFamilia)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaDelete", parameters);
        }

        /// <summary>
        /// Selects a single record from the Familia table.
        /// </summary>
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


        public List<FamiliaEntidad> SelectAll()
        {
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaSelectAll"))
            {
                List<FamiliaEntidad> familiaEntidadList = new List<FamiliaEntidad>();

                familiaEntidadList = Mapeador.Mapear<FamiliaEntidad>(dt);

                return familiaEntidadList;
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
                SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaEliminar", parametersFam);
                return true;
            }
            catch (Exception es)
            {
                throw;
            }
        }



        #endregion
    }
}

