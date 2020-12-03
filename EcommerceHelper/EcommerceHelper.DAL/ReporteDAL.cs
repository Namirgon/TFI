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
    public class ReporteDAL
    {

        public List<ReporteDeVentasEntidad> ReporteVentas(DateTime fechaUno, DateTime FechaDos)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
               new  SqlParameter ("@FechaInicio", fechaUno),
               new SqlParameter("@fechaFin",FechaDos)

            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReportePorVentas", parameters))

            {
                List<ReporteDeVentasEntidad> ListaReporteVentas = new List<ReporteDeVentasEntidad>();

                ListaReporteVentas = Mapeador.Mapear<ReporteDeVentasEntidad>(dt);

                return ListaReporteVentas;
            }




        }


        public List<ReporteDeEmpleadoEntidad> ReporteEmpleado(DateTime fechaUno, DateTime FechaDos)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
               new  SqlParameter ("@FechaInicio", fechaUno),
               new SqlParameter("@fechaFin",FechaDos)

            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReportePorEmpleado", parameters))

            {
                List<ReporteDeEmpleadoEntidad> ListaReporteEmpleado = new List<ReporteDeEmpleadoEntidad>();

                ListaReporteEmpleado = Mapeador.Mapear<ReporteDeEmpleadoEntidad>(dt);

                return ListaReporteEmpleado;
            }

        }
    }

    }
