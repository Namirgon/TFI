using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.DAL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;

namespace EcommerceHelper.BLL
{
  public   class IdiomaBLL : IObservable
    {

        private IdiomaDAL _dal  ;
        private MultiIdiomaDAL _dalControl;

        public List< MultiIdiomaEntidad> TraduccionesSgl;

        //SINGLETON
        private static IdiomaBLL _BLLServicioIdiomaUnico;

        public IdiomaBLL()
        {
            _dal = new IdiomaDAL();
            _dalControl = new MultiIdiomaDAL();
        }


        public static IdiomaBLL GetBLLServicioIdiomaUnico()
        {
            if (_BLLServicioIdiomaUnico == null)
            {
                _BLLServicioIdiomaUnico = new IdiomaBLL();
                _BLLServicioIdiomaUnico.TraduccionesSgl = new List < MultiIdiomaEntidad>();
            }
            return _BLLServicioIdiomaUnico;
        }

        //END SINGLETON

        public void Traducir( int elIdioma)
        {
            try
            {

                //ir a la BD y traer los textos y ponerlos en una variable de sesion 
               
                ActualizarEstadoObservadores();
            }
            catch (Exception es)
            {
                throw;
            }
        }

        public List< MultiIdiomaEntidad> DevuelverTodosLosTextos(int id)
        {


            return _dalControl.SelectAll(id);
        }


        


        public IdiomaEntidad Find(int id)
        {
            return _dal.Select(id);
        }

        public MultiIdiomaEntidad ControlFind(int id)
        {
            return _dal.SelectControl(id);
        }
        public List<IdiomaEntidad> FindAll()
        {
            return _dal.SelectAll();
        }

        public List<MultiIdiomaEntidad> MultidiomaSelectAllControles()
        {
            return _dal.MultidiomaSelectAllControles();
        }

        public MultiIdiomaEntidad FindControl(int lenguajeID, string control)
        {
            return _dalControl.Select(control, lenguajeID);
        }

        public List<MultiIdiomaEntidad> FindControlAll(int id)
        {
            return _dalControl.SelectAll(id);
        }

     
        public List<MultiIdiomaEntidad> FindControlsByLenguaje(int id)
        {
            return FindControlAll(id).Where(x => x.MiIdioma.IdIdioma  == id).ToList();
        }




        public int RegistrarIdioma(IdiomaEntidad idioma)
        {
            try
            {
             _dal.Insert(idioma);
                return 0;

            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public int RegistrarControlTraduccion(MultiIdiomaEntidad idioma)
        {
            try
            {
                _dal.RegistrarControlTraduccion(idioma);
                return 0;

            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public int ModificarIdioma(IdiomaEntidad idioma)
        {
            try
            {
                _dal.Update(idioma);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public int ModificarControlMultiIdioma(MultiIdiomaEntidad idioma)
        {
            try
            {
                _dal.MultiIdiomaControlUpdate(idioma);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public int EliminarIdioma(int  idioma)
        {
            try
            {
                _dal.Delete(idioma);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public int EliminarControlMultiIdioma(int idioma)
        {
            try
            {
                _dal.DeleteControlMultiIdioma(idioma);
                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

    }
}
    