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
                        <asp:DropDownList ID="ddlCakes" runat="server" CssClass="form-control mb-3">
                            <asp:ListItem Text="Select a Cake" Value="" />
                           
                        </asp:DropDownList>
                        <asp:TextBox ID="txtCakeQuantity" runat="server" CssClass="form-control mb-3" Placeholder="Quantity" TextMode="Number"></asp:TextBox>
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
                            <label for="txtCustomerName">Your Name</label>
                            <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control" Placeholder="Enter your name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtEmail">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtPhone">Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Enter your phone number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtDueDate">Due Date</label>
                            <asp:TextBox ID="txtDueDate" runat="server" CssClass="form-control" Placeholder="Enter the due date" TextMode="Date"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSubmitOrder" runat="server" CssClass="btn btn-primary btn-block mt-3" Text="Submit Order" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
