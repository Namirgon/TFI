using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.BLL
{
  public  class TarjetaBLL
    {

        TarjetaDAL _dalTarjeta = new TarjetaDAL();
        public int InsertTarjeta(TarjetaEntidad unaTarjeta)
        {
            try
            {
                _dalTarjeta.Insert(unaTarjeta);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public List<TarjetaEntidad> ListarTarjetas(int IdUsuario)
        {
            return _dalTarjeta.ListaTarjetasDAL (IdUsuario);

        }


        public TarjetaEntidad Find(int id)
        {
            return _dalTarjeta. Select(id);
        }

        public int UpdateTarjeta(TarjetaEntidad unaTarjeta)
        {
            try
            {
                _dalTarjeta.Update(unaTarjeta);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public int EliminarTarjeta(int IdTarjeta)
        {
            try
            {
                _dalTarjeta.Delete(IdTarjeta);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

    }
}
