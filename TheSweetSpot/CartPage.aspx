<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="TheSweetSpot.CartPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
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

        <!-- Cart Content -->
        <div class="container mt-5">
            <h1>Your Shopping Cart</h1>
            <div class="row mt-4">
                <div class="col-md-8">
                    <asp:Repeater ID="CartRepeater" runat="server">
                        <ItemTemplate>
                            <div class="card mb-3">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("CakeName") %></h5>
                                    <p class="card-text">Price: R<%# Eval("CakePrice") %></p>
                                    <p class="card-text">Quantity: <%# Eval("Quantity") %></p>
                                    <p class="card-text">Address: <%# Eval("Address") %></p>
                                    <p class="card-text">Delivery Time: <%# Eval("DeliveryTime") %></p>
                                    <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-outline-danger" CommandName="Remove" CommandArgument='<%# Eval("CakeID") %>' OnClick="btnRemove_Click" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Order Summary</h5>
                            <p class="card-text">Total Items: <asp:Label ID="TotalItemsLabel" runat="server" /></p>
                            <p class="card-text">Total Price: R<asp:Label ID="TotalPriceLabel" runat="server" /></p>
                            <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn btn-outline-primary" OnClick="btnCheckout_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </form>
</body>
</html>
