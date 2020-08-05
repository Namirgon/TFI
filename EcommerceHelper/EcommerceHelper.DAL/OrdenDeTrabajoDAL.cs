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
  public   class OrdenDeTrabajoDAL
    {

        public void Insert(OrdenDeTrabajoEntidad listaODT)
        {
            //ValidationUtility.ValidateArgument("listaOrden", listaODT);

            SqlParameter[] parameters = new SqlParameter[]
            {
               
                new SqlParameter("@IdUsuario", listaODT.IdUsuario),
                new SqlParameter("@Fecha", DateTime.Now),
                new SqlParameter("@IdEstado", 1),


            };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "OrdenInsert", parameters);
        }

        public void FinalizarOrdenDeTrabajo(OrdenDeTrabajoEntidad ListaOrden)
        {
            SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@IdUsuario", ListaOrden.IdUsuario),
                new SqlParameter("@Fecha", ListaOrden.Fecha),
                new SqlParameter("@IdEstado", 3),
                };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeDeseosUpDate", parameters);
        }


        public OrdenDeTrabajoEntidad SelectActivasByIdUsuario(int IdUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdUsuario", IdUsuario),

            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarOrdenDeTrabajoActiva", parameters))
            {
                OrdenDeTrabajoEntidad ordenDeTrabajoActiva = new OrdenDeTrabajoEntidad();

                ordenDeTrabajoActiva = Mapeador.MapearFirst<OrdenDeTrabajoEntidad>(dt);

                return ordenDeTrabajoActiva;
            }
        }


    }
}
