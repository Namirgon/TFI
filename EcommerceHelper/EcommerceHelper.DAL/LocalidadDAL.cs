using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Persistencia;

namespace EcommerceHelper.DAL
{
  public  class LocalidadDAL
    {

        public List<LocalidadEntidad> LocalidadSelectAll()
        {
            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarLocalidad"))
            {
                List<LocalidadEntidad> unaLista = new List<LocalidadEntidad>();

                unaLista = MapearMuchos(dt);

                return unaLista;
            }
        }


        private List<LocalidadEntidad> MapearMuchos(DataSet ds)
        {
            List<LocalidadEntidad> ResUnosItem = new List<LocalidadEntidad>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    LocalidadEntidad unItem = new LocalidadEntidad();

                    unItem.IdLocalidad = (int)row["IdLocalidad"];
                    unItem.Descripcion = row["Descripcion"].ToString();
                    unItem.MiProvincia = new ProvinciaEntidad();
                    unItem.MiProvincia.IdProvincia = (int)row["IdProvincia"];
                    unItem.MiProvincia.Descripcion = row["Descripcion"].ToString();

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

