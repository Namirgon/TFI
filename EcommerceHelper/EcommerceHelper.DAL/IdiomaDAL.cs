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
   public class IdiomaDAL
    {


        #region Methods

        public void Insert(IdiomaEntidad lenguaje)
        {
            ValidationUtility.ValidateArgument("lenguaje", lenguaje);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Descripcion", lenguaje.Descripcion)
            };

            var resultado = (decimal)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IdiomaInsert", parameters);
            int IdIdiomaRes = decimal.ToInt32(resultado);
            lenguaje.IdIdioma = IdIdiomaRes;
        }

        public void Update(IdiomaEntidad lenguaje)
        {
            ValidationUtility.ValidateArgument("lenguaje", lenguaje);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdIdioma", lenguaje.IdIdioma),
                new SqlParameter("@Descripcion", lenguaje.Descripcion)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IdiomaUpdate", parameters);
        }

        public void Delete(int idIdioma)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdIdioma", idIdioma)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IdiomaDelete", parameters);
        }

    
        public IdiomaEntidad Select(int idIdioma)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdIdioma", idIdioma)
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IdiomaSelect", parameters))
            {
                IdiomaEntidad LenguajeEntidad = new IdiomaEntidad();

                LenguajeEntidad = Mapeador.MapearFirst<IdiomaEntidad>(dt);

                return LenguajeEntidad;
            }
        }


        public List<IdiomaEntidad> SelectAll()
        {
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IdiomaSelectAll"))
            {
                List<IdiomaEntidad> lenguajeEntidadList = new List<IdiomaEntidad>();

                lenguajeEntidadList = Mapeador.Mapear<IdiomaEntidad>(dt);

                return lenguajeEntidadList;
            }
        }


        #endregion

    }
}
