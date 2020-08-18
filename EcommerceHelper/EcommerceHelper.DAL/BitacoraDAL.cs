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
  public   class BitacoraDAL
    {

        public List<BitacoraEntidad> BitacoraVerLogs(string unTipoLog, DateTime? fechaInicio = null, DateTime? fechaFin = null)
        {

            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@TipoLog", unTipoLog));
            if (fechaInicio != DateTime.MinValue)
                parameters.Add(new SqlParameter("@fechaInicio", fechaInicio));
            if (fechaFin != DateTime.MinValue)
                parameters.Add(new SqlParameter("@fechaFin", fechaFin));


            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "BitacoraVerLogs", parameters.ToArray()))
            {
                List<BitacoraEntidad> unaLista = new List<BitacoraEntidad>();
                unaLista = MapearBitacoraLogs(ds);
                return unaLista;
            }
        }

        public List<BitacoraEntidad> MapearBitacoraLogs(DataSet ds)
        {
            List<BitacoraEntidad> ResLogs = new List<BitacoraEntidad>();

            try
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    BitacoraEntidad unLog = new BitacoraEntidad();

                    unLog.IdBitacoraLog = (int)row["IdBitacoraLog"];
                    unLog.IdUsuario  =(int) row["IdUsuario"];
                    unLog.NombreUsuario = row["NombreUsuario"].ToString();
                    unLog.Fecha = DateTime.Parse(row["Fecha"].ToString());
                    unLog.TipoLog = row["TipoLog"].ToString();
                    unLog.Accion = row["Accion"].ToString();
                    unLog.Mensaje = row["Mensaje"].ToString();
                    ResLogs.Add(unLog);
                }
                return ResLogs;
            }
            catch (Exception es)
            {
                throw;
            }
        }
    }
}
