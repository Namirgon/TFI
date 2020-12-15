using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.BLL
{
  public   class ItemOrdenDeTrabajoBLL
    {

        private ItemOrdenDeTrabajoDAL unItemDAL = new ItemOrdenDeTrabajoDAL();
        private ItemOrdenDeTrabajoDAL GestorItem = new ItemOrdenDeTrabajoDAL();
        public int ItemOrdenDeTrabajoInsert(ItemOrdenDeTrabajoEntidad laListaDeseo)
        {
            try
            {
                unItemDAL.Insert(laListaDeseo);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public int InsertDireccion(int idDir, int idItem)
        {

            try
            {
                unItemDAL.InsertIdDireccion(idDir, idItem);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public List<ItemOrdenDeTrabajoEntidad> ListaItemSelectAllByNumeroIdUsuario(int NumeroIdUsuario)
        {

            return unItemDAL.SelectAllByNumeroIdUsuario(NumeroIdUsuario);
        }


        public List<ItemOrdenDeTrabajoEntidad> ListaItemSelectAllByIdODT(int IdODT)
        {
            return unItemDAL.SelectIdItemOrdenDeTrabajo(IdODT);
            
        }

        public List<ItemOrdenDeTrabajoEntidad> ListaItemSelectAllByIdODT2(int IdODT)
        {
            return unItemDAL.SelectIdItem(IdODT);

        }
        public List<ItemOrdenDeTrabajoEntidad> ListaItemSelectAllByIdODT3(int IdODT)
        {
            return unItemDAL.SelectIdItemOrdenDeTrabajo2(IdODT);

        }
        public List<ItemOrdenDeTrabajoEntidad> ResumenDeCompra(int IdODT)
        {
            return unItemDAL.ResumenDeComprabyIdODT(IdODT);

        }
        public List<ItemOrdenDeTrabajoEntidad> ResumenDeCompraByIdLocalidad(int IdODT)
        {
            return unItemDAL.ResumenDeCompraIdODTByIdLocalidad(IdODT);

        }

        public int UsuarioServicioInsert(int Idusuario, int IdOdt) // aca 
        {
            try
            {
                unItemDAL.UsuarioServicioInsert(Idusuario, IdOdt);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public int ListaDeItemUpdate(int Id, DateTime fecha, DateTime hora, int Cantidad)
        {

            try
            {
                GestorItem.ActualizarFechayHoraListaItem(Id, fecha,hora, Cantidad);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public List< ItemOrdenDeTrabajoEntidad> ListaIdItems(int IdIODT)
        {

            return unItemDAL.SelectIdItemOrdenDeTrabajo(IdIODT);
        }

        public  void EliminarItem( int IdItem)
        {

            unItemDAL.EliminarIdItemOrdenDeTrabajo(IdItem);
        }
        public ItemOrdenDeTrabajoEntidad Find(int idItem)
        {
            return unItemDAL.Select(idItem);
        }

    }

}

