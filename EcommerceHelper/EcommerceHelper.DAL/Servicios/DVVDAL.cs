using EcommerceHelper.Funciones.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.Entidades.Servicios;

namespace EcommerceHelper.DAL.Servicios
{
    public class DVVDAL
    {
        public void Insert(DVV DigitoVV)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {

                new SqlParameter("@Tabla", DigitoVV.tabla),
                new SqlParameter("@DVV", DigitoVV.dvv)



            };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "InsertDVV", parameters);

        }

        public DVV SelectByTabla(string tabla)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {

                new SqlParameter("@Tabla", tabla)
            };

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SelectByTabla", parameters))
            {

                DVV Producto = new DVV();

                Producto = MapearMuchos(dt).First();

                return Producto;
            }
        }

        private List<DVV> MapearMuchos(DataSet ds)
        {
            List<DVV> ResUnosItem = new List<DVV>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    DVV unItem = new DVV();


                    unItem.IdDVV = (int)row["IdDVV"];
                    unItem.tabla = row["Tabla"].ToString();
                    unItem.dvv = row["DVV"].ToString();

                    ResUnosItem.Add(unItem);
                }
                return ResUnosItem;
            }
            catch (Exception es)
            {
                throw;
            }


        }
    }
}