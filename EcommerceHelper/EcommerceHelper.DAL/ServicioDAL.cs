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
   public  class ServicioDAL
    {

        public List<ServicioEntidad> SelectAll()
        {
            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ServicioSelectAll"))
            {
                List<ServicioEntidad> ListServicios = new List<ServicioEntidad>();
                ListServicios = MapearMuchos(dt);

                return ListServicios;
            }
        }

        private List<ServicioEntidad> MapearMuchos(DataSet ds)
        {
            List<ServicioEntidad> ResUnosItem = new List<ServicioEntidad>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    ServicioEntidad unItem = new ServicioEntidad();


                    unItem.IdServicio = (int)row["IdServicio"];
                    unItem.Titulo = row["Titulo"].ToString();
                    unItem.Descripcion = row["Descripcion"].ToString();
                    unItem.Precio = (decimal)row["Precio"];
                    unItem.URLimagen= row["URLimagen"].ToString();
                   
                   
                    ResUnosItem.Add(unItem);
                }
                return ResUnosItem;
            }
            catch (Exception es)
            {
                throw;
            }

        }
        public ServicioEntidad Select(int IdServicio)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                
                new SqlParameter("@IdServicio", IdServicio)
            };

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ServicioSelect", parameters))
            {

                ServicioEntidad Producto = new ServicioEntidad();

                Producto = MapearMuchos(dt).First();

                return Producto;
            }
        }



        public void Insert(ServicioEntidad servicio)
        {
            ValidationUtility.ValidateArgument("servicio", servicio);

            SqlParameter[] parameters = new SqlParameter[]
            {
                 new SqlParameter("@Titulo", servicio.Titulo ),
                 new SqlParameter("@Descripcion", servicio .Descripcion),
                 new SqlParameter("@Precio", servicio.Precio),
                  new SqlParameter("@URLimagen", servicio.URLimagen )
            };

            var resultado = (decimal)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ServicioInsert", parameters);
            int IdServicioRes = decimal.ToInt32(resultado);
            servicio.IdServicio = IdServicioRes;
        }

        public void Update(ServicioEntidad servicio)
        {
            ValidationUtility.ValidateArgument("servicio", servicio);

            SqlParameter[] parameters = new SqlParameter[]
            {     new SqlParameter("@IdServicio", servicio.IdServicio),
                 new SqlParameter("@Titulo", servicio.Titulo ),
                 new SqlParameter("@Descripcion", servicio .Descripcion),
                 new SqlParameter("@Precio", servicio.Precio),
                  new SqlParameter("@URLimagen", servicio.URLimagen )
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ServicioUpdata", parameters);
        }

        public void Delete(int idServicio)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdServicio", idServicio )
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ServicioDelete", parameters);
        }





    }
}
