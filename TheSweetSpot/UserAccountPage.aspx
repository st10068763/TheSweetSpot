<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAccountPage.aspx.cs" Inherits="TheSweetSpot.UserAccountPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Account</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="~/MyCSS/MyStyleFencySheet.css" />
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-0r0g/X7sUvA/34QF4/lGmfFtNTPy7ZSdH8jKg2Ml4MQGye6TtVCd1Azs4M+HAdkY9+u6yXqyWw3/qyD27q/hCw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        .profile-pic {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #ddd;
        }
    </style>
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
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <h1>Welcome to Your Account</h1>
            <hr />

            <!-- User Information Section -->
            <div class="row">
                <div class="col-md-4">
                    <!-- Profile Picture -->
                    <asp:Image ID="imgProfilepicture" runat="server"  CssClass="profile-pic" />
                    <div class="text-center mb-3">
                        <asp:FileUpload ID="fileProfilePicture" runat="server" CssClass="form-control" style="display: none;" />
                         <!-- Error message for the picture -->
                         <asp:Label ID="PictureErrorMessage" Text="" runat="server" CssClass="text-danger"></asp:Label>
                         <!-- Success message -->
                         <asp:Label ID="SuccessMessage" Text="" runat="server" CssClass="text-success"></asp:Label>
                        <label for="fileProfilePicture" class="btn btn-outline-primary mt-2" onclick="document.getElementById('<%= fileProfilePicture.ClientID %>').click();"><i class="fas fa-camera"></i> Upload Picture</label>
                        <img id="ImagePreview" src="" alt="Profile Picture preview" style="max-width: 150px; height: auto; display: none;" />
                        <asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile" CssClass="btn btn-primary" OnClick="btnUpdateProfile_Click" />
                    </div>  
                    
                </div>
                <div class="col-md-9">
                    <h3>User Information</h3>
                    <div class="form-group">
                        <label for="txtUsername">Username:</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                   
                </div>
            </div>

            <hr />

            <!-- Password Change Section -->
            <div class="row">
                <div class="col-md-6">
                    <h3>Change Password</h3>
                    <div class="form-group">
                        <label for="txtCurrentPassword">Current Password:</label>
                        <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtNewPassword">New Password:</label>
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtConfirmPassword">Confirm New Password:</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn btn-warning" OnClick="btnChangePassword_Click" />
                    </div>
                </div>
            </div>

            <hr />

            <!-- Account Deactivation Section -->
            <div class="row">
                <div class="col-md-12">
                    <h3>Deactivate Account</h3>
                    <p>If you deactivate your account, you will no longer be able to log in or place orders.</p>
                    <asp:Button ID="btnDeactivateAccount" runat="server" Text="Deactivate Account" CssClass="btn btn-danger" OnClick="btnDeactivateAccount_Click" />
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Custom JS for file input -->
    <script>
        document.getElementById('<%= fileProfilePicture.ClientID %>').addEventListener('change', function (event) {
            var fileInput = event.target;
            var file = fileInput.files[0];
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('ImagePreview').src = e.target.result;
                document.getElementById('ImagePreview').style.display = 'block';
            };
            reader.readAsDataURL(file);
        });
    </script>
</body>
</html>
