using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Persistencia;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace EcommerceHelper.DAL
{
  public   class DetalleComprobanteDAL
    {

        public void Insert(DetalleComprobanteEntidad comprobanteDetalle)
        {
            ValidationUtility.ValidateArgument("comprobanteDetalle", comprobanteDetalle);

            SqlParameter[] parameters = new SqlParameter[]
            {
               // IdTipoComprobante 1= Factura y IdSucursal 1 = General Rodriguez
                new SqlParameter("@IdComprobante", comprobanteDetalle.MiComprobante.IdComprobante ),
                new SqlParameter("@IdTipoComprobante", 1),
                new SqlParameter("@IdSucursal", 1),
                new SqlParameter("@IdServicio", comprobanteDetalle.MiServicio.IdServicio ),
                new SqlParameter("@PrecioUnitario", comprobanteDetalle.PrecioUnitario )
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteDetalleInsert", parameters);
        }

    }
}
