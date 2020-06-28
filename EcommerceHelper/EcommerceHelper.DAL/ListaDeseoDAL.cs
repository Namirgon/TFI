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
                new SqlParameter("@IdServicio", listaDeseo.IdServicio)

            };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeseosInsert", parameters);
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

    }
}
