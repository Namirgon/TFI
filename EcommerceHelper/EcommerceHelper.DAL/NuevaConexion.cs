using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Collections;
using System.Configuration.Assemblies;
using System.Configuration;

namespace EcommerceHelper.DAL
{
    public class NuevaConexion : ConexionSqlServer
    {

        private SqlConnection cnn;
        private DataSet dataset;
        private SqlTransaction tr;
        private SqlCommand cmd;

        public NuevaConexion()
        {
            dataset = new DataSet();
            cmd = new SqlCommand();
            cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["DataContext"].ConnectionString);
        }

        public DataSet Read(string query, Hashtable data)
        {
            ConnectionBind(query);
            AddParameters(data);
            DataSetFill();
            return dataset;
        }

        public bool Write(string query, Hashtable data)
        {
            if (IsConnectionClosed())
                ConnectionOpen();

            try
            {
                TransactionBegin();

                ConnectionBind(query, withTransaction: true);

                AddParameters(data);

                var result = CommandExcecute();

                TransactionCommit();

                return true;
            }
            catch (System.Exception)
            {
                TransactionCancel();

                return false;
            }
            finally
            {
                ConnectionClose();
                //Pasa por aca a pesar de haber un return en el try?
            }
        }

        #region Transaction

        private void TransactionCancel()
        {
            tr.Rollback();
        }

        private void TransactionCommit()
        {
            tr.Commit();
        }

        private void TransactionBegin()
        {
            tr = cnn.BeginTransaction();
        }

        #endregion Transaction

        private int CommandExcecute()
        {
            return cmd.ExecuteNonQuery();
        }

        #region Connection

        private bool IsConnectionClosed()
        {
            return (cnn.State == ConnectionState.Closed);
        }

        private void ConnectionOpen()
        {
            cnn.Open();
        }

        private void ConnectionClose()
        {
            cnn.Close();
        }

        private void ConnectionBind(string query, bool withTransaction = false, CommandType type = CommandType.StoredProcedure)
        {
            cmd.Connection = cnn;
            cmd.CommandText = query;
            cmd.CommandType = type;
            if (withTransaction)
                cmd.Transaction = tr;
        }

        #endregion Connection

        private void DataSetFill()
        {
            var da = new SqlDataAdapter();
            da.Fill(dataset);
        }

        private void AddParameters(System.Collections.Hashtable data)
        {
            if (data != null)
            {
                foreach (string d in data.Keys)
                {
                    cmd.Parameters.AddWithValue(d, data[d]);
                }
            }
        }

        //public DataSet Read(string query, Hashtable data)
        //{
        //    throw new NotImplementedException();
        //}

        //public bool Write(string query, Hashtable data)
        //{
        //    throw new NotImplementedException();
        //}
    }
}

        //SqlConnection cn;
        //SqlCommand cnd;
        //SqlDataReader dr;


        //public NuevaConexion()
        //{
        //    try
        //    {
        //        cn = new SqlConnection("Data Source=DESKTOP-HFMNTR3\\SQLEXPRESS01;Initial Catalog=HelperDataBase;Integrated Security=True");
        //        cn.Open();
        //        Console.WriteLine("Conexion a BDHelper Exitosa");


        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine("ERROR , No se logro conectar a BDHelper " + ex.ToString());

        //    }

        //}


