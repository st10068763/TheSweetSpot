using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static TheSweetSpot.OrderPage;

namespace TheSweetSpot
{
    public partial class CartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            var cart = Session["Cart"] as List<OrderItem>;
            if (cart != null)
            {
                CartRepeater.DataSource = cart;
                CartRepeater.DataBind();

                int totalItems = cart.Sum(item => item.Quantity);
                decimal totalPrice = cart.Sum(item => item.TotalPrice);

                TotalItemsLabel.Text = totalItems.ToString();
                TotalPriceLabel.Text = totalPrice.ToString("0.00");
            }
        }

        protected void CartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int cakeId = Convert.ToInt32(e.CommandArgument);
                var cart = Session["Cart"] as List<OrderItem>;
                if (cart != null)
                {
                    var itemToRemove = cart.FirstOrDefault(item => item.CakeID == cakeId);
                    if (itemToRemove != null)
                    {
                        cart.Remove(itemToRemove);
                        Session["Cart"] = cart;
                        LoadCart();
                    }
                }
            }
        }

        /// <summary>
        /// Button to redirect to checkout page so user can proceed with payment
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Redirect to checkout page
            Response.Redirect("CheckoutPage.aspx");
        }

        /// <summary>
        ///  Remove selected items from cart
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRemove_Click(object sender, EventArgs e)
        {
            // Remove selected items from cart
            var cart = Session["Cart"] as List<OrderItem>;
            if (cart != null)
            {
                foreach (RepeaterItem item in CartRepeater.Items)
                {
                    CheckBox chkSelect = item.FindControl("chkSelect") as CheckBox;
                    if (chkSelect != null && chkSelect.Checked)
                    {
                        HiddenField hfCakeId = item.FindControl("hfCakeId") as HiddenField;
                        int cakeId = Convert.ToInt32(hfCakeId.Value);
                        var itemToRemove = cart.FirstOrDefault(i => i.CakeID == cakeId);
                        if (itemToRemove != null)
                        {
                            cart.Remove(itemToRemove);
                        }
                    }
                }
                Session["Cart"] = cart;
                LoadCart();
            }
        }
    }
}
