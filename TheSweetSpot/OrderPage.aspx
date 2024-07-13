<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPage.aspx.cs" Inherits="TheSweetSpot.OrderPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order a Cake - The Sweet Spot</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .order-form {
            padding: 50px 0;
        }
        .order-form h1 {
            margin-bottom: 30px;
        }
        .form-group label {
            font-weight: bold;
        }
    </style>
    <script>
        function toggleAddressFields() {
            var deliveryMethod = document.getElementById('<%= ddlDeliveryMethod.ClientID %>').value;
            var addressFields = document.getElementById('<%= addressFields.ClientID %>');
            if (deliveryMethod === 'Delivery') {
                addressFields.style.display = 'block';
            } else {
                addressFields.style.display = 'none';
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="HomePage.aspx">The Sweet Spot</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="UserAccountPage.aspx">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="About.aspx">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Contact.aspx">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Login.aspx">Logout</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CakeGallery.aspx">Cakes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="FAQPage.aspx">FAQ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CartPage.aspx">Cart</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="OrderPage.aspx">Order</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container order-form">
            <h1 class="text-center">Order a Cake</h1>
            <asp:Panel ID="OrderPanel" runat="server">
                <div class="row">
                    <!-- Order a Displayed Cake Section -->
                    <div class="col-md-6">
                        <h2>Order a Displayed Cake</h2>
                        <asp:DropDownList ID="ddlCakes" runat="server" CssClass="form-control mb-3" AutoPostBack="true" OnSelectedIndexChanged="ddlCakes_SelectedIndexChanged">
                            <asp:ListItem Text="Select a Cake" Value="" />
                        </asp:DropDownList>
                        <asp:TextBox ID="txtCakeQuantity" runat="server" CssClass="form-control mb-3" Placeholder="Quantity" TextMode="Number"></asp:TextBox>
                    </div>
                    <!-- Order details -->
                    <div class="col-md-6">
                        <h2>Your order details</h2>
                        <asp:Label for="txtCakeName" runat="server">Cake Name</asp:Label>
                        <asp:TextBox ID="txtCakeName" runat="server" CssClass="form-control mb-3" Text="" ReadOnly="true"></asp:TextBox>
                        <asp:Label for="txtCakePrice" runat="server">Cake Price</asp:Label>
                        <asp:TextBox ID="txtCakePrice" runat="server" CssClass="form-control mb-3" Text="" ReadOnly="true"></asp:TextBox>
                        <asp:Label for="txtCakeDescription" runat="server">Cake Description</asp:Label>
                        <asp:TextBox ID="txtCakeDescription" runat="server" CssClass="form-control mb-3" Text="" ReadOnly="true"></asp:TextBox>
                        <div class="quantity-selector">
                            <asp:Label ID="QuantityLabel" runat="server" Text="Enter product quantity: " />
                            <asp:TextBox ID="QuantityTB" runat="server" CssClass="quantity-input" Text="1" AutoPostBack="true" OnTextChanged="QuantityTB_TextChanged" />
                        </div>
                        <p>Total Price: R<asp:Label ID="TotalPriceLabel" runat="server" Text="0.00" /></p>
                    </div>

                    <!-- Create a Custom Cake Section -->
                    <div class="col-md-6">
                        <h2>Create a Custom Cake</h2>
                        <div class="form-group">
                            <label for="txtFlavor">Flavor</label>
                            <asp:TextBox ID="txtFlavor" runat="server" CssClass="form-control" Placeholder="Enter flavor"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtToppings">Toppings</label>
                            <asp:TextBox ID="txtToppings" runat="server" CssClass="form-control" Placeholder="Enter toppings"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtCream">Cream</label>
                            <asp:TextBox ID="txtCream" runat="server" CssClass="form-control" Placeholder="Enter cream"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtSpecialRequests">Special Requests</label>
                            <asp:TextBox ID="txtSpecialRequests" runat="server" CssClass="form-control" Placeholder="Enter any special requests" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <!-- Common Order Details Section -->
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="ddlDeliveryMethod">Delivery Method</label>
                            <asp:DropDownList ID="ddlDeliveryMethod" runat="server" CssClass="form-control mb-3" AutoPostBack="true" OnSelectedIndexChanged="ddlDeliveryMethod_SelectedIndexChanged">
                                <asp:ListItem Text="Select Delivery Method" Value="" />
                                <asp:ListItem Text="Pickup" Value="Pickup" />
                                <asp:ListItem Text="Delivery" Value="Delivery" />
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="txtPhone">Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Enter your phone number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtDate">Delivery Date</label>
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" Placeholder="Enter desired delivery date"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row" id="addressFields" runat="server" style="display: none;">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="txtAddress">Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Placeholder="Enter delivery address"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtCity">City</label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" Placeholder="Enter city"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtPostalCode">Postal Code</label>
                            <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control" Placeholder="Enter postal code"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit Order" OnClick="btnSubmit_Click" />
            </asp:Panel>
        </div>

        <!-- Optional JavaScript -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
