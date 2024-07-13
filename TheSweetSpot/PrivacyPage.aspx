<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrivacyPage.aspx.cs" Inherits="TheSweetSpot.PrivacyPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Privacy Policy</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
          <!-- Custom CSS -->
     <link rel="stylesheet" href="~/MyCSS/MyStyleFencySheet.css" />
    <style>
        /* Custom styles can be added here */
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
                        <li class="nav-item">
                            <a class="nav-link" href="CartPage.aspx">Cart</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Privacy Policy Content -->
        <div class="container mt-5">
            <h1>Privacy Policy</h1>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porttitor varius augue, ut mattis libero commodo ut. Nulla facilisi. Phasellus
                finibus aliquet erat eget laoreet. Nunc non purus eu neque ultrices ullamcorper at id justo. In hac habitasse platea dictumst. Morbi vel
                ligula non lectus condimentum volutpat.
            </p>

            <h3>Information We Collect</h3>
            <p>
                Nam aliquam, risus et imperdiet tristique, nisi orci sollicitudin lacus, sed sodales metus ligula sed ligula. Suspendisse in suscipit odio.
                Aenean bibendum faucibus est, id fermentum odio fermentum eget. Quisque vehicula, risus sed elementum egestas, mi sapien eleifend erat, ac
                gravida nulla nulla ac dui.
            </p>

            <h3>How We Use Your Information</h3>
            <p>
                Donec vel dui ipsum. Donec ut sem nec purus consequat congue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac
                turpis egestas.
            </p>

            <h3>Security</h3>
            <p>
                Mauris congue justo sit amet est commodo, ut eleifend nulla condimentum. Proin sed ex ac libero consequat vestibulum.
            </p>

            <h3>Contact Us</h3>
            <p>
                If you have any questions about this Privacy Policy, please contact us:
                <br />
                Email: thesweetspot@gmail.com
                <br />
                Phone: +27 (123) 456-7890
            </p>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </form>
</body>
</html>

