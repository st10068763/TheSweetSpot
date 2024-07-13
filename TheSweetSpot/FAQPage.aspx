<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQPage.aspx.cs" Inherits="TheSweetSpot.FAQPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FAQ - The Sweet Spot</title>
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
            <h1 class="text-center mb-4">Frequently Asked Questions</h1>
            
            <!-- Search Bar -->
            <div class="row mb-4">
                <div class="col-md-8 offset-md-2">
                    <input type="text" class="form-control" id="faqSearch" placeholder="Search FAQs..." onkeyup="filterFAQs()">
                </div>
            </div>
            
            <!-- FAQ Section -->
            <div id="faqAccordion">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                What are your operating hours?
                            </button>
                        </h2>
                    </div>
                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#faqAccordion">
                        <div class="card-body">
                            We are open from Monday to Friday, 9 AM to 6 PM, and Saturday from 10 AM to 4 PM. We are closed on Sundays.
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingTwo">
                        <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                How do I place an order?
                            </button>
                        </h2>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#faqAccordion">
                        <div class="card-body">
                            You can place an order by visiting our 'Order a Cake' page and filling out the order form. You can also call us directly at 425.555.0100.
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingThree">
                        <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                What types of cakes do you offer?
                            </button>
                        </h2>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#faqAccordion">
                        <div class="card-body">
                            We offer a wide variety of cakes, including chocolate, vanilla, red velvet, carrot, and many more. You can view all our offerings in the 'Cake Gallery' page.
                        </div>
                    </div>
                </div>
                <!-- Add more FAQ items as needed -->
            </div>
        </div>
    </form>

    <script>
        function filterFAQs() {
            var input, filter, accordion, cards, cardHeader, i, txtValue;
            input = document.getElementById('faqSearch');
            filter = input.value.toLowerCase();
            accordion = document.getElementById('faqAccordion');
            cards = accordion.getElementsByClassName('card');
            
            for (i = 0; i < cards.length; i++) {
                cardHeader = cards[i].getElementsByClassName('card-header')[0];
                txtValue = cardHeader.textContent || cardHeader.innerText;
                if (txtValue.toLowerCase().indexOf(filter) > -1) {
                    cards[i].style.display = "";
                } else {
                    cards[i].style.display = "none";
                }
            }
        }
    </script>
</body>
</html>
