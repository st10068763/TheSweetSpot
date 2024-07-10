using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSweetSpot
{
    public partial class LoginPage : System.Web.UI.Page
    {
        //Connection string 
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\TheSweetSpotDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Method to verify user and grant access 
        private bool LoginUser(string email, string password)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Selecting user with matching email
                    string query = "SELECT UserID, PasswordHash FROM Users WHERE Email = @Email";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        // Executing query
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string storedHash = reader["PasswordHash"].ToString();

                                // Verifying hashed password
                                if (DataEncryptionClass.VerifyPassword(password, storedHash))
                                {
                                    // Successful login
                                    // Store user information in session or cookie as needed
                                    Session["UserID"] = reader["UserID"].ToString();
                                    return true;
                                }
                            }
                        }
                    }
                }

                // Invalid email or password
                lblMessage.Text = "Invalid email or password!";
                return false;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
                return false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Declaring the variables
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // Validating the email and password
            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                if (LoginUser(email, password))
                {
                    // Redirect to user profile page after successful login
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password!";
                    lblMessage.CssClass = "text-danger";
                }
            }
            else
            {
                lblMessage.Text = "Email and password are required!";
                lblMessage.CssClass = "text-danger";
            }

        }
    }
}