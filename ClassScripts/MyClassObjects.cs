using System.Data;
using System.Data.SqlClient;

namespace logserv.admin
{
    internal class MyClassObjects
    {
        //public static readonly string ConnectionString = "Data Source=localhost;Initial Catalog=logoserv; Integrated Security=True";

        string ConnectionString = "Data Source=SQL5109.site4now.net;Initial Catalog=db_a94b13_logserv;User Id=db_a94b13_logserv_admin;Password=logserv123";

        SqlConnection con;

        public MyClassObjects()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public void OpenConnection()
        {
            con = new SqlConnection(ConnectionString);
            con.Open();
        }

        //public SqlConnection OpenConnection2()
        //    {
        //    con = new SqlConnection(ConnectionString);
        //    con.Open();
        //    return OpenConnection2();
        //    }

        private SqlConnection CreateConnection()
        {
            //string _connectionStringServer = ConnectObj.ConnectionSERVER();
            return new SqlConnection(ConnectionString);
        }

        public void CloseConnection()
        {
            con.Close();
        }


        public void ExecuteQueries(string Query_)
        {
            SqlCommand cmd = new SqlCommand(Query_, con);
            cmd.ExecuteNonQuery();
        }

        public void ExecuteParameter(SqlCommand paracmd)
        {
            paracmd.CommandType = CommandType.Text;
            paracmd.Connection = con;
            paracmd.ExecuteNonQuery();
            return;
        }

        //public SqlCommand ExecuteParameter(SqlCommand paracmd)
        //    {

        //    paracmd.CommandType = CommandType.Text;
        //    paracmd.Connection = con;
        //    paracmd.ExecuteNonQuery();

        //    return ExecuteNonQuery;
        //    }


        public SqlDataReader DataReader(string Query_)
        {
            SqlCommand cmd = new SqlCommand(Query_, con);
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }


        public object ShowDataInGridView(string Query_)
        {
            SqlDataAdapter dr = new SqlDataAdapter(Query_, ConnectionString);
            DataSet ds = new DataSet();
            dr.Fill(ds);
            object dataum = ds.Tables[0];
            return dataum;
        }
    }
}