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


            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "BuscarUsuario", parameters))
            {
                UsuarioEntidad entidad = new UsuarioEntidad();
                entidad = Mapeador.MapearFirst<UsuarioEntidad>(dt);


                if (entidad.Email != null && entidad.Password!=null)
                {
                    return entidad;
                } 
                else
                {
                    return null;

                }
            }


  

        }
        public void Insert(UsuarioEntidad usuario)
        {
            ValidationUtility.ValidateArgument("usuario", usuario);

            SqlParameter[] parameters = new SqlParameter[]
            {

                new SqlParameter("@IdTipoUsuario", usuario.IdUsuarioTipo),
                new SqlParameter("@Nombre", usuario.Nombre),
                new SqlParameter("@Apellido", usuario.Apellido),
                //new SqlParameter("@IdTipoDocumento", usuario.MiDocumento.IdTipoDeDocumento),
                new SqlParameter("@NumeroDocumento", usuario.NumeroDocumento),
                new SqlParameter("@IdSexo", usuario.MiSexo.IdSexo),
              //  new SqlParameter("@IdDireccion", usuario.MiDireccion),
                new SqlParameter("@Email", usuario.Email),
                new SqlParameter("@Password", usuario.Password),
                new SqlParameter("@IdTipoTelefono", usuario.MiTelefono.IdTipoTelefono),
                new SqlParameter("@NumeroTelefono", usuario.NumeroTelefono),
            };

            var Resultado = (decimal)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioInsert", parameters);
            int IdUsuarioRes = Decimal.ToInt32(Resultado);
            usuario.IdUsuario = IdUsuarioRes;
        }

        public void UsuarioDireccionCrear(DireccionEntidad direccionUsuario, UsuarioEntidad elUsuario)
        {
            ValidationUtility.ValidateArgument("UsuarioDireccion", direccionUsuario);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdDireccion", direccionUsuario.IdDireccion),
                new SqlParameter("@IdUsuario", elUsuario.IdUsuario),
                new SqlParameter("@NumeroDocumento", elUsuario.NumeroDocumento),


            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionUsuarioInsert", parameters);
        }
    }
}
