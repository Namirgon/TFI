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

            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ReportePorEmpleado", parameters))

            {
                List<ReporteDeEmpleadoEntidad> ListaReporteEmpleado = new List<ReporteDeEmpleadoEntidad>();

                ListaReporteEmpleado = MapearEmpleados(ds);

                return ListaReporteEmpleado;
            }

        }

        public List<ReporteDeEmpleadoEntidad> MapearEmpleados(DataSet ds)
        {

            List<ReporteDeEmpleadoEntidad> ListEmpleados = new List<ReporteDeEmpleadoEntidad>();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    ReporteDeEmpleadoEntidad unEmpleado = new ReporteDeEmpleadoEntidad();

                    unEmpleado.Nombre = row["Nombre"].ToString();
                    unEmpleado.Apellido = row["Apellido"].ToString();
                    unEmpleado.Cantidad= (int)row["Cantidad"];
                   
                 
                    ListEmpleados.Add(unEmpleado);
                }
                return ListEmpleados;

            }
            catch (Exception es)
            {
                throw;
            }

        }
    }

    }
