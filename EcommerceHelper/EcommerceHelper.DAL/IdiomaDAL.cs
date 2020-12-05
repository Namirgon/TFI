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
   public class IdiomaDAL
    {


        #region Methods

        public void Insert(IdiomaEntidad lenguaje)
        {
            ValidationUtility.ValidateArgument("lenguaje", lenguaje);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Descripcion", lenguaje.Descripcion)
            };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IdiomaInsert", parameters);
            
        }
        public void RegistrarControlTraduccion(MultiIdiomaEntidad control)
        {
           

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdIdioma", control.MiIdioma.IdIdioma),
                 new SqlParameter("@NombreDelControl", control.NombreDelControl),
                  new SqlParameter("@Texto", control.Texto)
            };

            var resultado = (decimal)SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MultiIdiomaControlInsert", parameters);
            int IdIdiomaRes = decimal.ToInt32(resultado);
            control.IdMultiIdioma = IdIdiomaRes;
        }

        public void Update(IdiomaEntidad lenguaje)
        {
            ValidationUtility.ValidateArgument("lenguaje", lenguaje);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdIdioma", lenguaje.IdIdioma),
                new SqlParameter("@Descripcion", lenguaje.Descripcion)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IdiomaUpdate", parameters);
        }

        public void MultiIdiomaControlUpdate(MultiIdiomaEntidad lenguaje)
        {
            ValidationUtility.ValidateArgument("lenguaje", lenguaje);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdMultiIdioma", lenguaje.IdMultiIdioma  ),
                 new SqlParameter("@IdIdioma", lenguaje.MiIdioma .IdIdioma),
                new SqlParameter("@NombreDelControl", lenguaje.NombreDelControl),
                   new SqlParameter("@Texto", lenguaje.Texto)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MultiIdiomaControlUpdate", parameters);
        }

        public void Delete(int idIdioma)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdIdioma", idIdioma)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IdiomaDelete", parameters);
        }
        public void DeleteControlMultiIdioma(int idIdioma)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdMultiIdioma", idIdioma)
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MultiIdiomaControlDelete", parameters);
        }

        public IdiomaEntidad Select(int idIdioma)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdIdioma", idIdioma)
            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IdiomaSelect", parameters))
            {
                IdiomaEntidad LenguajeEntidad = new IdiomaEntidad();

                LenguajeEntidad = Mapeador.MapearFirst<IdiomaEntidad>(dt);

                return LenguajeEntidad;
            }
        }

        public MultiIdiomaEntidad SelectControl(int idMultiIdioma)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdMultiIdioma", idMultiIdioma)
            };

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "SelectControl", parameters))
            {
               MultiIdiomaEntidad LenguajeEntidad = new MultiIdiomaEntidad();

                LenguajeEntidad = MapearControles2(dt);

                return LenguajeEntidad;
            }
        }

        public MultiIdiomaEntidad MapearControles2(DataSet ds)
        {

            MultiIdiomaEntidad unControl = new MultiIdiomaEntidad();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                  

                    unControl.IdMultiIdioma = (int)row["IdMultiIdioma"];
                    unControl.MiIdioma = new IdiomaEntidad();
                    unControl.MiIdioma.IdIdioma = (int)row["IdIdioma"];
                    unControl.NombreDelControl = row["NombreDelControl"].ToString();

                    unControl.Texto = row["Texto"].ToString();



                   
                }
                return unControl;

            }
            catch (Exception es)
            {
                throw;
            }

        }
        public List<IdiomaEntidad> SelectAll()
        {
            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "IdiomaSelectAll"))
            {
                List<IdiomaEntidad> lenguajeEntidadList = new List<IdiomaEntidad>();

                lenguajeEntidadList = Mapeador.Mapear<IdiomaEntidad>(dt);

                return lenguajeEntidadList;
            }
        }


        public List<MultiIdiomaEntidad> MultidiomaSelectAllControles()
        {
            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "MultidiomaSelectAll"))
            {
                List<MultiIdiomaEntidad> ListaControlesMultidioma = new List<MultiIdiomaEntidad>();

                ListaControlesMultidioma = MapearControles(dt);

                return ListaControlesMultidioma;
            }
        }

        public List<MultiIdiomaEntidad> MapearControles(DataSet ds)
        {

            List<MultiIdiomaEntidad> ListControles = new List<MultiIdiomaEntidad>();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    MultiIdiomaEntidad unControl = new MultiIdiomaEntidad();

                    unControl.IdMultiIdioma = (int)row["IdMultiIdioma"];
                    unControl.MiIdioma = new IdiomaEntidad();
                    unControl.MiIdioma.IdIdioma= (int)row["IdIdioma"];
                    unControl.NombreDelControl = row["NombreDelControl"].ToString();
                  
                    unControl.Texto = row["Texto"].ToString();
                    
                  

                    ListControles.Add(unControl);
                }
                return ListControles;

            }
            catch (Exception es)
            {
                throw;
            }

        }


        #endregion

    }
}
