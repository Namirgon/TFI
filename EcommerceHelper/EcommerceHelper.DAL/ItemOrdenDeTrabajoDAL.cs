using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Persistencia;

namespace EcommerceHelper.DAL
{
  public  class ItemOrdenDeTrabajoDAL
    {

        public void Insert(ItemOrdenDeTrabajoEntidad listaItemODT)
        {
            ValidationUtility.ValidateArgument("listaItem", listaItemODT);

            SqlParameter[] parameters = new SqlParameter[]
            {
                //new SqlParameter("@IdDeseo", listaDeseo.IdDeseo),
                new SqlParameter("@IdUsuario", listaItemODT.IdUsuario),
                new SqlParameter("@NombreUsuario", listaItemODT.NombreUsuario),
                new SqlParameter("@IdServicio", listaItemODT.IdServicio),
                 new SqlParameter("@IdOrdenDeTrabajo", listaItemODT.IdOrdenDeTrabajo),

            };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaItemInsert", parameters);
        }

        public List<ItemOrdenDeTrabajoEntidad> SelectAllByNumeroIdUsuario(int NumeroIdUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdUsuario", NumeroIdUsuario),

            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarItemByNumeroDocumento", parameters))
            {
                List<ItemOrdenDeTrabajoEntidad> listaItemEntidad = new List<ItemOrdenDeTrabajoEntidad>();

                listaItemEntidad = Mapeador.Mapear<ItemOrdenDeTrabajoEntidad>(dt);

                return listaItemEntidad;
            }
        }
        public List<ItemOrdenDeTrabajoEntidad> SelectIdItemOrdenDeTrabajo(int idOrdenDeTrabajo)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdOrdenDeTrabajo", idOrdenDeTrabajo),

            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarItemByIdOrdenDeTrabajo", parameters))
            {
                List<ItemOrdenDeTrabajoEntidad> listaItemEntidad = new List<ItemOrdenDeTrabajoEntidad>();

                listaItemEntidad = Mapeador.Mapear<ItemOrdenDeTrabajoEntidad>(dt);

                return listaItemEntidad;
            }
        }

        public List<ItemOrdenDeTrabajoEntidad> SelectIdItem(int idOrdenDeTrabajo)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdOrdenDeTrabajo", idOrdenDeTrabajo),

            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarIdItemByIdOrdenDeTrabajo", parameters))
            {
                List<ItemOrdenDeTrabajoEntidad> listaItemEntidad = new List<ItemOrdenDeTrabajoEntidad>();

                listaItemEntidad = Mapeador.Mapear<ItemOrdenDeTrabajoEntidad>(dt);

                return listaItemEntidad;
            }
        }


        public void ActualizarFechayHoraListaItem(ItemOrdenDeTrabajoEntidad listaItem)
        {
            SqlParameter[] parameters = new SqlParameter[]
                {
                 new SqlParameter("@NumeroDocumento", listaItem.IdUsuario),
                new SqlParameter("@IdItemOrdenDeTrabajo", listaItem.IdItemOrdenDeTrabajo),
                
                };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeItemUpDate", parameters);
        }

        public ItemOrdenDeTrabajoEntidad Select(ItemOrdenDeTrabajoEntidad listaItem)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@NumeroDocumento", listaItem.IdUsuario),
                new SqlParameter("@NombreUsuario", listaItem.NombreUsuario),
                new SqlParameter("@IdServicio", listaItem.IdServicio)
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaItemSelect", parameters))
            {
                ItemOrdenDeTrabajoEntidad ListaitemEntidad = new ItemOrdenDeTrabajoEntidad();

                ListaitemEntidad = Mapeador.MapearFirst<ItemOrdenDeTrabajoEntidad>(dt);

                return ListaitemEntidad;
            }
        }

        public void EliminarIdItemOrdenDeTrabajo( int IdItem)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdItemOrdenDeTrabajo", IdItem )
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ItemDelete", parameters);
        }


    }
}
