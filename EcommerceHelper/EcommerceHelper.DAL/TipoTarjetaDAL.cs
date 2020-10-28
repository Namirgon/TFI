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
  public  class TipoTarjetaDAL
    {


        public List<TipoTarjetaEntidad> SelectAll()
        {
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "TipoTarjetaSelectAll"))
            {
                List<TipoTarjetaEntidad> TipoTarjetaList = new List<TipoTarjetaEntidad>();

                TipoTarjetaList = Mapeador.Mapear<TipoTarjetaEntidad>(dt);

                return TipoTarjetaList;
            }
        }

    }
}
