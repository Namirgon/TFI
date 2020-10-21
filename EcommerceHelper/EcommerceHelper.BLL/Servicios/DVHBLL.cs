using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.BLL.Servicios
{
  public   class DVHBLL
    {
        UsuarioDAL DVHTotal = new UsuarioDAL();
        public  static float ConsultarDVH()
        {
            UsuarioDAL DVHTotal = new UsuarioDAL();
            List<UsuarioEntidad> variable = DVHTotal.SelectAllUsuarios();

            float SumaDVH = 0;

            foreach (UsuarioEntidad item in variable)
            {
                SumaDVH += item.DVH;
            }

            return SumaDVH;

        }

    }
}
