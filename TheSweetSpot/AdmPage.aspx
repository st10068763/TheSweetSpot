<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdmPage.aspx.cs" Inherits="TheSweetSpot.AdmPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page - The Sweet Spot</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link rel="stylesheet" href="~/MyCSS/MyStyleFencySheet.css" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .admin-container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            background: #fff;
            border: 1px solid #ced4da;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .admin-header {
            margin-bottom: 20px;
        }

        .form-section {
            margin-bottom: 30px;
        }

        .auto-style1 {
            width: 535px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">The Sweet Spot</a>
            </div>
        </nav>

        <div class="container admin-container">
            <div class="admin-header text-center">
                <h2>Admin Page</h2>
                <p>Manage cakes and product listings</p>
            </div>

            <div class="form-section">
                <h3>Add New Cake</h3>
                <asp:Label ID="successMessage" runat="server" ForeColor="Green"></asp:Label>
                <asp:Label ID="errorMessage" runat="server" ForeColor="Red"></asp:Label>
                <div class="mb-3">
                    <label for="txtCakeName" class="form-label">Cake Name</label>
                    <asp:TextBox ID="txtCakeName" runat="server" CssClass="form-control" placeholder="Enter cake name"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtCakeDescription" class="form-label">Cake Description</label>
                    <asp:TextBox ID="txtCakeDescription" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter cake description"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtCakePrice" class="form-label">Cake Price</label>
                    <asp:TextBox ID="txtCakePrice" runat="server" CssClass="form-control" placeholder="Enter cake price"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="fileCakeImage" class="form-label">Cake Image</label>
                    <asp:FileUpload ID="fileCakeImage" runat="server" CssClass="form-control" />
                </div>
                <div>
                    <label for="ImagePreview" class="form-check-label">Preview</label>
                    <img id="ImagePreview" src="" alt="Cake image preview" style="max-width: 100%; height: auto;" />
                </div>
                <div class="d-grid gap-2">
                    <asp:Button ID="btnAddCake" runat="server" Text="Add Cake" CssClass="btn btn-primary" OnClick="btnAddCake_Click" />
                </div>
            </div>

            <div class="form-section">
                <h3>List Cakes for Sale</h3>
                <asp:GridView ID="gvCakes" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                    <Columns>
                        <asp:BoundField DataField="CakeID" HeaderText="ID" />
                        <asp:BoundField DataField="CakeName" HeaderText="Name" />
                        <asp:BoundField DataField="CakeDescription" HeaderText="Description" />
                        <asp:BoundField DataField="CakePrice" HeaderText="Price" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnRemoveCake" runat="server" Text="Remove" CommandArgument='<%# Eval("CakeID") %>' OnClick="btnRemoveCake_Click" CssClass="btn btn-danger" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="form-section">
                <h3>View Orders</h3>
                <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                    <Columns>
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                        <asp:BoundField DataField="UserID" HeaderText="User ID" />
                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" />
                        <asp:BoundField DataField="TotalAmount" HeaderText="Total amount" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="form-section">
                <h3>Manage Users</h3>
                <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                    <Columns>
                        <asp:BoundField DataField="UserID" HeaderText="User ID" />
                        <asp:BoundField DataField="Username" HeaderText="Username" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnRemoveUser" runat="server" Text="Remove" CommandArgument='<%# Eval("UserID") %>' OnClick="btnRemoveUser_Click" CssClass="btn btn-danger" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <script>
            document.querySelector("#fileCakeImage").addEventListener("change", function () {
                const reader = new FileReader();

                reader.addEventListener("load", () => {
                    document.querySelector("#ImagePreview").setAttribute("src", reader.result);
                });

                reader.readAsDataURL(this.files[0]);
            });
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESFdLPG8EqYOQ7QeQ6d4oaqB8JrUU0ZOmQ" crossorigin="anonymous"></script>
    </form>
</body>
</html>
