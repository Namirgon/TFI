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
  public   class ListaDeseoDAL
    {

        public void Insert(ListaDeDeseoEntidad listaDeseo)
        {
            ValidationUtility.ValidateArgument("listaDeseo", listaDeseo);

            SqlParameter[] parameters = new SqlParameter[]
            {
                //new SqlParameter("@IdDeseo", listaDeseo.IdDeseo),
                new SqlParameter("@NumeroDocumento", listaDeseo.NumeroDocumento),
                new SqlParameter("@NombreUsuario", listaDeseo.NombreUsuario),
                new SqlParameter("@IdServicio", listaDeseo.IdServicio),
                new SqlParameter("@IdEstado", 1)

            };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosInsert", parameters);
        }

        public List<ListaDeDeseoEntidad> SelectAllByNumeroDocumento(int NumeroDocumento)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@NumeroDocumento", NumeroDocumento),
                
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarDeseoByNumeroDocumento", parameters))
            {
                List<ListaDeDeseoEntidad> listaDeseoEntidadList = new List<ListaDeDeseoEntidad>();

                listaDeseoEntidadList = Mapeador.Mapear<ListaDeDeseoEntidad>(dt);

                return listaDeseoEntidadList;
            }
        }


        public ListaDeDeseoEntidad Select(ListaDeDeseoEntidad listaDeseo)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@DNI", listaDeseo.NumeroDocumento),
                new SqlParameter("@NombreUsuario", listaDeseo.NombreUsuario),
                new SqlParameter("@IdServicio", listaDeseo.IdServicio)
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosSelect", parameters))
            {
                ListaDeDeseoEntidad ListaDeseoEntidad = new ListaDeDeseoEntidad();

                ListaDeseoEntidad = Mapeador.MapearFirst<ListaDeDeseoEntidad>(dt);

                return ListaDeseoEntidad;
            }
        }


        public void ActualizarEstadoListaDeseo(ListaDeDeseoEntidad listaDeDeseo)
        {
            SqlParameter[] parameters = new SqlParameter[]
                {
                 new SqlParameter("@NumeroDocumento", listaDeDeseo.NumeroDocumento),
                new SqlParameter("@IdDeseo", listaDeDeseo.IdDeseo),
                new SqlParameter("@IdEstado", 2)
                };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeDeseosUpDate", parameters);
        }


    }
}
