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
 public    class ComprobanteDAL
    {

        public void Insert(ComprobanteEntidad comprobante)
        {
            ValidationUtility.ValidateArgument("comprobante", comprobante);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdTipoComprobante", comprobante.MiTipoComprobante .IdTipoComprobante),
                new SqlParameter("@IdSucursal", comprobante.MiSucursal.IdSucursal),
                new SqlParameter("@IdOrdenDeTrabajo", comprobante.MiOrdenDeTrabajo.IdOrdenDeTrabajo ),           
                new SqlParameter("@Fecha", comprobante.Fecha )

            };

            var Resultado = (decimal)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteInsert", parameters);
            
            int IdComprobanteRes = Decimal.ToInt32(Resultado);
            comprobante.IdComprobante= IdComprobanteRes;

            
        }

        public List<ComprobanteEntidad> SelectAllFacturas()
        {

            
            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "[ListarFacturaB]"))
            {
                List<ComprobanteEntidad> ListaDeFacturas = new List<ComprobanteEntidad>();

                ListaDeFacturas = MapearMisComprobantes(ds);

                return ListaDeFacturas;
            }

        }

        public List<ComprobanteEntidad> FindAllFacturasSinAsignar()
        {


            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarFacturaBSinAsignar"))
            {
                List<ComprobanteEntidad> ListaDeFacturas = new List<ComprobanteEntidad>();

                ListaDeFacturas = MapearMisComprobantes(ds);

                return ListaDeFacturas;
            }

        }

        public List<ComprobanteEntidad> SelectAllNC()
        {


            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "[ListarNC]"))
            {
                List<ComprobanteEntidad> ListNC = new List<ComprobanteEntidad>();

                ListNC = MapearMisComprobantes(ds);

                return ListNC;
            }

        }
        public List<ComprobanteEntidad> SelectAllND()
        {


            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "[ListarND]"))
            {
                List<ComprobanteEntidad> ListND = new List<ComprobanteEntidad>();

                ListND = MapearMisComprobantes(ds);

                return ListND;
            }

        }
        public List<ComprobanteEntidad> MapearMisComprobantes(DataSet ds)
        {

            List<ComprobanteEntidad> ListFacturas = new List<ComprobanteEntidad>();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    ComprobanteEntidad unaFactura = new ComprobanteEntidad();

                    unaFactura.IdComprobante= (int)row["IdComprobante"];
                    unaFactura.MiTipoComprobante = new TipoComprobanteEntidad();
                    unaFactura.MiTipoComprobante.Descripcion= row["NomTipoComprobante"].ToString();
                    unaFactura.MiSucursal = new SucursalEntidad();
                    unaFactura.MiSucursal.Descripcion= row["NomSucursal"].ToString();
                    unaFactura.Fecha = (DateTime)row["Fecha"];
                  
                    
                    ListFacturas.Add(unaFactura);
                }
                return ListFacturas;

            }
            catch (Exception es)
            {
                throw;
            }

        }

        public ComprobanteEntidad Select(int IdComprobante)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdComprobante", IdComprobante)
            };

            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ComprobanteSelectById", parameters))
            {
                ComprobanteEntidad ComprobanteEnt = new ComprobanteEntidad();

                ComprobanteEnt = MapearComprobante(ds);

                return ComprobanteEnt;
            }
        }

        public ComprobanteEntidad MapearComprobante(DataSet ds)
        {
            ComprobanteEntidad UnComprobante = new ComprobanteEntidad();
            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                   

                    UnComprobante.IdComprobante = (int)row["IdComprobante"];
                    UnComprobante.MiTipoComprobante = new TipoComprobanteEntidad();
                    UnComprobante.MiTipoComprobante.IdTipoComprobante  = (int)row["IdTipoComprobante"];
                    UnComprobante.MiSucursal = new SucursalEntidad();
                    UnComprobante.MiSucursal.IdSucursal =(int) row["IdSucursal"];
                    UnComprobante.MiOrdenDeTrabajo = new OrdenDeTrabajoEntidad();
                    UnComprobante.MiOrdenDeTrabajo.IdOrdenDeTrabajo = (int)row["IdOrdenDeTrabajo"];
                    UnComprobante.Fecha = (DateTime)row["Fecha"];

                    
                }
                return UnComprobante;

            }
            catch (Exception es)
            {
                throw;
            }

        }



    }
}
