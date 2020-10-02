using EcommerceHelper.DAL;
using EcommerceHelper.DAL.Servicios;
using EcommerceHelper.Entidades.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceHelper.BLL.Servicios
{
    public class DVVBLL
    {

        DVVDAL dVVDal = new DVVDAL();
        //public DVV GenerarDVV(string DVV, string tabla)
        //{
        //    DVV dVV = new DVV();


        //    EncriptarSHA256 encriptarSHA256 = new EncriptarSHA256(DVV);
        //    dVV.dvv = encriptarSHA256.Hashear();
        //    dVV.tabla = tabla;
        //    return dVV;

        //}

        public DVV GenerarDVV( string DVV, string Tabla)
        {
            UsuarioDAL DVHTotal = new UsuarioDAL();
            DVV varDVV = new DVV();


            string variable = (DVHTotal.SelectAllUsuariosDVH()).ToString();

            varDVV.tabla = Tabla;
            varDVV.dvv = variable;


            

            return varDVV;
        }

        public DVV ObtenerDVV(String tabla)
        {
           
            return dVVDal.SelectByTabla(tabla);

        }

        public void InsertarDVV(string DVV, string tabla)
        {
           

            dVVDal.Insert(GenerarDVV(DVV, tabla));

        }

    }
}
