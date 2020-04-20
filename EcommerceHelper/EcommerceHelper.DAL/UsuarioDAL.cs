using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.Entidades;
using System.Data.SqlClient;
using System.Data;
using EcommerceHelper.Funciones.Persistencia;

namespace EcommerceHelper.DAL
{
    public class UsuarioDAL
    {
        public UsuarioEntidad BuscarUsuario(string Email, string Password)
        {
            SqlParameter[] parameters = new SqlParameter[]

            {
                new SqlParameter("@Email", Email),
                new SqlParameter("@Password", Password)

            };


            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "[BuscarUsuario]", parameters))
            {
                UsuarioEntidad entidad = new UsuarioEntidad();
                entidad = Mapeador.MapearFirst<UsuarioEntidad>(dt);
                return entidad;
            }
        }
    }
}
