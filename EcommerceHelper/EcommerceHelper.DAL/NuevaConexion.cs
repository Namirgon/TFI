using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;





namespace EcommerceHelper.DAL
{
    public class NuevaConexion
    {

        SqlConnection cn;
        SqlCommand cnd;
        SqlDataReader dr;


        public NuevaConexion()
        {
            try
            {
                cn = new SqlConnection("Data Source=DESKTOP-HFMNTR3\\SQLEXPRESS01;Initial Catalog=HelperDataBase;Integrated Security=True");
                cn.Open();
                Console.WriteLine("Conexion a BDHelper Exitosa");


            }
            catch (Exception ex)
            {
                Console.WriteLine("ERROR , No se logro conectar a BDHelper " + ex.ToString());

            }

        }


    }
}
