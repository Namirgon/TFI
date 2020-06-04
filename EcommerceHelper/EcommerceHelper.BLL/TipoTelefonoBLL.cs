using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.BLL
{
    public class TipoTelefonoBLL
    {


        private TipoTelefonoDAL GetorTipoTelefono = new TipoTelefonoDAL();

        public List<TipoTelefonoEntidad> SelectALLTipoTelefono()
        {
            List<TipoTelefonoEntidad> unTelefono = new List<TipoTelefonoEntidad>();
            unTelefono  = GetorTipoTelefono.SelectAll();
            return unTelefono;
        }
    }
}
