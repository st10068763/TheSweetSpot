<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestimonialPage.aspx.cs" Inherits="TheSweetSpot.TestimonialPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Testimonials - The Sweet Spot</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                             <li class="nav-item">
                                 <a class="nav-link" href="CartPage.aspx">Cart</a>
                             </li>
                         </ul>
                     </div>
                 </div>
             </nav>
        <div class="container mt-5">
            <h1 class="text-center mb-4">Customers feedback</h1>
            
            <!-- Testimonial Carousel -->
            <div id="testimonialCarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row">
                            <div class="col-md-8 offset-md-2">
                                <div class="card">
                                    <div class="card-body">
                                        <blockquote class="blockquote mb-0">
                                            <p>"The cakes from The Sweet Spot are absolutely divine! Every bite is a delight."</p>
                                            <footer class="blockquote-footer">Jane Doe</footer>
                                        </blockquote>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col-md-8 offset-md-2">
                                <div class="card">
                                    <div class="card-body">
                                        <blockquote class="blockquote mb-0">
                                            <p>"I ordered a custom cake for my daughter's birthday, and it was perfect. Beautiful and delicious!"</p>
                                            <footer class="blockquote-footer">John Smith</footer>
                                        </blockquote>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Add more carousel items as needed -->
                </div>
                <a class="carousel-control-prev" href="#testimonialCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#testimonialCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            
            <!-- Submit Testimonial Section -->
            <div class="row mt-5">
                <div class="col-md-8 offset-md-2">
                    <h3>Submit Your Testimonial</h3>
                    <asp:Panel ID="TestimonialPanel" runat="server">
                        <div class="form-group">
                            <label for="txtName">Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Enter your name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtMessage">Testimonial</label>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" Placeholder="Enter your testimonial" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-secondary btn-block mt-3" Text="Submit" />
                    </asp:Panel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
