using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Text;

namespace Checkpoint2
{
    class Database
    {
        private static Database _databaseConnexion;
        private static SqlConnection _sqlConnexion;

        private Database()
        {
            string connectionString = "Data Source=LOCALHOST\\SQLEXPRESS;Initial Catalog=Checkpoint2;Integrated Security=True";
           
            SqlConnection conn = new SqlConnection(connectionString);

            
            _sqlConnexion = conn;

            try
            {
               
                conn.Open();
               
            }
            catch (Exception e)
            {
                
            }

        }

        ~Database()
        {
            GetConnexion.Close();
            GetConnexion.Dispose();
        }

        public static SqlConnection GetConnexion
        {
            get
            {
                if (_databaseConnexion == null)
                {
                    _databaseConnexion = new Database();
                }
                return _sqlConnexion;
            }
        }
    }
}
