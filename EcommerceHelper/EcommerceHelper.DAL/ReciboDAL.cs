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
   public  class ReciboDAL
    {

        public void Insert(ReciboEntidad pago)
        {
            ValidationUtility.ValidateArgument("pago", pago);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdOrdeDeTrabajo", pago.MiOrdenDeTrabajo.IdOrdenDeTrabajo),   
                new SqlParameter("@IdFormaDePago", 2),
                new SqlParameter("@Importe", pago.Importe),
                new SqlParameter("@Fecha", DateTime.Now)
            };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "PagoInsert", parameters);
        }
    }
}
