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
    public class SexoDAL
    {

        public List<SexoEntidad> SelectAll()
        {
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarSexo"))
            {
                List<SexoEntidad> sexos = new List<SexoEntidad>();
                sexos = Mapeador.Mapear<SexoEntidad>(dt);

                return sexos;
            }
        }

    }
}
