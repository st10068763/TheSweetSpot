<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="TheSweetSpot.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
       <!-- Custom CSS -->
   <link rel="stylesheet" href="~/MyCSS/MyStyleFencySheet.css" />
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
                            <a class="nav-link" href="ContactPage.aspx">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LoginPage.aspx">Logout</a>
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

        <!-- Hero Section -->
        <section class="hero-section text-center">
            <div class="container">
                <h1 id="heroTitle">Welcome to The Sweet Spot</h1>
                <p class="lead">Your destination for the most delicious and beautifully crafted cakes!</p>
                <p><a href="CakeGallery.aspx" class="btn btn-primary btn-lg">Explore Our Cakes &raquo;</a></p>
            </div>
        </section>

        <!-- Featured Cakes Section -->
        <section id="featuredCakes" class="featured-cakes-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card cake-card">
                            <img src="https://cookingandcussing.com/wp-content/uploads/2019/06/IMG_7127-min.jpg.webp" alt="Cake 1" class="card-img-top"/>
                           
                            <div class="card-body">
                                <h3 class="card-title">Chocolate Delight</h3>
                                <p class="card-text">$30 - Rich chocolate cake with creamy ganache.</p>
                                <a href="CartPage.aspx?cakeId=1" class="btn btn-primary">Order Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card cake-card">
                            <img src="https://www.hamperlicious.co.za/wp-content/uploads/2021/05/NETCG18.jpg" alt="Cake 2" class="card-img-top"/>
                            <div class="card-body">
                                <h3 class="card-title">Vanilla Dream</h3>
                                <p class="card-text">$25 - Light vanilla cake with buttercream frosting.</p>
                                <a href="CartPage.aspx?cakeId=2" class="btn btn-primary">Order Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card cake-card">
                            <img src="https://thescranline.com/wp-content/uploads/2023/06/RED-VELVET-CAKE-23-S-01.jpg" alt="Cake 3" class="card-img-top"/>
                            <div class="card-body">
                                <h3 class="card-title">Red Velvet</h3>
                                <p class="card-text">$35 - Classic red velvet cake with cream cheese frosting.</p>
                                <a href="CartPage.aspx?cakeId=3" class="btn btn-primary">Order Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- About Us Section -->
        <section class="about-us-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h2>About Us</h2>
                        <p class="lead">Welcome to The Sweet Spot! We specialize in creating delicious and beautiful cakes for all occasions.</p>
                        <p><a href="About.aspx" class="btn btn-outline-secondary">Learn More &raquo;</a></p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Us Section -->
        <section class="contact-us-section bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h2>Contact Us</h2>
                        <p class="lead">Have a question or special request? We'd love to hear from you!</p>
                        <p><a href="Contact.aspx" class="btn btn-outline-secondary">Get in Touch &raquo;</a></p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </form>
</body>
</html>
