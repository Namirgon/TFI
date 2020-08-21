using EcommerceHelper.Funciones.Persistencia;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.Funciones.Seguridad
{
  
        public static class ServicioLog
        {

            public enum TipoLog
            {
                Accion = 1, Error = 2
            }


            public static void CrearLog(Exception exc, string AccionExcepcion, string elUsuario, string elIdUsuario) //Bitacora Errores
            {
                string MsjExcepciones = ObtenerMsjExcepciones(exc);

                if (SqlClientUtility.ConexionGetEstado())
                {
                    if (!string.IsNullOrWhiteSpace(elUsuario))
                    {
                        GrabarLogBD(elUsuario, elIdUsuario, DateTime.Now, "Error", AccionExcepcion, MsjExcepciones);
                    }
                    else
                    {
                        GrabarLogBD("SIN_USUARIO", elIdUsuario, DateTime.Now, "Error", AccionExcepcion, MsjExcepciones);
                    }

                }
                else
                {
                    try
                    {
                        if (!string.IsNullOrWhiteSpace(elUsuario))
                        {
                            GrabarLogBD(elUsuario, elIdUsuario, DateTime.Now, "Error", AccionExcepcion, MsjExcepciones);
                        }
                        else
                        {
                            GrabarLogBD("SIN_USUARIO", elIdUsuario, DateTime.Now, "Error", AccionExcepcion, MsjExcepciones);
                        }
                    }
                    catch (Exception)
                    {

                    }
                }
            }


            public static void CrearLogEventos(string Accion, string Mensaje, string elUsuario, string elIdUsuario)//Bitacora Eventos
            {
                if (!string.IsNullOrWhiteSpace(elUsuario))
                    GrabarLogBD(elUsuario, elIdUsuario, DateTime.Now, "Evento", Accion, Mensaje);
                else
                    GrabarLogBD("SIN_USUARIO", elIdUsuario, DateTime.Now, "Evento", Accion, Mensaje);
            }


            public static string ObtenerMsjExcepciones(Exception unaEx)
            {
                string LaCadena = "";
                Exception elError = unaEx;
                while (elError != null)
                {
                    StackTrace trace = new StackTrace(elError, true);
                    string NomArchivo = trace.GetFrame(0).GetFileName();
                    int NroLinea = trace.GetFrame(0).GetFileLineNumber();
                    LaCadena = LaCadena + Environment.NewLine + elError.Message + Environment.NewLine + "Archivo: " + NomArchivo + Environment.NewLine + "Linea: " + NroLinea + Environment.NewLine + elError.StackTrace.ToString();
                    elError = elError.InnerException;
                }
                return LaCadena;
            }

            private static void GrabarLogBD(string elNombreUs, string elIdUsuario, DateTime fecha, string tipo, string accionrealizada, string msj)
            {
                try
                {
                    SqlParameter[] parameters = new SqlParameter[]
                    {
                    new SqlParameter("@elNombreUs", elNombreUs),
                    new SqlParameter("@IdUsuario", elIdUsuario),
                    new SqlParameter("@fecha", fecha),
                    new SqlParameter("@tipo", tipo),
                    new SqlParameter("@accionrealizada", accionrealizada),
                    new SqlParameter("@msj", msj)
                    };

                    SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "BitacoraLogInsert", parameters);
                }
                catch (Exception es)
                {
                    throw;
                }
            }





        }
    }


