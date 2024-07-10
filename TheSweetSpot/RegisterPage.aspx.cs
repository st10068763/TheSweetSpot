using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSweetSpot
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        //Connection string 
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:|DataDirectory|\\TheSweetSpotDB.mdf;Integrated Security=True";
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Method to register a new user in the database
        private bool CreateNewUser(string username, string email, string phoneNumber, string password)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = @"
                        INSERT INTO Users (Username, Password, Email, PhoneNumber) 
                        VALUES (@Username, @Password, @Email, @PhoneNumber)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", username);
                        command.Parameters.AddWithValue("@Password", password);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
                return false;
            }
        }

        // Method to validates the email
        private bool EmailIsValid(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        // Function to check password criteria
        private bool PasswordMeetsCriteria(string password)
        {
            // Define criteria: at least one uppercase, one lowercase, one number, one special character
            bool hasUpperCase = false;
            bool hasLowerCase = false;
            bool hasDigit = false;
            bool hasSpecialChar = false;

            foreach (char c in password)
            {
                if (char.IsUpper(c))
                    hasUpperCase = true;
                else if (char.IsLower(c))
                    hasLowerCase = true;
                else if (char.IsDigit(c))
                    hasDigit = true;
                else if (char.IsSymbol(c) || char.IsPunctuation(c))
                    hasSpecialChar = true;
            }

            return hasUpperCase && hasLowerCase && hasDigit && hasSpecialChar;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Declaring the variables
            string username = txtUsername.Text;
            string email = txtEmail.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string password = txtPassword.Text;

            // This will hash the password before storing it in the database
            string hashedPassword = DataEncryptionClass.HashPassword(password);

            // validating the email
            if (!EmailIsValid(email))
            {
                lblMessage.Text = "Invalid email address!";
                lblMessage.CssClass = "text-danger";
                return;
            }
            // validates the password
            if (password.Length < 8 || !PasswordMeetsCriteria(password))
            {
                lblMessage.Text = "Password must be at least 8 characters long and contain at least one uppercase letter," +
                                     " one lowercase letter, one number, and one special character.";
                lblMessage.CssClass = "text-danger";
                return;
            }
            // validating the phone number 
            if (phoneNumber.Any(char.IsLetter))
            {
                lblMessage.Text = "Please insert a valid phone number";
                lblMessage.CssClass = "text-danger";
                return;
            }
            // validates the username
            if (string.IsNullOrEmpty(username))
            {
                lblMessage.Text = "Pease insert a valid user name";
                lblMessage.CssClass = "text-danger";
            }
            // calls the method to insert new user
            if (CreateNewUser(username,email, phoneNumber, hashedPassword))
            {
                // Display success message and redirect
                lblMessage.Text = "Account created successfully! Redirecting to login page...";
                lblMessage.CssClass = "text-success";

                // Redirect to the login page after a short delay
                Response.AppendHeader("Refresh", "5;url=LoginPage.aspx");
            }

        }
    }
}