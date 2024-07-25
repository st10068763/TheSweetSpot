using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSweetSpot
{
    public partial class CheckoutPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRecommendations();
                GetCartItems();
            }

        }

        protected void btnMakePayment_Click(object sender, EventArgs e)
        {
            // Retrieve form data
            string firstName = Request.Form["firstName"];
            string lastName = Request.Form["lastName"];
            string email = Request.Form["email"];
            string address = Request.Form["address"];
            string country = Request.Form["country"];
            string zip = Request.Form["zip"];
            string paymentMethod = Request.Form["paymentMethod"];
            string ccName = Request.Form["cc-name"];
            string ccNumber = Request.Form["cc-number"];
            string ccExpiration = Request.Form["cc-expiration"];
            string ccCvv = Request.Form["cc-cvv"];

            // Process payment using a payment gateway (e.g., Stripe)
            bool paymentSuccess = ProcessPayment(ccNumber, ccExpiration, ccCvv, GetTotalAmount());

            if (paymentSuccess)
            {
                // Send order summary to the administrator
                SendOrderSummaryToAdmin(email, address);

                // Redirect to a confirmation page or display a success message
                Response.Redirect("OrderConfirmation.aspx");
            }
            else
            {
                // Display an error message
                Response.Write("<script>alert('Payment failed. Please try again.');</script>");
            }
        }

        private bool ProcessPayment(string ccNumber, string ccExpiration, string ccCvv, decimal amount)
        {
            // Integrate with a payment gateway like Stripe
            // Example: Implement Stripe payment processing logic here
            // Return true if payment is successful, otherwise false
            return true; // Dummy return for illustration purposes
        }

        private void SendOrderSummaryToAdmin(string customerEmail, string deliveryAddress)
        {
            var adminEmail = "admin@thesweetspot.com";
            var fromEmail = "noreply@thesweetspot.com";
            var subject = "New Order Received";
            var body = GenerateOrderSummaryEmail(customerEmail, deliveryAddress);

            using (var smtpClient = new SmtpClient("smtp.your-email-provider.com"))
            {
                smtpClient.Port = 587;
                smtpClient.Credentials = new NetworkCredential("your-email-username", "your-email-password");
                smtpClient.EnableSsl = true;

                using (var mailMessage = new MailMessage(fromEmail, adminEmail))
                {
                    mailMessage.Subject = subject;
                    mailMessage.Body = body;
                    mailMessage.IsBodyHtml = true;

                    smtpClient.Send(mailMessage);
                }
            }
        }

        private string GenerateOrderSummaryEmail(string customerEmail, string deliveryAddress)
        {
            var cartItems = GetCartItems(); // Replace with your method to fetch cart items
            var totalAmount = cartItems.Sum(item => item.TotalPrice);

            var emailBody = "<h1>New Order Received</h1>";
            emailBody += $"<p><strong>Customer Email:</strong> {customerEmail}</p>";
            emailBody += $"<p><strong>Delivery Address:</strong> {deliveryAddress}</p>";
            emailBody += "<h2>Order Summary</h2>";
            emailBody += "<table border='1' cellpadding='5' cellspacing='0'>";
            emailBody += "<tr><th>Product Name</th><th>Quantity</th><th>Price</th><th>Total</th></tr>";

            foreach (var item in cartItems)
            {
                emailBody += $"<tr><td>{item.CakeName}</td><td>{item.Quantity}</td><td>{item.CakePrice}</td><td>{item.TotalPrice}</td></tr>";
            }

            emailBody += $"<tr><td colspan='3' align='right'><strong>Total:</strong></td><td>{totalAmount}</td></tr>";
            emailBody += "</table>";

            return emailBody;
        }

        private decimal GetTotalAmount()
        {
            var cartItems = GetCartItems(); // Replace with your method to fetch cart items
            return cartItems.Sum(item => item.TotalPrice);
        }

        private List<CartItem> GetCartItems()
        {
            // Replace this with actual data retrieval logic
            // Example with dummy data:
            return new List<CartItem>
            {
                new CartItem { CakeID = 1, CakeName = "Chocolate Cake", CakePrice = 50.00m, Quantity = 2, TotalPrice = 100.00m, Address = "123 Main St", DeliveryTime = "10:00 AM" },
                new CartItem { CakeID = 2, CakeName = "Vanilla Cake", CakePrice = 50.00m, Quantity = 1, TotalPrice = 50.00m, Address = "456 Elm St", DeliveryTime = "2:00 PM" }
            };
        }

        private void BindRecommendations()
        {
            // Simulate data for recommendations
            var recommendations = new List<Recommendation>
            {
                new Recommendation { ItemID = 1, ItemName = "Chocolate Cake", Price = 150.00M, ImageUrl = "~/Images/chocolate_cake.jpg" },
                new Recommendation { ItemID = 2, ItemName = "Vanilla Cake", Price = 120.00M, ImageUrl = "~/Images/vanilla_cake.jpg" },
                new Recommendation { ItemID = 3, ItemName = "Red Velvet Cake", Price = 180.00M, ImageUrl = "~/Images/red_velvet_cake.jpg" },
                new Recommendation { ItemID = 4, ItemName = "Cheesecake", Price = 200.00M, ImageUrl = "~/Images/cheesecake.jpg" },
            };

            RecommendationsRepeater.DataSource = recommendations;
            RecommendationsRepeater.DataBind();
        }

        public class Recommendation
        {
            public int ItemID { get; set; }
            public string ItemName { get; set; }
            public decimal Price { get; set; }
            public string ImageUrl { get; set; }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            var button = sender as Button;
            int itemId = Convert.ToInt32(button.CommandArgument);

            // Add the item to the cart logic here

            // Rebind order summary if necessary
           // BindOrderSummary();
        }

        protected void btnUploadProof_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                    string folderPath = Server.MapPath("~/ProofOfPayments/");

                    // Ensure the directory exists
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    // Save the file
                    fileUpload.PostedFile.SaveAs(Path.Combine(folderPath, fileName));

                    // Display success message
                    // Use your preferred method to display messages, e.g., Label, JavaScript alert, etc.
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Proof of payment uploaded successfully.');", true);
                }
                catch (Exception ex)
                {
                    // Display error message
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void debitCard_CheckedChanged(object sender, EventArgs e)
        {

        }
    }


    public class CartItem
    {
        public int CakeID { get; set; }
        public string CakeName { get; set; }
        public decimal CakePrice { get; set; }
        public int Quantity { get; set; }
        public decimal TotalPrice { get; set; }
        public string Address { get; set; }
        public string DeliveryTime { get; set; }
    }
}
