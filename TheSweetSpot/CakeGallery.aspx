<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CakeGallery.aspx.cs" Inherits="TheSweetSpot.CakeGallery" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cake Gallery - The Sweet Spot</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .cake-gallery {
            padding: 50px 0;
        }
        .cake-card {
            margin-bottom: 30px;
        }
        .cake-card img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .cake-card h3 {
            margin-top: 15px;
        }
        .cake-card p {
            margin-bottom: 15px;
        }
        .card-body {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container cake-gallery">
            <h1 class="text-center mb-5">Our Cake Gallery</h1>
            <div class="row">
                <asp:Repeater ID="CakeRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card cake-card">
                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="card-img-top">
                                <div class="card-body">
                                    <h3 class="card-title"><%# Eval("Name") %></h3>
                                    <p class="card-text"><%# Eval("Description") %></p>
                                    <p class="card-text"><strong>Price:</strong> $<%# Eval("Price") %></p>
                                    <p class="card-text"><strong>Ingredients:</strong> <%# Eval("Ingredients") %></p>
                                    <a href="Order.aspx?cakeId=<%# Eval("Id") %>" class="btn btn-primary">Order Now</a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
