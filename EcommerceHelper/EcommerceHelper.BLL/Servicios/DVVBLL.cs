using EcommerceHelper.DAL;
using EcommerceHelper.DAL.Servicios;
using EcommerceHelper.Entidades;
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
     

            List<UsuarioEntidad> variable = DVHTotal.SelectAllUsuarios();

            float SumaDVH = 0;

            foreach (UsuarioEntidad item in variable)
            {
                SumaDVH += item.DVH;
            }

           
            varDVV.tabla = Tabla;
            varDVV.dvv = (SumaDVH).ToString();
        

            

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
