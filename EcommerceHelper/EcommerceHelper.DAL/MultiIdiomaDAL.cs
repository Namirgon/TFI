using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.DAL
{
  public   class MultiIdiomaDAL
    {
        #region Methods

        /// <summary>
        /// Saves a record to the LenguajeControl table.
        /// </summary>
        public void Insert(MultiIdiomaEntidad lenguajeControl)
        {
            ValidationUtility.ValidateArgument("lenguajeControl", lenguajeControl);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Texto", lenguajeControl.Texto),
                new SqlParameter("@IdIdioma", lenguajeControl.MiIdioma.IdIdioma ),
                new SqlParameter("@NombreDelControl", lenguajeControl.NombreDelControl),
                
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MultiIdiomaControlInsert", parameters);
        }

        /// <summary>
        /// Updates a record in the LenguajeControl table.
        /// </summary>
        public void Update(MultiIdiomaEntidad lenguajeControl)
        {
            ValidationUtility.ValidateArgument("lenguajeControl", lenguajeControl);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Texto", lenguajeControl.Texto),
                new SqlParameter("@IdIdioma", lenguajeControl.MiIdioma.IdIdioma ),
                new SqlParameter("@NombreDelControl", lenguajeControl.NombreDelControl ),
                
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MultiIdiomaControlUpdate", parameters);
        }

        /// <summary>
        /// Deletes a record from the LenguajeControl table by its primary key.
        /// </summary>
        public void Delete(string texto, int idLenguaje)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Texto", texto),
                new SqlParameter("@IdIdioma", idLenguaje)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MultiIdiomaControlDelete", parameters);
        }


        /// <summary>
        /// Selects a single record from the LenguajeControl table.
        /// </summary>
        public MultiIdiomaEntidad Select(string texto, int idLenguaje)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Texto", texto),
                new SqlParameter("@IdIdioma", idLenguaje),
                
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MultiIdiomaControlSelect", parameters))
            {
                MultiIdiomaEntidad LenguajeControlEntidad = new MultiIdiomaEntidad();

                LenguajeControlEntidad = Mapeador.MapearFirst<MultiIdiomaEntidad>(dt);

                return LenguajeControlEntidad;
            }
        }

        /// <summary>
        /// Selects all records from the LenguajeControl table.
        /// </summary>
        public List<MultiIdiomaEntidad> SelectAll( int idIdioma)

        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdIdioma", idIdioma)
            };


            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MultiIdiomaControlSelectAll", parameters))
            {
                List<MultiIdiomaEntidad> lenguajeControlEntidadList = new List<MultiIdiomaEntidad>();

                lenguajeControlEntidadList = MapearTextos(ds);

                return lenguajeControlEntidadList;
            }
        }

        public List<MultiIdiomaEntidad> MapearTextos(DataSet ds)
        {

            List<MultiIdiomaEntidad> ListTextosTraducidos = new List<MultiIdiomaEntidad>();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    MultiIdiomaEntidad unaTraduccion = new MultiIdiomaEntidad();

                    // unaTraduccion.IdMultiIdioma = (int)row["IdMultiIdioma"];

                    //unaTraduccion.MiIdioma = new IdiomaEntidad();
                    //unaTraduccion.MiIdioma.IdIdioma = (int)row["IdIdioma"];

                    unaTraduccion.NombreDelControl= row["NombreDelControl"].ToString();
                
                    unaTraduccion.Texto= row["Texto"].ToString();

                    ListTextosTraducidos.Add(unaTraduccion);
                }
                return ListTextosTraducidos;

            }
            catch (Exception es)
            {
                throw;
            }

        }


        #endregion
    }
}
