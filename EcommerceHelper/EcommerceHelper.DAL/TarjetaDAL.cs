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
    public    class TarjetaDAL
    {

        public int Insert(TarjetaEntidad tarjeta)
        {
            ValidationUtility.ValidateArgument("tarjeta", tarjeta );

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdUsuario", tarjeta.IdUsuario),
                new SqlParameter("@IdTipoTarjeta", tarjeta.MiTipoTarjeta.IdTipoTarjeta),
                new SqlParameter("@NombreTitular", tarjeta.NombreTitular),
                new SqlParameter("@NumeroTarjeta", tarjeta.NumeroTarjeta),
                 new SqlParameter("@FechaVencimiento", tarjeta.FechaVencimiento),
                new SqlParameter("@CodigoSeguridad", tarjeta.CodigoSeguridad),
            

            };

            var valor = Convert.ToInt32(SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaInsert", parameters));

            return valor;
        }

        public List<TarjetaEntidad> ListaTarjetasDAL(int Id)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdUsuario", Id),

            };
            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SelectTarjeta", parameters))
            {
                List<TarjetaEntidad> ListaMisTarjetas = new List<TarjetaEntidad>();

                ListaMisTarjetas = MapearMisTarjetas(ds);

                return ListaMisTarjetas;
            }

        }
        public List<TarjetaEntidad> MapearMisTarjetas(DataSet ds)
        {

            List<TarjetaEntidad> ListTarjetas = new List<TarjetaEntidad>();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    TarjetaEntidad  miTarjeta = new TarjetaEntidad ();

                    miTarjeta.IdTarjeta = (int)row["IdTarjeta"];
                    miTarjeta.NombreTitular  = row["NombreTitular"].ToString();
                    miTarjeta.NumeroTarjeta= (Int64)row["NumeroTarjeta"];
                    miTarjeta.MiTipoTarjeta  = new TipoTarjetaEntidad();
                    miTarjeta.MiTipoTarjeta.Descripcion = row["Descripcion"].ToString();
                    miTarjeta.FechaVencimiento= (DateTime )row["FechaVencimiento"];
                    miTarjeta.CodigoSeguridad = (int)row["CodigoSeguridad"];
                 
                    
                   
                    ListTarjetas.Add(miTarjeta );
                }
                return ListTarjetas;

            }
            catch (Exception es)
            {
                throw;
            }

        }
        public TarjetaEntidad Select(int IdTarjeta)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdTarjeta", IdTarjeta)
            };

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SelectbyIDTarjeta", parameters))
            {
                TarjetaEntidad MiTarjeta = new TarjetaEntidad();

                MiTarjeta = MapearMiTarjeta(dt);

                return MiTarjeta;
            }
        }

        public void Delete(int IdTarjeta)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdTarjeta", IdTarjeta)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaDelete", parameters);
        }


        public TarjetaEntidad MapearMiTarjeta(DataSet dt)
        {

            TarjetaEntidad miTarjeta = new TarjetaEntidad();

            try
            {

                foreach (DataRow row in dt.Tables[0].Rows)
                {
                   

                    miTarjeta.IdTarjeta = (int)row["IdTarjeta"];
                    miTarjeta.NombreTitular = row["NombreTitular"].ToString();
                    miTarjeta.NumeroTarjeta = (Int64)row["NumeroTarjeta"];
                    miTarjeta.MiTipoTarjeta = new TipoTarjetaEntidad();
                    miTarjeta.MiTipoTarjeta.Descripcion = row["Descripcion"].ToString();
                    miTarjeta.FechaVencimiento = (DateTime)row["FechaVencimiento"];
                    miTarjeta.CodigoSeguridad = (int)row["CodigoSeguridad"];


                    
                }
                return miTarjeta;

            }
            catch (Exception es)
            {
                throw;
            }

        }

        public void Update(TarjetaEntidad tarjeta)
        {
            ValidationUtility.ValidateArgument("tarjeta", tarjeta);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdTarjeta", tarjeta.IdTarjeta),
              
                new SqlParameter("@IdTipoTarjeta", tarjeta.MiTipoTarjeta.IdTipoTarjeta),
                new SqlParameter("@NombreTitular", tarjeta.NombreTitular),
                new SqlParameter("@NumeroTarjeta", tarjeta.NumeroTarjeta),
                 new SqlParameter("@FechaVencimiento", tarjeta.FechaVencimiento),
                new SqlParameter("@CodigoSeguridad", tarjeta.CodigoSeguridad),


            };
           
            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TarjetaUpdate", parameters);
        }

    }
}
