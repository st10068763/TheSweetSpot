using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace TheSweetSpot
{
    public partial class UserAccountPage : System.Web.UI.Page
    {
        // Connection string
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\TheSweetSpotDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verifies if the user is logged in
                if (Session["UserID"] == null)
                {
                    Response.Write("<script>alert('You must be logged in to access this page.'); window.location = 'LoginPage.aspx';</script>");
                }
                else
                {
                    LoadLoggedInUserData();
                }
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            ProfilePictureUpdate();
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            // Implement password change logic here
        }

        protected void btnDeactivateAccount_Click(object sender, EventArgs e)
        {
            
        }
        
        // Method to delete the account of the current logged in user

        /// <summary>
        /// Method to update profile picture in the user table
        /// </summary>
        protected void ProfilePictureUpdate()
        {
            byte[] profilePicture = null;

            if (fileProfilePicture.HasFile)
            {
                try
                {
                    ImageManipulationClass imgManip = new ImageManipulationClass();
                    string imagePath = imgManip.SaveUploadedFile(fileProfilePicture.PostedFile);
                    string serverPath = Server.MapPath(imagePath);

                    // Convert the uploaded image to byte array
                    profilePicture = ImageManipulationClass.ConvertImageToByteArray(serverPath);
                }
                catch (Exception ex)
                {
                    PictureErrorMessage.Text = "Error saving image: " + ex.Message;
                    return;
                }
            }

            string userID = Session["UserID"].ToString();
            string query = "UPDATE Users SET ProfilePicture = @ProfilePicture WHERE UserID = @UserID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@ProfilePicture", profilePicture ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@UserID", userID);

                    try
                    {
                        connection.Open();
                        cmd.ExecuteNonQuery();
                        SuccessMessage.Text = "Profile picture updated successfully.";
                        LoadLoggedInUserData(); // Refresh the page
                    }
                    catch (Exception ex)
                    {
                        PictureErrorMessage.Text = "Error updating profile picture: " + ex.Message;
                    }
                }
            }
        }

        /// <summary>
        /// Method to load the data of the currently logged-in user
        /// </summary>
        private void LoadLoggedInUserData()
        {
            string userID = Session["UserID"].ToString();
            string query = "SELECT Username, Email, ProfilePicture FROM Users WHERE UserID = @UserID";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);

                    try
                    {
                        connection.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        SqlDataReader reader = cmd.ExecuteReader();

                        adapter.Fill(dt);
                        dt.Columns.Add("ProfilePictureBase64",  typeof(string));

                        foreach (DataRow row in dt.Rows)
                        {
                           
                                byte[] profilePictureBytes = (byte[])reader["ProfilePicture"];
                                string base64string = Convert.ToBase64String(profilePictureBytes, 0, profilePictureBytes.Length);
                                row["ProfilePictureBase64"] = "data:image/png;base64,";                            
                        }                      
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error loading user data: " + ex.Message + "');</script>");
                    }
                }
            }
        }
    }
}
