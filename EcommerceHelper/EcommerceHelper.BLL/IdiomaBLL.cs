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
  public   class IdiomaBLL: IObservable
    {

        private IdiomaDAL _dal  ;
        private MultiIdiomaDAL _dalControl;
        private List<object> ListaResultado = new List<object>();


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
                _BLLServicioIdiomaUnico = new IdiomaBLL();
            return _BLLServicioIdiomaUnico;
        }

        //END SINGLETON

        public void Traducir( int elIdioma)
        {
            try
            {

                //ir a la BD y traer los textos y ponerlos en una variable de sesion 
               // FindControlsByLenguaje(elIdioma);
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



        public void Idioma(System.Web.UI.Page unformulario, int idioma)
        {

            var listadetraducciones = FindControlsByLenguaje(idioma);

            ObtenerTodo(unformulario);


            try
            {

                foreach (Control Control in ListaResultado)
                {

                    foreach (var traduccion_loopVariable in listadetraducciones)
                    {

                        var traduccion = traduccion_loopVariable;

                        if (Equals(Control.ID, traduccion.Texto))
                        {

                            //ESTO SON LOS <a>
                            if ((Control) is System.Web.UI.HtmlControls.HtmlAnchor)
                            {

                                var mapeo = (System.Web.UI.HtmlControls.HtmlAnchor)Control;
                                mapeo.InnerText = traduccion.NombreDelControl;
                            }
                            //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlInputControl)
                            {

                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputText)Control;
                                mapeo.Value = traduccion.NombreDelControl;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlButton)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlButton)Control;
                                mapeo.InnerText = traduccion.NombreDelControl;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlInputButton)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputButton)Control;
                                mapeo.Value = traduccion.NombreDelControl;
                            }
                            else if ((Control) is System.Web.UI.HtmlControls.HtmlInputText)
                            {
                                var mapeo = (System.Web.UI.HtmlControls.HtmlInputText)Control;
                                mapeo.Value = traduccion.NombreDelControl;
                            }

                        }


                    }



                }




            }
            catch
            {
            }



        }

        public void ObtenerTodo(System.Web.UI.Page ElFormulario)
        {
            ListaResultado.Clear();

            ListaResultado.Add(ElFormulario);

            RecorrerContenedor(ElFormulario);


        }


        private void RecorrerContenedor(Control pObjetoContenedor)
        {
            foreach (Control Controlobj in pObjetoContenedor.Controls)
            {
                ListaResultado.Add(Controlobj);

                if ((Controlobj) is System.Web.UI.WebControls.DropDownList)
                {
                    RecorrerDropDown(((System.Web.UI.WebControls.DropDownList)Controlobj));
                }


                if (Controlobj.Controls.Count > 0)
                {
                    RecorrerContenedor(Controlobj);
                }

                ListaResultado.Add(Controlobj);
            }
        }

        private void RecorrerDropDown(System.Web.UI.WebControls.DropDownList pMenuStrip)
        {
            ListaResultado.Add(pMenuStrip);
            foreach (System.Web.UI.WebControls.ListItem item in pMenuStrip.Items)
            {
                ListaResultado.Add(item);
            }


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
    