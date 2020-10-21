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

        public int RegistrarServicio(ServicioEntidad servicio)
        {
            try
            {
                GestorServicios .Insert(servicio);
                return 0;

            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public int ModificarServicio(ServicioEntidad servicio)
        {
            try
            {
                GestorServicios.Update(servicio );
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public int EliminarServicio(int IdServicio)
        {
            try
            {
                GestorServicios.Delete(IdServicio);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
    }
}
