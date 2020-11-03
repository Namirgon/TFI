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
 public    class ComprobanteDAL
    {

        public void Insert(ComprobanteEntidad comprobante)
        {
            ValidationUtility.ValidateArgument("comprobante", comprobante);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdTipoComprobante", comprobante.MiTipoComprobante .IdTipoComprobante),
                new SqlParameter("@IdSucursal", comprobante.MiSucursal.IdSucursal),
                new SqlParameter("@IdOrdenDeTrabajo", comprobante.MiOrdenDeTrabajo.IdOrdenDeTrabajo ),           
                new SqlParameter("@Fecha", comprobante.Fecha )

            };

            var Resultado = (decimal)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteInsert", parameters);
            
            int IdComprobanteRes = Decimal.ToInt32(Resultado);
            comprobante.IdComprobante= IdComprobanteRes;

            
        }
    }
}
