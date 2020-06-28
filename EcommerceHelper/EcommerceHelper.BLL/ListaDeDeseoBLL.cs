using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.BLL
{
  public  class ListaDeDeseoBLL
    {
        private ListaDeseoDAL unaListaDeseosDAL = new ListaDeseoDAL();
        public int ListaDeseosInsert(ListaDeDeseoEntidad laListaDeseo)
        {
            try
            {
                unaListaDeseosDAL.Insert(laListaDeseo);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //if (unaListaDeseosDAL.Select(laListaDeseo).IdServicio == 0)
            //{
          
            //    return 1; //Así se si se inserto algo o no
            //}
            //return 0;
        }


    }
}
