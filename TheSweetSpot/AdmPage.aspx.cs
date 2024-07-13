using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSweetSpot
{
    public partial class AdmPage : System.Web.UI.Page
    {
        //Connection string 
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\TheSweetSpotDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCakes();
                //LoadOrders();
                //LoadUsers();
            }
        }

        protected void btnAddCake_Click(object sender, EventArgs e)
        {
            string cakeName = txtCakeName.Text;
            string cakeDescription = txtCakeDescription.Text;
            decimal cakePrice;

            if (!decimal.TryParse(txtCakePrice.Text, out cakePrice))
            {
                errorMessage.Text = "Invalid price format. Please enter a valid decimal number.";
                return;
            }

            byte[] cakeImage = null;

            if (fileCakeImage.HasFile)
            {
                try
                {
                    ImageManipulationClass imgManip = new ImageManipulationClass();
                    string imagePath = imgManip.SaveUploadedFile(fileCakeImage.PostedFile);
                    string serverPath = Server.MapPath(imagePath);

                    // Convert the uploaded image to byte array
                    cakeImage = ImageManipulationClass.ConvertImageToByteArray(serverPath);
                }
                catch (Exception ex)
                {
                    errorMessage.Text = "Error saving image: " + ex.Message;
                    return;
                }
            }

          
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Cakes (CakeName, CakeDescription, CakePrice, CakeImage) VALUES (@CakeName, @CakeDescription, @CakePrice, @CakeImage)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CakeName", cakeName);
                    cmd.Parameters.AddWithValue("@CakeDescription", cakeDescription);
                    cmd.Parameters.AddWithValue("@CakePrice", cakePrice);
                    cmd.Parameters.AddWithValue("@CakeImage", cakeImage ?? (object)DBNull.Value); // Handle the case where no image is uploaded

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        successMessage.Text = "Cake added successfully!";
                        LoadCakes(); // Refresh the cake list
                    }
                    catch (Exception ex)
                    {
                        errorMessage.Text = "Error adding cake: " + ex.Message;
                    }
                }
            }
        }

        /// <summary>
        /// Button that will allow user t remove a cake
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRemoveCake_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int cakeID = int.Parse(btn.CommandArgument);
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Cakes WHERE CakeID = @CakeID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CakeID", cakeID);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        successMessage.Text = "Cake removed successfully!";
                        // Refresh the cake list
                        LoadCakes(); 
                    }
                    catch (Exception ex)
                    {
                        errorMessage.Text = "Error removing cake: " + ex.Message;
                    }
                }
            }
        }

        protected void btnRemoveUser_Click(object sender, EventArgs e)
        {
            //Button btn = (Button)sender;
            //int userID = int.Parse(btn.CommandArgument);

            //string connStr = ConfigurationManager.ConnectionStrings["TheSweetSpotDB"].ConnectionString;
            //using (SqlConnection conn = new SqlConnection(connStr))
            //{
            //    string query = "DELETE FROM Users WHERE UserID = @UserID";
            //    using (SqlCommand cmd = new SqlCommand(query, conn))
            //    {
            //        cmd.Parameters.AddWithValue("@UserID", userID);

            //        try
            //        {
            //            conn.Open();
            //            cmd.ExecuteNonQuery();
            //            successMessage.Text = "User removed successfully!";
            //            LoadUsers(); // Refresh the user list
            //        }
            //        catch (Exception ex)
            //        {
            //            errorMessage.Text = "Error removing user: " + ex.Message;
            //        }
            //    }
            //}
        }

        private void LoadCakes()
        {
           
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT CakeID, CakeName, CakeDescription, CakePrice FROM Cakes";
                using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvCakes.DataSource = dt;
                    gvCakes.DataBind();
                }
            }
        }

        //private void LoadOrders()
        //{
        //    string connStr = ConfigurationManager.ConnectionStrings["TheSweetSpotDB"].ConnectionString;
        //    using (SqlConnection conn = new SqlConnection(connStr))
        //    {
        //        string query = "SELECT OrderID, UserID, OrderDate, TotalAmount FROM Orders";
        //        using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
        //        {
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            gvOrders.DataSource = dt;
        //            gvOrders.DataBind();
        //        }
        //    }
        //}

        //private void LoadUsers()
        //{
        //    string connStr = ConfigurationManager.ConnectionStrings["TheSweetSpotDB"].ConnectionString;
        //    using (SqlConnection conn = new SqlConnection(connStr))
        //    {
        //        string query = "SELECT UserID, Username, Email FROM Users";
        //        using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
        //        {
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            gvUsers.DataSource = dt;
        //            gvUsers.DataBind();
        //        }
        //    }
        //}
    }
}
