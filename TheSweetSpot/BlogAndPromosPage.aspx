<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlogAndPromosPage.aspx.cs" Inherits="TheSweetSpot.BlogAndPromosPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blog and Promotions - The Sweet Spot</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h1 class="text-center mb-4">Blog and Promotions</h1>
            
            <!-- Blog Section -->
            <div class="row mb-4">
                <div class="col-md-8">
                    <h2 class="mb-3">Latest Blog Posts</h2>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title">The Art of Cake Decorating</h5>
                            <h6 class="card-subtitle mb-2 text-muted">June 20, 2024</h6>
                            <p class="card-text">Discover the secrets to beautiful cake designs in our latest blog post...</p>
                            <a href="#" class="card-link">Read more</a>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Top 10 Cake Flavors of 2024</h5>
                            <h6 class="card-subtitle mb-2 text-muted">June 10, 2024</h6>
                            <p class="card-text">Check out the most popular cake flavors of this year...</p>
                            <a href="#" class="card-link">Read more</a>
                        </div>
                    </div>
                    <!-- Add more blog cards as needed -->
                </div>

                <!-- Promotions Section -->
                <div class="col-md-4">
                    <h2 class="mb-3">Current Promotions</h2>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Summer Sale - 20% Off All Orders</h5>
                            <p class="card-text">Enjoy a sweet discount this summer! Get 20% off all cake orders until the end of July.</p>
                            <a href="#" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Buy One, Get One Free</h5>
                            <p class="card-text">For a limited time, buy one cake and get another one free. Don't miss out!</p>
                            <a href="#" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                    <!-- Add more promotion cards as needed -->
                </div>
            </div>

            <!-- Newsletter Subscription Section -->
            <div class="row mt-5">
                <div class="col-md-8 offset-md-2">
                    <h3>Subscribe to Our Newsletter</h3>
                    <p>Stay updated with our latest blog posts and promotions by subscribing to our newsletter.</p>
                    <asp:Panel ID="NewsletterPanel" runat="server">
                        <div class="form-group">
                            <label for="txtEmail">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter your email address"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSubscribe" runat="server" CssClass="btn btn-primary btn-block mt-3" Text="Subscribe" />
                    </asp:Panel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
