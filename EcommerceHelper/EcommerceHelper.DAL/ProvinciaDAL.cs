using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Persistencia;

namespace EcommerceHelper.DAL
{
   public  class ProvinciaDAL
    {
        public List<ProvinciaEntidad> SelectAll()
		{
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarProvincias"))
			{
                List<ProvinciaEntidad> provincias = new List<ProvinciaEntidad>();
                provincias = Mapeador.Mapear<ProvinciaEntidad>(dt);

                return provincias;
			}
		}
    
        public ProvinciaEntidad Select(int idProvincia)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdProvincia", idProvincia)
            };

            using (System.Data.DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SelectProvincia", parameters))
            {
                ProvinciaEntidad provincia = new ProvinciaEntidad();
                //       

                provincia = Mapeador.MapearFirst<ProvinciaEntidad>(dt);



                return provincia;
            }
        }
        public void Delete(int idProvincia)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdProvincia", idProvincia)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProvinciaDelete", parameters);
        }
        public void Update(ProvinciaEntidad provincia)
        {
            ValidationUtility.ValidateArgument("provincia", provincia);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdProvincia", provincia.IdProvincia),
                new SqlParameter("@Descripcion", provincia.Descripcion)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProvinciaUpdate", parameters);
        }

        public void Insert(ProvinciaEntidad provincia)
        {
            ValidationUtility.ValidateArgument("provincia", provincia);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdProvincia", provincia.IdProvincia),
                new SqlParameter("@Descripcion", provincia.Descripcion)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ProvinciaInsert", parameters);
        }
    }
}
