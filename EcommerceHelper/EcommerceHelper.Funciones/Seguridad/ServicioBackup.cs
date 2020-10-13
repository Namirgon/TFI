using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;



namespace EcommerceHelper.Funciones.Seguridad
{
   public  class ServicioBackup
   {

        public static bool Respaldar( string ruta)
        {
            UsuarioEntidad usuarioAutenticado = new UsuarioEntidad();
            HttpContext Current = HttpContext.Current;

           

            SqlParameter[] parameters = new SqlParameter[]
            {
                
                new SqlParameter("@Destino", ruta),
                
            };


            usuarioAutenticado = (UsuarioEntidad)Current.Session["Usuario"];

            try
            {
                if (!usuarioAutenticado.Permisos.Exists(x => x.NombreIFamPat == "Admin"))
                    throw new InvalidOperationException("No posee los permisos suficientes");
                SqlClientUtility.ExecuteNonQueryBackup(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "BaseDatosRespaldar", parameters);
                return true;
            }
            catch (Exception es)
            {
                throw;
            }
        }




        public static bool Restaurar(string Nombre, string Ubicacion)
        {
            UsuarioEntidad usuarioAutenticado = new UsuarioEntidad();
            HttpContext Current = HttpContext.Current;
            usuarioAutenticado = (UsuarioEntidad)Current.Session["Usuario"];

            try
            {
                if (usuarioAutenticado == null)
                    return false;
                if (!usuarioAutenticado.Permisos.Exists(x => x.NombreIFamPat == "Admin"))
                    throw new InvalidOperationException("No posee los permisos suficientes");

                if (!string.IsNullOrWhiteSpace(Nombre) && !string.IsNullOrWhiteSpace(Ubicacion))
                {
                    string stringPararProcesos = "DECLARE @ProcessId varchar(4) " + Environment.NewLine + "DECLARE CurrentProcesses SCROLL CURSOR FOR" + Environment.NewLine +
                "select spid from sysprocesses where dbid = (select dbid from sysdatabases where name = 'HelperDataBase' ) order by spid " + Environment.NewLine +
                "FOR READ ONLY" + Environment.NewLine + "OPEN CurrentProcesses" + Environment.NewLine + "FETCH NEXT FROM CurrentProcesses INTO @ProcessId" +
                Environment.NewLine + "WHILE @@FETCH_STATUS <> -1" + Environment.NewLine + "BEGIN" + Environment.NewLine + "	Exec ('KILL ' +  @ProcessId)" +
                Environment.NewLine + "	FETCH NEXT FROM CurrentProcesses INTO @ProcessId" + Environment.NewLine + "                    End" + Environment.NewLine +
                "CLOSE CurrentProcesses" + Environment.NewLine + "DeAllocate CurrentProcesses";

                    string stringRestaurar = "RESTORE DATABASE " + Nombre + " FROM DISK = '" + Ubicacion + "' WITH REPLACE, RECOVERY";

                    //string stringRestaurar = "RESTORE DATABASE " + Nombre + " FROM DISK = '" + Ubicacion + "' WITH MOVE, RECOVERY";


                    SqlClientUtility.ExecuteNonQueryRestaurar(CommandType.Text, stringPararProcesos);
                    SqlClientUtility.ExecuteNonQueryRestaurar(CommandType.Text, stringRestaurar);
                   
                    return true;
                }
                return false;

            }
            catch (Exception es)
            {
                throw;
            }
        }




    }
}
