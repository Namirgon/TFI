using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.BLL
{
   public  class TipoDomicilioBLL
    {


        private TipoDomicilioDAL GestorTipoDomicilio = new TipoDomicilioDAL();

        public List<TipoDireccionEntidad> SelectALLTipoDomicilio()
        {
            List<TipoDireccionEntidad> unTipoDomicilio = new List<TipoDireccionEntidad>();
            unTipoDomicilio = GestorTipoDomicilio.SelectAllTipoDomicilio();
            return unTipoDomicilio;
        }

    }
}
