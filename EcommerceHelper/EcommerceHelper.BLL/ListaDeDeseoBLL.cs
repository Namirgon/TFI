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
        private ListaDeseoDAL GestorDeseo = new ListaDeseoDAL();
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

        }

        

        public List<ListaDeDeseoEntidad> ListaDeseosSelectAllByNumeroDocumento(int NumeroDocumento)
        {

            return unaListaDeseosDAL.SelectAllByNumeroDocumento( NumeroDocumento);

        }


        public int ListaDeDeseosUpdate(ListaDeDeseoEntidad IdDeseo)
        {

            try
            {
                GestorDeseo.ActualizarEstadoListaDeseo(IdDeseo);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
    }
}
