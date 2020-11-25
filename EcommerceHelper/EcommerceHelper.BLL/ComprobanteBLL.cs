using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.BLL
{
   public  class ComprobanteBLL
    {

        ComprobanteDAL _DalComprobante = new ComprobanteDAL();
        DetalleComprobanteDAL _DalDetalleComprobante = new DetalleComprobanteDAL();
        public int RegistrarComprobante(ComprobanteEntidad unComprobante)
        {
            try
            {
                _DalComprobante.Insert(unComprobante);
                return 0;

            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

        public void RegistrarDetalle(DetalleComprobanteEntidad unDetalleComprobante)
        {
            _DalDetalleComprobante.Insert(unDetalleComprobante);
        }

        public List<ComprobanteEntidad> FindAllFacturas()
        {
            return _DalComprobante.SelectAllFacturas();
        }
        public List<ComprobanteEntidad> FindAllFacturasSinAsignar()
        {
            return _DalComprobante.FindAllFacturasSinAsignar();
        }

        public ComprobanteEntidad FindComprobante(int id)
        {
            return _DalComprobante.Select(id);
        }
        public List<ComprobanteEntidad> FindAllNC()
        {
            return _DalComprobante.SelectAllNC();
        }

        public List<ComprobanteEntidad> FindAllND()
        {
            return _DalComprobante.SelectAllND();
        }

    }
}
