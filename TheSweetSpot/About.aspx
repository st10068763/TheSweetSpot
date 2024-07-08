<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TheSweetSpot.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container about-page" aria-labelledby="title">
        <div class="row">
            <div class="col-md-12 text-center">
                <h1 id="title"><%: Title %></h1>
                <h2>Your application description page.</h2>
                <p class="lead">Use this area to provide additional information.</p>
            </div>
        </div>

        <!-- About the Baker Section -->
        <div class="row mt-5">
            <div class="col-md-4 text-center">
                <img src="https://png.pngtree.com/png-clipart/20230301/ourmid/pngtree-baker-illustration-delicious-cake-logo-png-image_6625245.png" alt="The Baker" class="img-fluid rounded-circle mb-3" style="width: 200px; height: 200px;">
                <h3>Meet the Baker</h3>
                <p>John Doe, our master baker, has over 20 years of experience in creating the most delightful cakes. His passion for baking is evident in every cake he makes.</p>
            </div>

            <!-- About the Bakery Section -->
            <div class="col-md-8">
                <h3>Our Story</h3>
                <p>Founded in 2000, The Sweet Spot has been dedicated to creating the finest cakes for all occasions. Our bakery started as a small family business and has grown into a beloved part of the community.</p>
                <h3>Our Mission</h3>
                <p>At The Sweet Spot, our mission is to bring joy to our customers through our delicious and beautifully crafted cakes. We believe that every cake should be a work of art, made with the highest quality ingredients.</p>
                <h3>Our Values</h3>
                <ul>
                    <li><strong>Quality:</strong> We use only the best ingredients in our cakes.</li>
                    <li><strong>Creativity:</strong> Each cake is a unique creation, tailored to our customer's wishes.</li>
                    <li><strong>Community:</strong> We are proud to be a part of our local community and strive to give back whenever we can.</li>
                    <li><strong>Sustainability:</strong> We are committed to environmentally friendly practices in our bakery.</li>
                </ul>
            </div>
        </div>
    </main>
</asp:Content>
