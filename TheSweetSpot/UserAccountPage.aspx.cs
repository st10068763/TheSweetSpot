using System;
using System.IO;
using System.Web.UI.WebControls;

namespace TheSweetSpot
{
    public partial class UserAccountPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load user information and profile picture
                LoadUserData();
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
       
            SaveUserData();
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnDeactivateAccount_Click(object sender, EventArgs e)
        {
           
        }

        protected void fileProfilePicture_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            try
            {
                // Save uploaded file to server
                if (fileProfilePicture.HasFile)
                {
                    string filename = Path.GetFileName(fileProfilePicture.FileName);
                    fileProfilePicture.SaveAs(Server.MapPath("~/Uploads/") + filename);

                    // Display uploaded image
                    imgProfilepicture.ImageUrl = "~/Uploads/" + filename;
                }
            }
            catch (Exception ex)
            {
              
            }
        }

        private void LoadUserData()
        {
            // Load user data from database and display in form fields
            txtUsername.Text = "SampleUsername"; // Replace with actual logic
            txtEmail.Text = "sample@example.com"; // Replace with actual logic
            txtFullName.Text = "John Doe"; // Replace with actual logic

            // Load profile picture if available
            string profileImagePath = "~/Images/default-profile.png"; // Default image path
            imgProfilepicture.ImageUrl = profileImagePath; // Display default image
        }

        private void SaveUserData()
        {
            
        }
    }
}
