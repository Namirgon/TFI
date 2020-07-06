using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EcommerceHelper.DAL;

namespace EcommerceHelper.BLL
{
   public class ServicioBLL
    {

        private ServicioDAL GestorServicios = new ServicioDAL();

        
        public void Serviciobll()
        {
            GestorServicios = new ServicioDAL();
           

        }

        public List<ServicioEntidad> SelectALLServicios()
        {
            List<ServicioEntidad> unServicio = new List<ServicioEntidad>();
            unServicio = GestorServicios.SelectAll();
            return unServicio;
        }

        public Entidades.ServicioEntidad FindServicio(int id)
        {
          
            ServicioEntidad nuevo = new ServicioEntidad();
            var lista = new List<ServicioEntidad>();
            var p = GestorServicios.Select(id);
            lista.Add(p);
            nuevo = p;
         
            return nuevo;
        }

        //public List<Entidades.ServicioEntidad> FindAllByTituloServicio(string TituloServicio)
        //{

        //    //_coreMoneda = new MonedaCore();
        //    //var cotizacion = _coreMoneda.Select(idMoneda);
        //    var retornaServicios = new List<ServicioEntidad>();
        //    var lista = _ServicioDal.
        //    //if (cotizacion.Cotizacion > 1)
        //    //{
        //    //    foreach (ServicioEntidad p in lista)
        //    //    {
        //    //        ServicioEntidad nuevo = new ServicioEntidad();
        //    //        nuevo = p;
        //    //        nuevo.PrecioUnitario = System.Decimal.Round(p.PrecioUnitario / cotizacion.Cotizacion, 2);
        //    //        retornaServicios.Add(nuevo);

        //    //    }
        //    //}
        //    //else
        //        //foreach (ServicioEntidad p in lista)
        //        //{
        //        //    ServicioEntidad nuevo = new ServicioEntidad();
        //        //    nuevo = p;
        //        //    nuevo.Precio = System.Decimal.Round(p.PrecioUnitario * cotizacion.Cotizacion, 2);
        //        //    retornaServicios.Add(nuevo);

        //        //}

        //    return retornaServicios;
        //}


    }
}
