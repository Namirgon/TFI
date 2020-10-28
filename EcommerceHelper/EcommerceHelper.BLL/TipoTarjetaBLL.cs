using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.BLL
{
   public  class TipoTarjetaBLL
    {
        TipoTarjetaDAL _dal = new TipoTarjetaDAL();
        public List<TipoTarjetaEntidad> FindAll()
        {
            return _dal.SelectAll();
        }


    }
}
