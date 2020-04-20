using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace EcommerceHelper.DAL
{
    public class ConexionSqlServer
    {
        string cadena = "DATA Source=DESKTOP-HFMNTR3\\SQLEXPRESS01; Initial catalog=HelperDataBase; Integrated Security= True";
        public SqlConnection ConectarBDHelper = new SqlConnection();


        public ConexionSqlServer()
        {
            ConectarBDHelper.ConnectionString = cadena;

        }

        public void AbrirBDHeper()
        {
            try
            {

                ConectarBDHelper.Open();
                Console.WriteLine("Conexion a BDHelper Exitosa");
            }
            catch  (Exception ex)
            {
                Console.WriteLine("ERROR , No se logro conectar a BDHelper "+ ex.Message);

            }

        }

        public void CerrarBDHeler()
        {

            ConectarBDHelper.Close();

        }

    }
}
