<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckoutPage.aspx.cs" Inherits="TheSweetSpot.CheckoutPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="~/MyCSS/MyStyleFencySheet.css" />
    <style>
        body {
            background-color: #2196f3;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .navbar-brand {
            font-weight: bold;
        }
        .recommendation-card img {
            height: 150px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="HomePage.aspx">The Sweet Spot</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="HomePage.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CakeGallery.aspx">Cakes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ContactPage.aspx">Contact</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="CartPage.aspx">Cart <span class="badge bg-secondary">3</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Checkout Content -->
        <div class="container mt-5">
            <h1 class="mb-4">Checkout</h1>
            <div class="row">
                <div class="col-md-7">
                    <h3>Billing Details</h3>
                    <asp:TextBox ID="firstName" runat="server" CssClass="form-control mb-3" placeholder="Enter first name" Required="true"></asp:TextBox>
                    <asp:TextBox ID="lastName" runat="server" CssClass="form-control mb-3" placeholder="Enter last name" Required="true"></asp:TextBox>
                    <asp:TextBox ID="email" runat="server" CssClass="form-control mb-3" placeholder="you@example.com" Required="true" type="email"></asp:TextBox>
                    <asp:TextBox ID="address" runat="server" CssClass="form-control mb-3" placeholder="1234 Main St" Required="true"></asp:TextBox>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <asp:DropDownList ID="country" runat="server" CssClass="form-select" Required="true">
                                <asp:ListItem Text="Choose..." Value="" />
                                <asp:ListItem Text="South Africa" Value="South Africa" />
                                <asp:ListItem Text="Mozambique" Value="Mozambique" />
                                <asp:ListItem Text="Other" Value="Other" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="zip" runat="server" CssClass="form-control" placeholder="Zip code" Required="true"></asp:TextBox>
                        </div>
                    </div>

                    <hr class="mb-4" />
                    <h3>Payment</h3>
                    <div>
                        <asp:RadioButton ID="creditCard" runat="server" Checked="true" Text="Credit Card" GroupName="PaymentMethod" />
                        <br />
                        <asp:RadioButton ID="debitCard" runat="server" Text="Debit Card" GroupName="PaymentMethod" />
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="cardNametxt" runat="server" CssClass="form-control" placeholder="Full name as displayed on card" Required="true"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:TextBox ID="cardNumbertxt" runat="server" CssClass="form-control" placeholder="Card number" Required="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <asp:TextBox ID="txtExpiringDate" runat="server" CssClass="form-control" TextMode="Month" placeholder="MM/YY" Required="true"></asp:TextBox>
                        </div>
                        <div class="col-md-3 mb-3">
                            <asp:TextBox ID="txtCvv" runat="server" CssClass="form-control" TextMode="Password" placeholder="CVV" Required="true"></asp:TextBox>
                        </div>
                    </div>
                    <hr class="mb-4" />
                    <h3>Upload Proof of Payment</h3>
                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control mb-3" />
                    <asp:Button ID="btnUploadProof" runat="server" Text="Upload Proof" CssClass="btn btn-secondary btn-block" OnClick="btnUploadProof_Click" />
                    <hr class="mb-4" />
                    <asp:Button ID="btnMakePayment" runat="server" Text="MAKE PAYMENT" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnMakePayment_Click" />
                </div>
                <div class="col-md-5">
                    <h3>Order Summary</h3>
                    <asp:Repeater ID="OrderSummaryRepeater" runat="server">
                        <ItemTemplate>
                            <div class="card mb-3">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("CakeName") %></h5>
                                    <p class="card-text">Price: R<%# Eval("CakePrice") %></p>
                                    <p class="card-text">Quantity: <%# Eval("Quantity") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Total</h5>
                            <p class="card-text">Total Items: <asp:Label ID="TotalItemsLabel" runat="server" /></p>
                            <p class="card-text">Total Price: R<asp:Label ID="TotalPriceLabel" runat="server" /></p>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="mb-4" />
            <h3>You May Also Like</h3>
            <div class="row">
                <asp:Repeater ID="RecommendationsRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-md-3">
                            <div class="card recommendation-card mb-4">
                                <img src='<%# Eval("ImageUrl") %>' class="card-img-top" alt="Recommended Item" />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("ItemName") %></h5>
                                    <p class="card-text">Price: R<%# Eval("Price") %></p>
                                    <asp:Button ID="btnAddToCart" runat="server" CssClass="btn btn-primary btn-sm" Text="Add to Cart" CommandArgument='<%# Eval("ItemID") %>' OnClick="AddToCart_Click" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </form>
</body>
</html>
