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
                
                new SqlParameter("@IdSericio", IdServicio)
            };

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ServicioSelect", parameters))
            {

                ServicioEntidad Producto = new ServicioEntidad();

                Producto = MapearMuchos(dt).First();

                return Producto;
            }
        }







    }
}
