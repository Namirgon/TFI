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
   public class DireccionDAL
    {


        public int Insert(DireccionEntidad direccion)
        {
            ValidationUtility.ValidateArgument("direccion", direccion);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Calle", direccion.Calle),
                new SqlParameter("@Numero", direccion.Numero),
                new SqlParameter("@Piso", direccion.Piso),
                new SqlParameter("@Departamento", direccion.Departamento),
                 new SqlParameter("@IdProvincia", direccion.MiProvincia.IdProvincia),
                new SqlParameter("@IdLocalidad", direccion.MiLocalidad.IdLocalidad),
                new SqlParameter("@IdTipoDireccion", direccion.MiTipoDireccion.IdTipoDireccion)

            };

            var valor = Convert.ToInt32(SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionInsert", parameters));

            return valor;
        }

    }
}

