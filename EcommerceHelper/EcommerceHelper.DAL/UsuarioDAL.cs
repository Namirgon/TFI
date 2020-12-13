using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.Entidades;
using System.Data.SqlClient;
using System.Data;
using EcommerceHelper.Funciones.Persistencia;
using Entidades.Servicios.Permisos;
using System.Data.Common;
using EcommerceHelper.Entidades.Servicios;
using EcommerceHelper.DAL.Servicios;

namespace EcommerceHelper.DAL
{
    public class UsuarioDAL
    {
        UsuarioEntidad Usuario = new UsuarioEntidad();

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


                if (entidad.Email != null && entidad.Password != null)
                {
                    return entidad;
                }
                else
                {
                    return null;

                }
            }




        }
        public UsuarioEntidad BuscarEmail(string Email)
        {
            SqlParameter[] parameters = new SqlParameter[]

            {
                new SqlParameter("@Email", Email),


            };


            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "BuscarEmail", parameters))
            {
                UsuarioEntidad entidad = new UsuarioEntidad();
                entidad = Mapeador.MapearFirst<UsuarioEntidad>(dt);


                if (entidad.Email != null)
                {
                    return entidad;
                }
                else
                {
                    return null;

                }
            }
        }

        public UsuarioEntidad ActualizarPassword(string Email, string nuevapassword)
        {
                SqlParameter[] parameters = new SqlParameter[]
                 {

                new SqlParameter("@Email", Email ),
                new SqlParameter("@Password", nuevapassword)
            
                  };


            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioUpdateClave", parameters);


            return null;
        }



        public void Insert(UsuarioEntidad usuario)
      {
            ValidationUtility.ValidateArgument("usuario", usuario);

            SqlParameter[] parameters = new SqlParameter[]
            {

                new SqlParameter("@IdTipoUsuario", usuario.MiUsuario.IdTipoUsuario),
                 new SqlParameter("@Email", usuario.Email),
                new SqlParameter("@Password", usuario.Password),
                new SqlParameter("@Nombre", usuario.Nombre),
                new SqlParameter("@Apellido", usuario.Apellido),
                 new SqlParameter("@IdSexo", usuario.MiSexo.IdSexo),
                new SqlParameter("@NumeroDocumento", usuario.NumeroDocumento), 
                new SqlParameter("@IdTipoTelefono", usuario.MiTelefono.IdTipoTelefono),
                new SqlParameter("@NumeroTelefono", usuario.NumeroTelefono),
                 new SqlParameter("@DVH", usuario.DVH),
            };

            var Resultado = (decimal)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioInsert", parameters);
            int IdUsuarioRes = Decimal.ToInt32(Resultado);
            usuario.IdUsuario = IdUsuarioRes;
         }

        //InsertFamiliaUsuario
        public void InsertFamiliaUsuario(int Usuario, int Familia, string email)
        {
           

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdFamilia", Familia),
                new SqlParameter("@IdUsuario", Usuario),
                new SqlParameter("@Email", email),


            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "FamiliaUsuarioInsert", parameters);
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

        public void UpdateDatosEmpleado(UsuarioEntidad usuario)
        {
            ValidationUtility.ValidateArgument("usuario", usuario);

            SqlParameter[] parameters = new SqlParameter[]
            {

                new SqlParameter("@IdUsuario", usuario.IdUsuario),
                new SqlParameter("@Nombre", usuario.Nombre),
                new SqlParameter("@Apellido", usuario.Apellido),
                new SqlParameter("@NumeroDocumento", usuario.NumeroDocumento),
                new SqlParameter("@IdTipoUsuario", usuario.MiUsuario.IdTipoUsuario ),
                new SqlParameter("@IdSexo", usuario.MiSexo.IdSexo),
                new SqlParameter("@Email", usuario.Email),
                new SqlParameter("@NumeroTelefono", usuario.NumeroTelefono),
               new SqlParameter("@DVH", usuario.DVH)

        };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UpdateDatosEmpleado", parameters);
           // var Resultado =(decimal)
            //int IdUsuarioRes = Decimal.ToInt32(Resultado);
            //usuario.IdUsuario = IdUsuarioRes;
        }
        public void UpdateDatosEmpleado2(UsuarioEntidad usuario)
        {
            ValidationUtility.ValidateArgument("usuario", usuario);

            SqlParameter[] parameters = new SqlParameter[]
            {

                new SqlParameter("@IdUsuario", usuario.IdUsuario),
                new SqlParameter("@Nombre", usuario.Nombre),
                new SqlParameter("@Apellido", usuario.Apellido),
                new SqlParameter("@NumeroDocumento", usuario.NumeroDocumento),
              //  new SqlParameter("@IdTipoUsuario", usuario.MiUsuario.IdTipoUsuario ),
                new SqlParameter("@IdSexo", usuario.MiSexo.IdSexo),
                new SqlParameter("@Email", usuario.Email),
                new SqlParameter("@NumeroTelefono", usuario.NumeroTelefono),
               new SqlParameter("@DVH", usuario.DVH)

        };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UpdateDatosEmpleado2", parameters);
            // var Resultado =(decimal)
            //int IdUsuarioRes = Decimal.ToInt32(Resultado);
            //usuario.IdUsuario = IdUsuarioRes;
        }

        public List<IFamPat> UsuarioTraerPermisos(string email, int IdUsuario)
        {

            List<IFamPat> unosPermisos = new List<IFamPat>();

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Email", email ),
                new SqlParameter("@IdUsuario", IdUsuario)
            };
            SqlParameter[] parameters2 = new SqlParameter[]
            {
                new SqlParameter("@Email", email ),
                new SqlParameter("@IdUsuario", IdUsuario)
            };

            try
            {
                //Traigo las familias
                using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioTraerFamilias", parameters))
                {
                    List<IFamPat> unasFamilias = new List<IFamPat>();
                    unasFamilias = MapearFamilias(ds);

                    if (unasFamilias != null && unasFamilias.Count > 0)
                        unosPermisos.AddRange(unasFamilias);
                }
                //Traigo las patentes
                using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioTraerPatentes", parameters2))
                {
                    List<IFamPat> unasPatentes = new List<IFamPat>();
                    unasPatentes = MapearPatentes(ds);
                    unosPermisos.AddRange(unasPatentes);
                }

                return unosPermisos;
            }
            catch (Exception es)
            {
                throw;
            }
        }



        public static List<IFamPat> MapearFamilias(DataSet ds)
        {
            List<IFamPat> ResElementosFamPat = new List<IFamPat>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    IFamPat unaFamilia = new Familia();
                    unaFamilia.IdIFamPat = (int)row["IdFamilia"];
                    unaFamilia.NombreIFamPat = row["NombreFamilia"].ToString();
                    ResElementosFamPat.Add(unaFamilia);
                }
                return ResElementosFamPat;
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public static List<IFamPat> MapearPatentes(DataSet ds)
        {
            List<IFamPat> ResElementosFamPat = new List<IFamPat>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    IFamPat unaPatente = new Patente();
                    unaPatente.IdIFamPat = (int)row["IdPatente"];
                    unaPatente.NombreIFamPat = row["NombrePatente"].ToString();
                    ResElementosFamPat.Add(unaPatente);
                }
                return ResElementosFamPat;
            }
            catch (Exception es)
            {
                throw;
            }
        }



        public List<UsuarioEntidad> SelectAllUsuarios()
        {
            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioLeerDVH"))
            {

                List<UsuarioEntidad> AllUsuariosDVH = new List<UsuarioEntidad>();



                AllUsuariosDVH = MapearUsuario(dt);

                return AllUsuariosDVH;
            }

        }
        public List<UsuarioEntidad> SelectAllUsuaariosParaDVH()
        {
            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioLeerParaDVH"))
            {

                List<UsuarioEntidad> AllUsuariosDVH = new List<UsuarioEntidad>();

               

                AllUsuariosDVH = MapearUsuarioDVH(dt);

                return AllUsuariosDVH;
            }
           
        }

        public List<UsuarioEntidad> SelectAllEmpleados()
        {
            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SelectEmpleado"))
            {

                List<UsuarioEntidad> AllEmpleados = new List<UsuarioEntidad>();



                AllEmpleados = MapearUsuarioEmpleado(dt);

                return AllEmpleados;
            }

        }
        public List<UsuarioEntidad> SelectAllEmpleadoDeLimpieza( )
        {
            //SqlParameter[] parameter = new SqlParameter[]
            //{
            //    new SqlParameter ("@IdLocalidad", idLocalidad)

            //};
            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SelectEmpleadoDeLimpieza"))
            {

                List<UsuarioEntidad> AllEmpleados = new List<UsuarioEntidad>();



                AllEmpleados = MapearUsuarioEmpleado(dt);

                return AllEmpleados;
            }

        }
        public List<UsuarioEntidad> SelectALLEmpleadoDeLimpiezabyLocalidad(int idLocalidad)
        {
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter ("@IdLocalidad", idLocalidad)

            };
            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "[SelectALLEmpleadoDeLimpiezabyLocalidad]", parameter))
            {

                List<UsuarioEntidad> AllEmpleados = new List<UsuarioEntidad>();



                AllEmpleados = MapearUsuarioEmpleado(dt);

                return AllEmpleados;
            }

        }


        public List<UsuarioEntidad> MapearUsuarioEmpleado(DataSet ds)
        {

            List<UsuarioEntidad> ListUsuarios = new List<UsuarioEntidad>();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    UsuarioEntidad unUsuario = new UsuarioEntidad();

                    unUsuario.IdUsuario = (int)row["IdUsuario"];                   
                    unUsuario.Nombre = row["Nombre"].ToString();
                    unUsuario.Apellido = row["Apellido"].ToString();                  
                    unUsuario.NumeroDocumento = (int)row["NumeroDocumento"];
                    unUsuario.NumeroTelefono = (int)row["NumeroTelefono"];
                    unUsuario.MiSexo = new SexoEntidad();
                    unUsuario.MiSexo.IdSexo = (int)row["IdSexo"];
                    unUsuario.Email = row["Email"].ToString();
                    unUsuario.MiDireccion = new List<DireccionEntidad> ();

                   
                    {

                        DireccionEntidad d = new DireccionEntidad();

                        d.Calle = row["Calle"].ToString();
                        d.Numero = (int)row["Numero"];
                        d.Piso = row["Piso"].ToString();
                        d.Departamento = row["Departamento"].ToString();
                        d.MiProvincia = new ProvinciaEntidad();
                        d.MiProvincia.IdProvincia = (int)row["IdProvincia"];

                        d.MiLocalidad = new LocalidadEntidad();
                        d.MiLocalidad.IdLocalidad = (int)row["IdLocalidad"];


                        unUsuario.MiDireccion.Add(d);

                    }
                    ListUsuarios.Add(unUsuario);
                }
                return ListUsuarios;

            }
            catch (Exception es)
            {
                throw;
            }

        }
        public List<UsuarioEntidad> MapearUsuarioDVH(DataSet ds)
        {

            List<UsuarioEntidad> ListUsuarios = new List<UsuarioEntidad>();
           
           
            foreach (DataRow row in ds.Tables[0].Rows)
                {
                    UsuarioEntidad unUsuario = new UsuarioEntidad();

                    unUsuario.IdUsuario = (int)row["IdUsuario"];
                    unUsuario.Nombre = row["Nombre"].ToString();
                    unUsuario.Apellido = row["Apellido"].ToString();
                    unUsuario.NumeroDocumento = (int)row["NumeroDocumento"];
                    unUsuario.Email = row["Email"].ToString();
                    unUsuario.Password = row["Password"].ToString();
                    unUsuario.NumeroTelefono = (int)row["NumeroTelefono"];
                  


                    ListUsuarios.Add(unUsuario);
                }

            return ListUsuarios;
            

        }


        public List<UsuarioEntidad> MapearUsuario(DataSet ds)
        {

            List<UsuarioEntidad> ListUsuarios = new List<UsuarioEntidad>();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    UsuarioEntidad unUsuario = new UsuarioEntidad();

                    unUsuario.IdUsuario = (int)row["IdUsuario"];
                    unUsuario.MiUsuario = new TipoUsuarioEntidad();
                    unUsuario.MiUsuario.IdTipoUsuario = (int)row["IdTipoUsuario"];
                   
                    unUsuario.Nombre = row["Nombre"].ToString();
                    unUsuario.Apellido = row["Apellido"].ToString();
                    unUsuario.NumeroDocumento = (int)row["NumeroDocumento"];
                    unUsuario.MiSexo = new SexoEntidad();
                    unUsuario.MiSexo.IdSexo = (int)row["IdSexo"];

                    unUsuario.Email = row["Email"].ToString();
                    unUsuario.Password = row["Password"].ToString();

                    unUsuario.MiTelefono = new TipoTelefonoEntidad();
                    unUsuario.MiTelefono.IdTipoTelefono = (int)row["IdTipoTelefono"];
                   unUsuario.NumeroTelefono=(int) row["NumeroTelefono"];
                    unUsuario.DVH = (int)row["DVH"];
                    
                   
                    ListUsuarios.Add(unUsuario);
                }
                return ListUsuarios;

            }
            catch (Exception es)
            {
                throw;
            }

        }


        public UsuarioEntidad Select(int id)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdUsuario", id),

            };

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SelectUsuarioByIDUsuario", parameters))
            {
                UsuarioEntidad EmpleadoSelect = new UsuarioEntidad();

                EmpleadoSelect = MapearUnUsuario(dt);

                return EmpleadoSelect;
            }
        }
        public UsuarioEntidad MapearUnUsuario(DataSet ds)
        {
            UsuarioEntidad unUsuario = new UsuarioEntidad();


            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    unUsuario.IdUsuario = (int)row["IdUsuario"];
                    unUsuario.Nombre = row["Nombre"].ToString();
                    unUsuario.Apellido = row["Apellido"].ToString();
                    unUsuario.NumeroDocumento = (int)row["NumeroDocumento"];
                    unUsuario.MiSexo = new SexoEntidad();
                    unUsuario.MiSexo.IdSexo = (int)row["IdSexo"];
                    unUsuario.Email = row["Email"].ToString();
                    unUsuario.NumeroTelefono = (int)row["NumeroTelefono"];

                    unUsuario.MiDireccion = new List<DireccionEntidad>();

                    {

                        DireccionEntidad d = new DireccionEntidad();

                        d.IdDireccion = (int)row["IdDireccion"];
                        d.Calle = row["Calle"].ToString();
                        d.Numero = (int)row["Numero"];
                        d.Piso = row["Piso"].ToString();
                        d.Departamento = row["Departamento"].ToString();
                        d.MiProvincia = new ProvinciaEntidad();
                        d.MiProvincia.IdProvincia = (int)row["IdProvincia"];
                        d.MiLocalidad = new LocalidadEntidad();
                        d.MiLocalidad.IdLocalidad = (int)row["IdLocalidad"];

                        unUsuario.MiDireccion.Add(d);

                    }

                }
                return unUsuario;

            }
            catch (Exception es)
            {
                throw;
            }

        }
        public bool UsuarioAgregarPermisos(List<IFamPat> PerAgregar, string Email)
        {
            try
            {
                foreach (IFamPat unPermiso in PerAgregar)
                {
                    if (unPermiso.CantHijos > 0)
                        UsuarioAgregarFamilia(unPermiso as Familia, Email);
                    else
                        UsuarioAgregarPatente(unPermiso as Patente, Email);
                }
                return true;
            }
            catch (Exception es)
            {
                throw;
            }
        }


        public void UsuarioAgregarFamilia(Familia unaFamilia, string Email)
        {
            try
            {
                SqlParameter[] parametersFam = new SqlParameter[]
                {
                    new SqlParameter("@IdFamilia", unaFamilia.IdIFamPat),
                    new SqlParameter("@Email", Email),
              
                };

                SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioAgregarFamilia", parametersFam);
            }
            catch (Exception es)
            {
                throw;
            }
        }


        public void UsuarioAgregarPatente(Patente unaPatente, string Email)
        {
            try
            {
                SqlParameter[] parametersPat = new SqlParameter[]
                {
                    new SqlParameter("@IdPatente", unaPatente.IdIFamPat),
                    new SqlParameter("@Email", Email),
                   
                };

                SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioAgregarPatente", parametersPat);
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public bool UsuarioQuitarPermisos(List<IFamPat> PerQuitar, string Email)
        {
            try
            {
                foreach (IFamPat unPermiso in PerQuitar)
                {
                    if (unPermiso.CantHijos > 0)
                        UsuarioQuitarFamilia(unPermiso as Familia, Email);
                    else
                        UsuarioQuitarPatente(unPermiso as Patente, Email);
                }

                return true;
            }
            catch (Exception es)
            {
                throw;
            }
        }


        public void UsuarioQuitarFamilia(Familia unaFamilia, string Email)
        {
            try
            {
                SqlParameter[] parametersFam = new SqlParameter[]
                {
                    new SqlParameter("@IdFamilia", unaFamilia.IdIFamPat),
                    new SqlParameter("@NombreUsuario", Email),
                  
                };

                SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioQuitarFamilia", parametersFam);
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public void UsuarioQuitarPatente(Patente unaPatente, string Email)
        {
            try
            {
                SqlParameter[] parametersPat = new SqlParameter[]
                {
                    new SqlParameter("@IdPatente", unaPatente.IdIFamPat),
                    new SqlParameter("@NombreUsuario", Email),
                   
                };

                SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "UsuarioQuitarPatente", parametersPat);
            }
            catch (Exception es)
            {
                throw;
            }
        }





    }
}
