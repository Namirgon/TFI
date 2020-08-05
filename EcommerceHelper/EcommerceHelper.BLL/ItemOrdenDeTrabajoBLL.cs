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

        private ItemOrdenDeTrabajoDAL unNuevoItemDAL = new ItemOrdenDeTrabajoDAL();
        private ItemOrdenDeTrabajoDAL GestorItem = new ItemOrdenDeTrabajoDAL();
        public int ItemOrdenDeTrabajoInsert(ItemOrdenDeTrabajoEntidad laListaDeseo)
        {
            try
            {
                unNuevoItemDAL.Insert(laListaDeseo);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


        public List<ItemOrdenDeTrabajoEntidad> ListaItemSelectAllByNumeroIdUsuario(int NumeroIdUsuario)
        {

            return unNuevoItemDAL.SelectAllByNumeroIdUsuario(NumeroIdUsuario);
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
    }

    }

