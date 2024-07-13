<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TermsAndConditionsPage.aspx.cs" Inherits="TheSweetSpot.TermsAndConditionsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Terms and Conditions</title>
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

        <!-- Terms and Conditions Content -->
        <div class="container mt-5">
            <h1>Terms and Conditions</h1>
            <p>
                Welcome to The Sweet Spot. These terms and conditions outline the rules and regulations for the use of our website. By accessing this website, we assume you accept these terms and conditions in full. Do not continue to use The Sweet Spot's website if you do not accept all of the terms and conditions stated on this page.
            </p>

            <h3>License</h3>
            <p>
                Unless otherwise stated, The Sweet Spot and/or its licensors own the intellectual property rights for all material on The Sweet Spot. All intellectual property rights are reserved. You may view and/or print pages from https://www.thesweetspot.com for your own personal use subject to restrictions set in these terms and conditions.
            </p>

            <h3>You must not:</h3>
            <ul>
                <li>Republish material from https://www.thesweetspot.com</li>
                <li>Sell, rent or sub-license material from https://www.thesweetspot.com</li>
                <li>Reproduce, duplicate or copy material from https://www.thesweetspot.com</li>
                <li>Redistribute content from The Sweet Spot (unless content is specifically made for redistribution).</li>
            </ul>

            <h3>Hyperlinking to our Content</h3>
            <p>
                The following organizations may link to our website without prior written approval:
                <ul>
                    <li>Government agencies</li>
                    <li>Search engines</li>
                    <li>News organizations</li>
                    <li>Online directory distributors</li>
                </ul>
            </p>

            <h3>Content Liability</h3>
            <p>
                We shall have no responsibility or liability for any content appearing on your website. You agree to indemnify and defend us against all claims arising out of or based upon your website. No link(s) may appear on any page on your website or within any context containing content or materials that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.
            </p>

            <h3>Reservation of Rights</h3>
            <p>
                We reserve the right at any time and in its sole discretion to request that you remove all links or any particular link to our website. You agree to immediately remove all links to our website upon such request. We also reserve the right to amend these terms and conditions and its linking policy at any time. By continuing to link to our website, you agree to be bound to and abide by these linking terms and conditions.
            </p>

            <h3>Change to the Agreement</h3>
            <p>
                We reserve the right, at our sole discretion, to modify or replace these Terms and Conditions by posting the updated terms on the Site. Your continued use of the Site after any such changes constitutes your acceptance of the new Terms and Conditions.
            </p>

            <h3>Contact Us</h3>
            <p>
                If you have any questions about these Terms and Conditions, please contact us:
                <br />
                Email: terms@thesweetspot.com
                <br />
                Phone: +1 (123) 456-7890
            </p>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </form>
</body>
</html>
