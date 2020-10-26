using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Persistencia;

namespace EcommerceHelper.DAL
{
  public  class ItemOrdenDeTrabajoDAL
    {

        public void Insert(ItemOrdenDeTrabajoEntidad listaItemODT)
        {
            ValidationUtility.ValidateArgument("listaItem", listaItemODT);

            SqlParameter[] parameters = new SqlParameter[]
            {
                //new SqlParameter("@IdDeseo", listaDeseo.IdDeseo),
                new SqlParameter("@IdUsuario", listaItemODT.MiUsuario.IdUsuario),
                new SqlParameter("@NombreUsuario", listaItemODT.NombreUsuario),
                new SqlParameter("@IdServicio", listaItemODT.MiServicio.IdServicio ),
                 new SqlParameter("@IdOrdenDeTrabajo", listaItemODT._MiOrdenDeTrabajo.IdOrdenDeTrabajo),
                 new SqlParameter("@Precio", listaItemODT.Precio)

            };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaItemInsert", parameters);
        }

        public void InsertIdDireccion(int IdDir, int IdItem)
        {
            SqlParameter[] parameters = new SqlParameter[]
           {

                new SqlParameter("@IdItemOrdenDeTrabajo", IdItem),
                new SqlParameter("@IdDireccion", IdDir)
            };

            SqlClientUtility.ExecuteScalar(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ItemIdDireccionInsert", parameters);
        }
        public List<ItemOrdenDeTrabajoEntidad> SelectAllByNumeroIdUsuario(int NumeroIdUsuario)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdUsuario", NumeroIdUsuario),

            };

            using (DataTable dt = SqlClientUtility.ExecuteDataTable(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarItemByNumeroDocumento", parameters))
            {
                List<ItemOrdenDeTrabajoEntidad> listaItemEntidad = new List<ItemOrdenDeTrabajoEntidad>();

                listaItemEntidad = Mapeador.Mapear<ItemOrdenDeTrabajoEntidad>(dt);

                return listaItemEntidad;
            }
        }
        public List<ItemOrdenDeTrabajoEntidad> SelectIdItemOrdenDeTrabajo(int idOrdenDeTrabajo) 
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdOrdenDeTrabajo", idOrdenDeTrabajo),

            };
            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarItemByIdOrdenDeTrabajo", parameters))
            {
               
                List<ItemOrdenDeTrabajoEntidad> ItemOrdenDeTrabajoEntidad = new List<ItemOrdenDeTrabajoEntidad>();
                ItemOrdenDeTrabajoEntidad = MapeadorMuchosItemservicio(ds);
                return ItemOrdenDeTrabajoEntidad;
            }
        }

        private List<ItemOrdenDeTrabajoEntidad> MapeadorMuchosItemservicio(DataSet ds)
        {

            List<ItemOrdenDeTrabajoEntidad> ListaItemOT = new List<ItemOrdenDeTrabajoEntidad>();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    ItemOrdenDeTrabajoEntidad UnaItemOT = new ItemOrdenDeTrabajoEntidad();

                    UnaItemOT.IdItemOrdenDeTrabajo = (int)row["IdItemOrdenDeTrabajo"];
                    
                    UnaItemOT._MiServicio = new ServicioEntidad();
                    UnaItemOT._MiServicio.Titulo = row["Titulo"].ToString();
                    //UnaItemOT._MiServicio = new ServicioEntidad();
                    UnaItemOT._MiServicio.Descripcion = row["Descripcion"].ToString();
                    //UnaItemOT._MiServicio = new ServicioEntidad();
                    UnaItemOT._MiServicio.Precio = (decimal)row["Precio"];
                    //UnaItemOT._MiServicio = new ServicioEntidad();
                    UnaItemOT._MiServicio.URLimagen = row["URLimagen"].ToString();


                    ListaItemOT.Add(UnaItemOT);
                }

                return ListaItemOT;

            }
            catch (Exception es)
            {
                throw;
            }
        }


        public List <ItemOrdenDeTrabajoEntidad> SelectIdItem(int idOrdenDeTrabajo)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdOrdenDeTrabajo", idOrdenDeTrabajo),

            };

            using (DataSet ds= SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListarIdItemByIdOrdenDeTrabajo", parameters))
            {

                List<  ItemOrdenDeTrabajoEntidad > ItemOrdenDeTrabajoEntidad = new List<ItemOrdenDeTrabajoEntidad> ();
                ItemOrdenDeTrabajoEntidad = MapeadorListaItemOrdenDeTrabajoEntidad(ds);
                return ItemOrdenDeTrabajoEntidad;
            }
        }

        private List< ItemOrdenDeTrabajoEntidad > MapeadorListaItemOrdenDeTrabajoEntidad(DataSet ds)
        {

           List<  ItemOrdenDeTrabajoEntidad>  ListaItemOT = new List<ItemOrdenDeTrabajoEntidad>();

            try { 

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                  ItemOrdenDeTrabajoEntidad UnaItemOT = new ItemOrdenDeTrabajoEntidad();

                UnaItemOT.IdItemOrdenDeTrabajo = (int)row["IdItemOrdenDeTrabajo"];
                UnaItemOT._MiOrdenDeTrabajo = new OrdenDeTrabajoEntidad();
                UnaItemOT._MiOrdenDeTrabajo.IdOrdenDeTrabajo = (int)row["IdOrdenDeTrabajo"];
                UnaItemOT.MiUsuario = new UsuarioEntidad();
                UnaItemOT.MiUsuario.IdUsuario = (int)row["IdUsuario"];
                UnaItemOT.NombreUsuario = row["NombreUsuario"].ToString();
                UnaItemOT._MiServicio = new ServicioEntidad();
                UnaItemOT._MiServicio.IdServicio = (int)row["IdServicio"];
              
                 UnaItemOT.MiDireccion = new DireccionEntidad();
                UnaItemOT.MiDireccion.IdDireccion = (int)row["IdDireccion"];         
                        UnaItemOT.Precio = (decimal)row["Precio"];
                        UnaItemOT.Fecha = DateTime.Parse(row["Fecha"].ToString());
                  
                        UnaItemOT.Hora = DateTime.Parse(row["Hora"].ToString());



                    ListaItemOT.Add(UnaItemOT);
            }

            return ListaItemOT;

            }
            catch (Exception es)
            {
                throw;
            }
        }


        private List<ItemOrdenDeTrabajoEntidad> MapeadorMuchosItemOrdenDeTrabajoEntidad(DataSet ds)
        {

            List<ItemOrdenDeTrabajoEntidad> ListaItemOT = new List<ItemOrdenDeTrabajoEntidad>();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    ItemOrdenDeTrabajoEntidad UnaItemOT = new ItemOrdenDeTrabajoEntidad();

                    UnaItemOT.IdItemOrdenDeTrabajo = (int)row["IdItemOrdenDeTrabajo"];
                    UnaItemOT._MiOrdenDeTrabajo = new OrdenDeTrabajoEntidad();
                    UnaItemOT._MiOrdenDeTrabajo.IdOrdenDeTrabajo = (int)row["IdOrdenDeTrabajo"];
                    UnaItemOT.MiUsuario = new UsuarioEntidad();
                    UnaItemOT.MiUsuario.IdUsuario = (int)row["IdUsuario"];
                    UnaItemOT.NombreUsuario = row["NombreUsuario"].ToString();
                    UnaItemOT._MiServicio = new ServicioEntidad();
                    
                    UnaItemOT._MiServicio.IdServicio = (int)row["IdServicio"];
               
                    ListaItemOT.Add(UnaItemOT);
                }

                return ListaItemOT;

            }
            catch (Exception es)
            {
                throw;
            }
        }

        public void ActualizarFechayHoraListaItem(int Id, DateTime fecha, DateTime hora)
        {
            SqlParameter[] parameters = new SqlParameter[]
                {
           
                new SqlParameter("@IdItemOrdenDeTrabajo",Id),
                new SqlParameter("@Fecha", fecha),
                new SqlParameter("@Hora", hora)

                };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaDeItemUpDate", parameters);
        }

        public ItemOrdenDeTrabajoEntidad Select(ItemOrdenDeTrabajoEntidad listaItem)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@NumeroDocumento", listaItem.MiUsuario.IdUsuario),
                new SqlParameter("@NombreUsuario", listaItem.NombreUsuario),
                new SqlParameter("@IdServicio", listaItem._MiServicio .IdServicio)
            };

            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ListaItemSelect", parameters))
            {                
                ItemOrdenDeTrabajoEntidad ItemOrdenDeTrabajoEntidad = new ItemOrdenDeTrabajoEntidad();
                ItemOrdenDeTrabajoEntidad = MapeadorItemOrdenDeTrabajoEntidad(ds);
                return ItemOrdenDeTrabajoEntidad;
            }
        }

        private ItemOrdenDeTrabajoEntidad  MapeadorItemOrdenDeTrabajoEntidad(DataSet ds)
        {

            ItemOrdenDeTrabajoEntidad UnaItemOT = new ItemOrdenDeTrabajoEntidad();

            foreach (DataRow row in ds.Tables[0].Rows)
            {

                UnaItemOT.IdItemOrdenDeTrabajo= (int)row["IdItemOrdenDeTrabajo"];
                UnaItemOT._MiOrdenDeTrabajo = new OrdenDeTrabajoEntidad();
                UnaItemOT._MiOrdenDeTrabajo.IdOrdenDeTrabajo= (int)row["IdOrdenDeTrabajo"];
                UnaItemOT.MiUsuario = new UsuarioEntidad();
                UnaItemOT.MiUsuario.IdUsuario= (int)row["IdUsuario"];
                UnaItemOT.NombreUsuario = row["NombreUsuario"].ToString();
                UnaItemOT._MiServicio = new ServicioEntidad();
                UnaItemOT._MiServicio.IdServicio= (int)row["IdServicio"];
                UnaItemOT.MiDireccion = new DireccionEntidad();
                UnaItemOT._MiDireccion.IdDireccion= (int)row["IdDireccion"];
                UnaItemOT.Precio= (decimal )row["Precio"];
                UnaItemOT.Fecha= DateTime.Parse(row["Fecha"].ToString());
                UnaItemOT.Hora= DateTime.Parse(row["Hora"].ToString());




            }

            return UnaItemOT;
        }
        public List<ItemOrdenDeTrabajoEntidad> ResumenDeComprabyIdODT(int idOrdenDeTrabajo) // aca !
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdOrdenDeTrabajo", idOrdenDeTrabajo),

            };
            using (DataSet ds = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ResumenCompraByItem", parameters))
            {

                List<ItemOrdenDeTrabajoEntidad> ItemOrdenDeTrabajoEntidad = new List<ItemOrdenDeTrabajoEntidad>();
                ItemOrdenDeTrabajoEntidad = MapeadorResumenCompraItemservicio(ds);
                return ItemOrdenDeTrabajoEntidad;
            }
        }

        private List<ItemOrdenDeTrabajoEntidad> MapeadorResumenCompraItemservicio(DataSet ds)
        {

            List<ItemOrdenDeTrabajoEntidad> ListaItemOT = new List<ItemOrdenDeTrabajoEntidad>();

            try
            {

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    ItemOrdenDeTrabajoEntidad UnaItemOT = new ItemOrdenDeTrabajoEntidad();

                    UnaItemOT.IdItemOrdenDeTrabajo = (int)row["IdItemOrdenDeTrabajo"];

                    UnaItemOT._MiServicio = new ServicioEntidad();
                    UnaItemOT._MiServicio.Titulo = row["Titulo"].ToString();
                    UnaItemOT._MiServicio.Descripcion = row["Descripcion"].ToString();
                    UnaItemOT._MiServicio.URLimagen = row["URLimagen"].ToString();
                    if (row["Fecha"].ToString() != "")
                        UnaItemOT.Fecha = DateTime.Parse(row["Fecha"].ToString());
                   if  (row["Hora"].ToString()!="")
                    UnaItemOT.Hora = DateTime.Parse(row["Hora"].ToString());
                    UnaItemOT.Precio = (decimal)row["Precio"];

                    ListaItemOT.Add(UnaItemOT);
                }

                return ListaItemOT;
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public void EliminarIdItemOrdenDeTrabajo( int IdItem)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdItemOrdenDeTrabajo", IdItem )
            };

            SqlClientUtility.ExecuteNonQuery(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ItemDelete", parameters);
        }
        public ItemOrdenDeTrabajoEntidad Select(int idItem) /*quede aca!!*/
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IdItemOrdenDeTrabajo", idItem)
            };

            using (DataSet dt = SqlClientUtility.ExecuteDataSet(SqlClientUtility.connectionStringName, CommandType.StoredProcedure, "ItemSelect", parameters))
            {
                ItemOrdenDeTrabajoEntidad itemEntidad = new ItemOrdenDeTrabajoEntidad();

                itemEntidad = MapeadorItem(dt);

                return itemEntidad ;
            }
        }
        private ItemOrdenDeTrabajoEntidad MapeadorItem(DataSet ds)
        {

            ItemOrdenDeTrabajoEntidad UnaItemOT = new ItemOrdenDeTrabajoEntidad();

            foreach (DataRow row in ds.Tables[0].Rows)
            {

                UnaItemOT.IdItemOrdenDeTrabajo = (int)row["IdItemOrdenDeTrabajo"];
                UnaItemOT.MiUsuario = new UsuarioEntidad();
                UnaItemOT.MiUsuario.IdUsuario = (int)row["IdUsuario"];
                UnaItemOT._MiServicio = new ServicioEntidad();
                UnaItemOT._MiServicio.IdServicio = (int)row["IdServicio"];
                

            }

            return UnaItemOT;
        }



    }
}
