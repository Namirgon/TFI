﻿using EcommerceHelper.Entidades;
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
    public class DireccionDAL
    {


        public int Insert(DireccionEntidad direccion)
        {
            ValidationUtility.ValidateArgument("direccion", direccion);

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Calle", direccion.Calle),
                new SqlParameter("@Numero", direccion.Numero),
                new SqlParameter("@Piso", direccion.Piso),
                new SqlParameter("@Departamento", direccion.Departamento),
                 new SqlParameter("@IdProvincia", direccion.MiProvincia.IdProvincia),
                new SqlParameter("@IdLocalidad", direccion.MiLocalidad.IdLocalidad),
                new SqlParameter("@IdTipoDireccion", direccion._MiTipoDireccion.IdTipoDireccion)

            };

            var valor = Convert.ToInt32(SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionInsert", parameters));

            return valor;
        }

        public List<DireccionEntidad> ListarDireccionesDAL(int Id)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdUsuario", Id),

            };
            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarDireccionbyIdUsuario", parameters))
            //using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "DireccionSelectByNumeroDocumento", parameters))
            {
                List<DireccionEntidad> ListaMisDirecciones = new List<DireccionEntidad>();

                ListaMisDirecciones = MapearMisDirecciones(ds);

                return ListaMisDirecciones;
            }

        }
        public List<DireccionEntidad> MapearMisDirecciones(DataSet ds)
        {

            List<DireccionEntidad> ListDirecciones = new List<DireccionEntidad>();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    DireccionEntidad UnaDireccion = new DireccionEntidad();

                    UnaDireccion.IdDireccion = (int)row["IdDireccion"];
                    UnaDireccion.Calle= row["Calle"].ToString();
                    UnaDireccion.Numero= (int)row["Numero"];
                    UnaDireccion.Piso= row["Piso"].ToString();
                    UnaDireccion.Departamento= row["Departamento"].ToString();
                    UnaDireccion.MiProvincia = new ProvinciaEntidad();
                    UnaDireccion.MiProvincia.IdProvincia= (int)row["IdProvincia"];
                    UnaDireccion.MiLocalidad = new LocalidadEntidad();
                    UnaDireccion.MiLocalidad.IdLocalidad= (int)row["IdLocalidad"];
                    UnaDireccion.MiTipoDireccion = new TipoDireccionEntidad();
                   UnaDireccion.MiTipoDireccion.IdTipoDireccion= (int)row["IdTipoDireccion"];

                    ListDirecciones.Add(UnaDireccion);
                }
                return ListDirecciones;

            }
            catch (Exception es)
            {
                throw;
            }

        }
        
    }
}

