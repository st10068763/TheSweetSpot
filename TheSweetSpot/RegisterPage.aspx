<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="TheSweetSpot.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="~/MyCSS/MyStyleFencySheet.css" />
    <style>
        /* Custom styles can be added here */
        body {
            background-color: #f8f9fa;
        }

        .register-form {
            max-width: 360px;
            margin: auto;
            padding: 15px;
            background: #fff;
            border: 1px solid #ced4da;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-top: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">The Sweet Spot</a>
            </div>
        </nav>

        <!-- Registration Form -->
        <div class="container mt-5">
            <div class="register-form">
                <h2 class="text-center">Register</h2>
                <div class="mb-3">
                    <label for="txtUsername" class="form-label">Username</label>
                    <input type="text" id="txtUsername" runat="server" class="form-control" placeholder="Enter your username" />
                </div>
                <div class="mb-3">
                    <label for="txtEmail" class="form-label">Email</label>
                    <input type="email" id="txtEmail" runat="server" class="form-control" placeholder="Enter your email" />
                </div>
                 <div class="mb-3">
                     <label for="phoneNumber" class="form-label">Phone Number</label>
                     <input type="text" id="phoneNumber" runat="server" class="form-control" placeholder="Enter your phone number" />
                 </div>
                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Password</label>
                    <input type="password" id="txtPassword" runat="server" class="form-control" placeholder="Enter your password" />
                </div>
                <div class="mb-3">
                    <label for="txtConfirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" id="txtConfirmPassword" runat="server" class="form-control" placeholder="Confirm your password" />
                </div>
                <div class="d-grid gap-2">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
                </div>
                <div class="text-center mt-3">
                    Already have an account? <a href="LoginPage.aspx">Login here</a>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </form>
</body>
</html>
