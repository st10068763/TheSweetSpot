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
                            <a class="nav-link" href="Login.aspx">Logout</a>
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
                <div class="col-md-3">
                    <!-- Profile Picture -->
                    <div class="text-center mb-3">
                        <asp:Image ID="imgProfilepicture" runat="server" CssClass="img-fluid rounded-circle" />
                        <asp:FileUpload ID="fileProfilePicture" runat="server" style="display: none" accept="image/*" />
                        
                        <label for="fileProfilePicture" class="btn btn-outline-primary mt-2"><i class="fas fa-camera"></i> Upload Picture</label>
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
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtFullName">Full Name:</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnUpdateProfile" runat="server" CssClass="btn btn-primary" Text="Update Profile" OnClick="btnUpdateProfile_Click" />
                </div>
            </div>
            <hr />

            <!-- Change Password Section -->
            <div class="row">
                <div class="col-md-6">
                    <h3>Change Password</h3>
                    <div class="form-group">
                        <label for="txtCurrentPassword">Current Password:</label>
                        <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtNewPassword">New Password:</label>
                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtConfirmPassword">Confirm New Password:</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnChangePassword" runat="server" CssClass="btn btn-primary" Text="Change Password" OnClick="btnChangePassword_Click" />
                </div>
            </div>
            <hr />

            <!-- Account Deactivation Section -->
            <div class="row">
                <div class="col-md-6">
                    <h3>Account Deactivation</h3>
                    <p>If you wish to deactivate your account, click the button below.</p>
                    <asp:Button ID="btnDeactivateAccount" runat="server" CssClass="btn btn-danger" Text="Deactivate Account" OnClick="btnDeactivateAccount_Click" />
                </div>
            </div>

            <!-- Order History Section -->
            <div class="row mt-5">
                <div class="col-md-12">
                    <h3>Order History</h3>
                    <asp:Repeater ID="rptOrderHistory" runat="server">
                        <HeaderTemplate>
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Order Date</th>
                                        <th>Total Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("OrderID") %></td>
                                <td><%# Eval("OrderDate", "{0:MM/dd/yyyy}") %></td>
                                <td><%# Eval("TotalAmount", "{0:C}") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <!-- Saved Custom Cake Designs Section -->
            <div class="row mt-5">
                <div class="col-md-12">
                    <h3>Saved Custom Cake Designs</h3>
                    <asp:Repeater ID="rptSavedDesigns" runat="server">
                        <HeaderTemplate>
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Design ID</th>
                                        <th>Design Name</th>
                                        <th>Last Modified</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("DesignID") %></td>
                                <td><%# Eval("DesignName") %></td>
                                <td><%# Eval("LastModified", "{0:MM/dd/yyyy}") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and any additional scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
