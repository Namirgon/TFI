using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace EcommerceHelper.BLL.Managers
{
   public class FamiliaBLL
    {


        private FamiliaDAL unaFamiliaDAL;

        public FamiliaBLL()
        {
            unaFamiliaDAL = new FamiliaDAL();
        }

        public List<FamiliaEntidad> FamiliaSelectAll()
        {
            return unaFamiliaDAL.SelectAll();
        }

        public FamiliaEntidad FamiliaSelectNombreFamiliaByIdUsuario(int idUsuario)
        {
            return unaFamiliaDAL.FamiliaSelectNombreFamiliaByIdUsuario(idUsuario);
        }

    }
}
