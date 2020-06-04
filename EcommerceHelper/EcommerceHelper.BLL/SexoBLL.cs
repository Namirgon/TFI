using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.DAL;

namespace EcommerceHelper.BLL
{
    public class SexoBLL
    {

        private SexoDAL GestorSexo = new SexoDAL();

        public List<SexoEntidad> SelectALLSexos()
        {
            List<SexoEntidad> unSexo = new List<SexoEntidad>();
            unSexo = GestorSexo.SelectAll();
            return unSexo;
        }

       }
}
