using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.BLL
{
   public class ReporteBLL
    {

        ReporteDAL _DalReporte = new ReporteDAL();

        public List<ReporteDeVentasEntidad> ReporteEntreFechas(DateTime FechaUno, DateTime FechaDos)
        {

          return   _DalReporte.ReporteVentas(FechaUno, FechaDos);

        }

        public List<ReporteDeEmpleadoEntidad> ReporteEntreFechasEmpleado(DateTime FechaUno, DateTime FechaDos)
        {

            return _DalReporte.ReporteEmpleado(FechaUno, FechaDos);

        }
    }
}
