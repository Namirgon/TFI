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

            SqlParameter[] parameters = new SqlParameter[]
            {
               
                new SqlParameter("@IdUsuario", listaODT._MiUsuario .IdUsuario),
                new SqlParameter("@Fecha", DateTime.Now),
                new SqlParameter("@IdEstado", 1),


            };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "OrdenInsert", parameters);
           
        }
      
        public void FinalizarOrdenDeTrabajo(OrdenDeTrabajoEntidad ListaOrden)
        {
            SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@IdOrdenDeTrabajo", ListaOrden.IdOrdenDeTrabajo),
                new SqlParameter("@IdEstado", 3),
                };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FinalizarOrdenDeTrabajo", parameters);
        }


        public OrdenDeTrabajoEntidad SelectActivasByIdUsuario(int IdUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdUsuario", IdUsuario),

            };

            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarOrdenDeTrabajoActiva", parameters))
            {
               
                OrdenDeTrabajoEntidad OrdenDeTrabajoEntidad = new OrdenDeTrabajoEntidad();
                OrdenDeTrabajoEntidad = MapearOrdenDeTrabajoEntidad(ds);
                return OrdenDeTrabajoEntidad;

            }
        }

        private OrdenDeTrabajoEntidad MapearOrdenDeTrabajoEntidad(DataSet ds)
        {
            OrdenDeTrabajoEntidad UnaOrdenT = new OrdenDeTrabajoEntidad();


            foreach (DataRow row in ds.Tables[0].Rows)
            {
                UnaOrdenT.IdOrdenDeTrabajo = (int)row["IdOrdenDeTrabajo"];
                UnaOrdenT.MiUsuario = new UsuarioEntidad();
                UnaOrdenT.MiUsuario.IdUsuario = (int)row["IdUsuario"];
                UnaOrdenT.Fecha = DateTime.Parse(row["Fecha"].ToString());
                UnaOrdenT.IdEstado = (int)row["IdEstado"];

            }
            return UnaOrdenT;
        }

        public OrdenDeTrabajoEntidad Select(int IdOrdenDeTrabajo)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdOrdenDeTrabajo", IdOrdenDeTrabajo)
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarIdItemByIdOrdenDeTrabajo", parameters))
            {
                OrdenDeTrabajoEntidad ordenDeTrabajo = new OrdenDeTrabajoEntidad();

                ordenDeTrabajo = Mapeador.MapearFirst<OrdenDeTrabajoEntidad>(dt);

                return ordenDeTrabajo;
            }
        }
    }
}
