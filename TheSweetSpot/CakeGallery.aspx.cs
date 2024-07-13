using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace TheSweetSpot
{
    public partial class CakeGallery : System.Web.UI.Page
    {
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\TheSweetSpotDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CakeDisplayer();
            }
        }

        private void CakeDisplayer()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT CakeID, CakeName, CakeDescription, CakePrice, CakeImage FROM Cakes";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Add a new column for base64 image string
                    dt.Columns.Add("CakeImageBase64", typeof(string));

                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["CakeImage"] != DBNull.Value)
                        {
                            byte[] imageBytes = (byte[])row["CakeImage"];
                            string base64String = Convert.ToBase64String(imageBytes, 0, imageBytes.Length);
                            row["CakeImageBase64"] = "data:image/png;base64," + base64String;
                        }
                    }

                    CakeRepeater.DataSource = dt;
                    CakeRepeater.DataBind();
                }
            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string cakeId = btn.CommandArgument;

            string query = $"SELECT CakeID, CakeName, CakeDescription, CakePrice, CakeImage FROM Cakes WHERE CakeID = @CakeID";
           

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CakeID", cakeId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string CakeName = reader["CakeName"].ToString();
                            string cakeDescription = reader["cakeDescription"].ToString();
                            string cakePrice = reader["CakePrice"].ToString();

                            Response.Redirect($"OrderPage.aspx?CakeID={cakeId}&CakeName={CakeName}&CakeDescription={cakeDescription}&CakeDescription={cakePrice}");
                        }
                    }
                }
            }
        }
    }
}
