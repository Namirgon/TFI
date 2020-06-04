using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.DAL
{
    public class TipoTelefonoDAL
    {


        public List<TipoTelefonoEntidad> SelectAll()
        {
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarTipoTelefono"))
            {
                List<TipoTelefonoEntidad> TipoTelefonos = new List<TipoTelefonoEntidad>();
                TipoTelefonos = Mapeador.Mapear<TipoTelefonoEntidad>(dt);

                return TipoTelefonos;
            }
        }
    }
}
