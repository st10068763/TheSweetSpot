<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="TheSweetSpot.ContactPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-0r0g/X7sUvA/34QF4/lGmfFtNTPy7ZSdH8jKg2Ml4MQGye6TtVCd1Azs4M+HAdkY9+u6yXqyWw3/qyD27q/hCw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Custom CSS -->
    <link href="~/Styles/ContactPageStyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">The Sweet Spot</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="HomePage.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="About.aspx">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ContactPage.aspx">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LoginPage.aspx">Logout</a>
                        </li>                        
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="container contact-page" aria-labelledby="title">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 id="title">Contact Us</h1>
                    <p class="lead">We'd love to hear from you! Use the form below to get in touch with us.</p>
                </div>
            </div>

            <!-- Contact Form Section -->
            <div class="row mt-5">
                <div class="col-md-6">
                    <h3>Contact Us</h3>
                    <div class="mb-3">
                        <label for="txtName" class="form-label">Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Enter your name"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="txtEmail" class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="txtSubject" class="form-label">Subject</label>
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" Placeholder="Enter the subject"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="txtMessage" class="form-label">Message</label>
                        <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" Placeholder="Enter your message" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-block" Text="Submit" OnClick="btnSubmit_Click" />
                </div>

                <!-- Contact Information Section -->
                <div class="col-md-6">
                    <h3>Contact Information</h3>
                    <address class="mb-3">
                        <strong>The Sweet Spot</strong><br />
                        24 on Rose St<br />
                        Cape Town, Western Cape<br />
                        7700<br />
                        <abbr title="Phone">Phone:</abbr> (+27) 765-655-5670
                    </address>
                    <h3>Support</h3>
                    <p><a href="mailto:support@example.com">support@example.com</a></p>
                    <h3>Marketing</h3>
                    <p><a href="mailto:marketing@example.com">marketing@example.com</a></p>

                    <!-- Social Media Links -->
                    <div class="social-media mb-3">
                        <h3>Follow us on social media</h3>
                        <a href="#" class="btn btn-outline-primary btn-sm"><i class="fab fa-facebook-f"></i> Facebook</a>
                        <a href="https://www.instagram.com/thesweetspot___cpt/" class="btn btn-outline-primary btn-sm"><i class="fab fa-instagram"></i> Instagram</a>
                        <a href="#" class="btn btn-outline-primary btn-sm"><i class="fab fa-tiktok"></i> TikTok</a>
                    </div>

                    <!-- Map Section -->
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2689.492307256263!2d-122.13157438437072!3d47.640568979185875!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x549012d472702d3f%3A0x4c576f9b56b7e1d0!2sMicrosoft%20Building%2092%20Visitor%20Center!5e0!3m2!1sen!2sus!4v1597280027782!5m2!1sen!2sus" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>
        </main>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <!-- Font Awesome -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js" integrity="sha512-fY0npl4Wk2PqZueqJjgV0HvRF7p16gNiv3YbPaEd3/PtmhRmE3W8gkzgBNbHtP4BKsgXCkIZw9FpOro6Kukq5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </form>
</body>
</html>
