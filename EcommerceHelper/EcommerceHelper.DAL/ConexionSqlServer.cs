using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

namespace EcommerceHelper.DAL
{
    interface ConexionSqlServer

    {

        DataSet Read(string query, Hashtable data);
        bool Write(string query, Hashtable data);

        //    string cadena = "DATA Source=DESKTOP-HFMNTR3\\SQLEXPRESS01; Initial catalog=HelperDataBase; Integrated Security= True";
        //    public SqlConnection ConectarBDHelper = new SqlConnection();


        //    public ConexionSqlServer()
        //    {
        //        ConectarBDHelper.ConnectionString = cadena;

        //    }

        //    public void AbrirBDHeper()
        //    {
        //        try
        //        {

        //            ConectarBDHelper.Open();
        //            Console.WriteLine("Conexion a BDHelper Exitosa");
        //        }
        //        catch  (Exception ex)
        //        {
        //            Console.WriteLine("ERROR , No se logro conectar a BDHelper "+ ex.Message);

        //        }

        //    }

        //    public void CerrarBDHeler()
        //    {

        //        ConectarBDHelper.Close();

        //    }

    }
}
