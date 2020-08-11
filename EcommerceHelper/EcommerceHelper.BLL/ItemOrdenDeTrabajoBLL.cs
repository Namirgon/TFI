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


        public List<ItemOrdenDeTrabajoEntidad> ListaItemSelectAllByNumeroIdUsuario(int NumeroIdUsuario)
        {

            return unItemDAL.SelectAllByNumeroIdUsuario(NumeroIdUsuario);
        }


        public List<ItemOrdenDeTrabajoEntidad> ListaItemSelectAllByIdODT(int IdODT)
        {
            return unItemDAL.SelectIdItemOrdenDeTrabajo(IdODT);
            
        }

        public int ListaDeItemUpdate(ItemOrdenDeTrabajoEntidad IdItemOrdenDeTrabajo)
        {

            try
            {
                GestorItem.ActualizarFechayHoraListaItem(IdItemOrdenDeTrabajo);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public List< ItemOrdenDeTrabajoEntidad> ListaIdItems(int IdODT)
        {

            return unItemDAL.SelectIdItemOrdenDeTrabajo(IdODT);
        }

        public  void EliminarItem( int IdItem)
        {

            unItemDAL.EliminarIdItemOrdenDeTrabajo(IdItem);
        }

    }

}

