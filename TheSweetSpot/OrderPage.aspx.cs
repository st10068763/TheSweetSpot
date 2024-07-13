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
                int.TryParse(QuantityTB.Text, out quantity))
            {
                decimal totalPrice = cakePrice * quantity;
                TotalPriceLabel.Text = totalPrice.ToString("0.00");
            }
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

        }
    }
}