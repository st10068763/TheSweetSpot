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
                            <a class="nav-link" href="ContactPage.apx">Contact</a>
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
            <h1>Checkout</h1>
            <div class="row mt-4">
                <div class="col-md-7">
                    <h3>Billing Details</h3>
                    <form>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="firstName">First name</label>
                                <input type="text" class="form-control" id="firstName" placeholder="Enter first name" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="lastName">Last name</label>
                                <input type="text" class="form-control" id="lastName" placeholder="Enter last name" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" placeholder="you@example.com" required>
                        </div>

                        <div class="mb-3">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="country">Country</label>
                                <select class="form-select" id="country" required>
                                    <option value="">Choose...</option>
                                    <option>South Africa</option>
                                    <option>Mozambique</option>
                                    <option>Other</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="zip">Zip</label>
                                <input type="text" class="form-control" id="zip" placeholder="" required>
                            </div>
                        </div>

                        <hr class="mb-4">
                        <h3>Payment</h3>

                        <div class="d-block my-3">
                            <div class="form-check">
                                <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
                                <label class="form-check-label" for="credit">Credit card</label>
                            </div>
                            <div class="form-check">
                                <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
                                <label class="form-check-label" for="debit">Debit card</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="cc-name">Name on card</label>
                                <input type="text" class="form-control" id="cc-name" placeholder="" required>
                                <small class="text-muted">Full name as displayed on card</small>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="cc-number">Credit card number</label>
                                <input type="text" class="form-control" id="cc-number" placeholder="" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <label for="cc-expiration">Expiration</label>
                                <input type="text" class="form-control" id="cc-expiration" placeholder="MM/YY" required>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="cc-cvv">CVV</label>
                                <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
                    </form>
                </div>
                <div class="col-md-5">
                    <h3>Order Summary</h3>
                    <div class="card mb-3">
                        <div class="card-body">
                            <!-- Example item in order summary -->
                            <h5 class="card-title">Product Name</h5>
                            <p class="card-text">Price: R50</p>
                            <p class="card-text">Quantity: 2</p>
                        </div>
                    </div>
                    <!-- Repeat for each item in order summary -->

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Total</h5>
                            <p class="card-text">Total Items: 3</p>
                            <p class="card-text">Total Price: R150</p>
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
