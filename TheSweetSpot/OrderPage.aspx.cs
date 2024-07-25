using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheSweetSpot
{
    public partial class OrderPage : System.Web.UI.Page
    {
        //Connection string 
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\TheSweetSpotDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ToggleAddressFields();
                LoadCakes();
            }
        }

        /// <summary>
        /// Quantity text box change event to calculate the total price based on the quantity entered
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void QuantityTB_TextChanged(object sender, EventArgs e)
        {
            UpdateTotalPrice();
        }

        private void UpdateTotalPrice()
        {
            decimal cakePrice;
            int quantity;

            if (Session["CakePrice"] != null && decimal.TryParse(Session["CakePrice"].ToString(), out cakePrice) &&
                int.TryParse(QuantityTB.Text, out quantity ))
            {
                decimal totalPrice = cakePrice * quantity;
                TotalPriceLabel.Text = totalPrice.ToString("0.00");
            }

            //if (Session["CakePrice"] != null && decimal.TryParse(Session["CakePrice"].ToString(), out cakePrice) &&
            //   int.TryParse(txtCakeQuantity.Text, out quantity))
            //{
            //    decimal totalPrice = cakePrice * quantity;
            //    TotalPriceLabel.Text = totalPrice.ToString("0.00");
            //}
        }

        private void LoadCakes()
        {            
            string query = "SELECT CakeID, CakeName FROM Cakes";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlCakes.DataSource = reader;
                ddlCakes.DataTextField = "CakeName";
                ddlCakes.DataValueField = "CakeID";
                ddlCakes.DataBind();
            }
            ddlCakes.Items.Insert(0, new ListItem("Select a Cake", ""));
        }

        protected void ddlCakes_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedCakeId;
            if (int.TryParse(ddlCakes.SelectedValue, out selectedCakeId))
            {
                LoadCakeDetails(selectedCakeId);
            }
        }
        /// <summary>
        /// Method to load the cake details based on the selected cake
        /// </summary>
        /// <param name="cakeId"></param>
        private void LoadCakeDetails(int cakeId)
        {
            string query = "SELECT CakeName, CakePrice, CakeDescription FROM Cakes WHERE CakeID = @CakeID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CakeID", cakeId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtCakeName.Text = reader["CakeName"].ToString();
                    txtCakePrice.Text = reader["CakePrice"].ToString();
                    txtCakeDescription.Text = reader["CakeDescription"].ToString();

                    // Store the cake price in the session
                    Session["CakePrice"] = Convert.ToDecimal(reader["CakePrice"]);
                }
            }
        }  

        // Method to save the order details to the database and pass the order details to the cart page
        private void SaveOrderDetails()
        {
            try
            {
                // Get the user id from the session, default to NULL for non-registered users
                int? userId = Session["UserID"] != null ? Convert.ToInt32(Session["UserID"]) : (int?)null;
                int cakeId;
                int.TryParse(ddlCakes.SelectedValue, out cakeId);
                string cakeName = txtCakeName.Text;
                decimal cakePrice;
                decimal.TryParse(txtCakePrice.Text, out cakePrice);
                int quantity;
                int.TryParse(QuantityTB.Text, out quantity);
                decimal totalPrice;
                decimal.TryParse(TotalPriceLabel.Text, out totalPrice);
                string flavour = txtFlavor.Text;
                string topping = txtToppings.Text;
                string cream = txtCream.Text;
                string specialRequest = txtSpecialRequests.Text;
                string deliveryMethod = ddlDeliveryMethod.SelectedValue;
                string phoneNumber = txtPhone.Text;
                DateTime deliveryDate;
                DateTime.TryParse(txtDate.Text, out deliveryDate);
                DateTime pickUpDate;
                DateTime.TryParse(txtPickUpDate.Text, out pickUpDate);
                string deliveryTime = txtDeliveryTime.Text;
                string address = txtAddress.Text;
                string city = txtCity.Text;
                string postalCode = txtPostalCode.Text;
                string username = txtUsername.Text;

                // Save the order details to the database
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Orders (UserID, CakeID, CakeName, CakePrice, TotalAmount, Flavour, Toping, Cream, SpecialRequest, DeliveryMethod, PhoneNumber, DeliveryDate, PickUpDate, DeliveryTime, Address, City, PostalCode, Username) " +
                        "VALUES (@UserID, @CakeID, @CakeName, @CakePrice, @TotalAmount, @Flavour, @Toping, @Cream, @SpecialRequest, @DeliveryMethod, @PhoneNumber, @DeliveryDate, @PickUpDate, @DeliveryTime, @Address, @City, @PostalCode, @Username)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@UserID", (object)userId ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@CakeID", cakeId);
                    cmd.Parameters.AddWithValue("@CakeName", cakeName);
                    cmd.Parameters.AddWithValue("@CakePrice", cakePrice);
                    cmd.Parameters.AddWithValue("@TotalAmount", totalPrice);
                    cmd.Parameters.AddWithValue("@Flavour", flavour);
                    cmd.Parameters.AddWithValue("@Toping", topping);
                    cmd.Parameters.AddWithValue("@Cream", cream);
                    cmd.Parameters.AddWithValue("@SpecialRequest", specialRequest);
                    cmd.Parameters.AddWithValue("@DeliveryMethod", deliveryMethod);
                    cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    cmd.Parameters.AddWithValue("@DeliveryDate", deliveryDate);
                    cmd.Parameters.AddWithValue("@PickUpDate", pickUpDate);
                    cmd.Parameters.AddWithValue("@DeliveryTime", deliveryTime);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@City", city);
                    cmd.Parameters.AddWithValue("@PostalCode", postalCode);
                    cmd.Parameters.AddWithValue("@Username", username);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                // Display success message before redirecting to the cart page, gives the user 15 seconds to read the message
                lblSuccess.Text = "Order placed successfully!";
                System.Threading.Thread.Sleep(15000);

                var cart = Session["Cart"] as List<OrderItem> ?? new List<OrderItem>();
                cart.Add(new OrderItem
                {
                    CakeID = cakeId,
                    CakeName = cakeName,
                    CakePrice = cakePrice,
                    Quantity = quantity,
                    TotalPrice = totalPrice,
                    Flavour = flavour,
                    Topping = topping,
                    Cream = cream,
                    SpecialRequest = specialRequest,
                    DeliveryMethod = deliveryMethod,
                    PhoneNumber = phoneNumber,
                    DeliveryDate = deliveryDate,
                    PickUpDate = pickUpDate,
                    DeliveryTime = deliveryTime,
                    Address = address,
                    City = city,
                    PostalCode = postalCode,
                    Username = username
                });
                Session["Cart"] = cart;

                lblSuccess.Text = "Order placed successfully!";
                Response.Redirect("CartPage.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = "An error occurred: " + ex.Message;
            }
           
        }

        protected void ddlDeliveryMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
                ToggleAddressFields();
        }

        private void ToggleAddressFields()
        {
            string deliveryMethod = ddlDeliveryMethod.SelectedValue;
            if (deliveryMethod == "Delivery")
            {
                addressFields.Style["display"] = "block";
            }
            else
            {
                addressFields.Style["display"] = "none";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SaveOrderDetails();

        }

        [Serializable]
        public class OrderItem
        {
            public int CakeID { get; set; }
            public string CakeName { get; set; }
            public decimal CakePrice { get; set; }
            public int Quantity { get; set; }
            public decimal TotalPrice { get; set; }
            public string Flavour { get; set; }
            public string Topping { get; set; }
            public string Cream { get; set; }
            public string SpecialRequest { get; set; }
            public string DeliveryMethod { get; set; }
            public string PhoneNumber { get; set; }
            public DateTime DeliveryDate { get; set; }
            public DateTime PickUpDate { get; set; }
            public string DeliveryTime { get; set; }
            public string Address { get; set; }
            public string City { get; set; }
            public string PostalCode { get; set; }
            public string Username { get; set; }
        }
    }
}