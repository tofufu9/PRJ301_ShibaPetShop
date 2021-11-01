<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Shiba Pet Shop</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <link rel="stylesheet" href="Style/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="Style/css/animate.css">
    <link rel="stylesheet" href="Style/css/owl.carousel.min.css">
    <link rel="stylesheet" href="Style/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="Style/css/magnific-popup.css">
    <link rel="stylesheet" href="Style/css/aos.css">
    <link rel="stylesheet" href="Style/css/ionicons.min.css">
    <link rel="stylesheet" href="Style/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="Style/css/jquery.timepicker.css">
    <link rel="stylesheet" href="Style/css/flaticon.css">
    <link rel="stylesheet" href="Style/css/icomoon.css">
    <link rel="stylesheet" href="Style/css/style.css">
    <style>
        @import url('https://fonts.google.com/specimen/Balsamiq+Sans');
        html ,body {
            width: 100%;
            height: 100%;
            font-family: 'Balsamiq Sans';
            font-size: 17px;
            color: #222;
        }
        .navbar{
            background-color: #92A8D1 !important;
        }
        .navbar li a {
            color: #f8f2f2!important ;

        }
        .navbar li a:hover {
            color: #000000 !important ;

        }
        .container-fluid
        {
            padding-top: 8em;
        }


        .overlay {
            position: absolute;
            bottom: 0;
            background: rgb(0, 0, 0);
            background: rgba(0, 0, 0, 0.5); /* Black see-through */
            color: #f1f1f1;
            width: 100%;
            transition: .5s ease;
            opacity:0;
            color: white;
            font-size: 20px;
            padding: 20px;
            text-align: center;
        }
        .container-fluid:hover .overlay {
            opacity: 1;
        }
        .nav-item{
            padding-right: 20px;
            font-size: 25px;
        }
        .fotter{
            background-color: black;
            color: white;
        }
    </style>
<body class="goto-here">
<jsp:include page="../../header/header.jsp" ></jsp:include>
<nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top">

    <a class="navbar-branch" href="../../index.jsp">
        <img src="./images/logo.png" height="80px" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto" style="padding-left: 600px">
            <li class="nav-item">
                <a href="../../home.jsp" class="nav-link ">Home</a>
            </li>
            <li class="nav-item dropdown">
                <a href="../../customer/product/list.jsp" class="nav-link ">Products</a>

            </li>
            <li class="nav-item">
                <a href="../../auth/about.jsp" class="nav-link">About us</a>
            </li>
            <li class="nav-item">
                <a href="../../auth/contact.jsp" class="nav-link">Contact</a>
            </li>
            <li class="nav-item">
                <a href="cart.jsp" class="nav-link">Cart</a>
            </li>

            <li class="nav-item dropdown no-arrow  ">
                <a style="color: black;position:relative; top: -20px;" class="nav-link dropdown-toggle " href="#" id="userDropdown" role="button" data-toggle="dropdown"
                >
                    <h3><i style="color: black;position:relative; top: -1px;" class="fas fa-user-circle fa-fw"></i></h3>
                </a>
                <div class="dropdown-menu dropdown-menu- bg-dark text-white "  >
                    <!--<a class="dropdown-item" href="#">Logout</a>-->

                    <%
                        Cookie[] cookies = request.getCookies();
                        if (cookies.length > 1) {
                            for (Cookie cookie : cookies) {
                                if (cookie.getName().equals("user")) {
                                    out.print("<a class='nav-link dropdown-item bg-dark' style='color: white; font-size:20px;' href='../../customer/Information.jsp'>" + cookie.getValue() + "</a>");
                                    out.print("<a class='nav-link dropdown-item bg-dark' style='color: white; font-size:20px;' href='../../LogoutController'>Logout</a>");
                                } else if (cookie.getName().equals("admin")) {
                                    RequestDispatcher disp = request.getRequestDispatcher("admin/dashboard.jsp");
                                    disp.forward(request, response);
                                }
                            }
                        } else {
                            out.print("<a class='nav-link' style='color: black' href='../../auth/login.jsp'>Login</a>");
                            out.print("<a class='nav-link' style='color: black' href='../../auth/signin.jsp'>Sigin</a>");
                        }
                    %>
                </div>
            </li>
        </ul>
    </div>
</nav>


<div class="hero-wrap hero-bread" style="background-image: url('Style/images/bgcartt.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="./../../home.jsp">Home</a></span> <span>Checkout</span></p>
                <h1 class="mb-0 bread">Checkout</h1>
            </div>
        </div>
    </div>
</div>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 ftco-animate">
                <form action="./../../OrderController" class="billing-form" method="post">
                    <h3 class="billing-heading">Billing Details</h3>
                    <div class="row align-items-end">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">Your Name</label>
                                <input type="text" class="form-control" placeholder="Your Name" name="nameCustomer">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="text" class="form-control" placeholder="Your Phone Number" name="phone">
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="streetaddress">Street Address</label>
                                <input type="text" class="form-control" placeholder="House Number and Street Name" name="address">
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="towncity">Note</label>
                                <input type="text" class="form-control" placeholder="Your Note" name="note">
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-start">
                        <div class="col-6 col-sm-4 mt-5 col-lg-4">
                            <p class="text-center"><a href="list.jsp" class="btn btn-primary py-3 px-4">Buy Continue</a></p>
                        </div>
                        <div class="col-6 col-sm-4 mt-5 cart-wrap ftco-animate col-lg-4 ">
                        <span>
                            <p class="title">CART TOTAL</p>
                            <input type="hidden" value="<%= request.getParameter("total") %>" name="total"/>
                            <p class="price" ><%= request.getParameter("total") %></p>
                        </span>
                        </div>
                        <div class="col-6 col-sm-4 mt-5 col-lg-4">
                            <p class="text-center"><input type="submit" class="btn btn-primary py-3 px-4" name="btnOrder" value="Order"></p>
                        </div>
                    </div>
                </form><!-- END -->
            </div> <!-- .col-md-8 -->
        </div>
    </div>
</section> <!-- .section -->



<script src="Style/js/jquery.min.js"></script>
<script src="Style/js/jquery-migrate-3.0.1.min.js"></script>
<script src="Style/js/popper.min.js"></script>
<script src="Style/js/bootstrap.min.js"></script>
<script src="Style/js/jquery.easing.1.3.js"></script>
<script src="Style/js/jquery.waypoints.min.js"></script>
<script src="Style/js/jquery.stellar.min.js"></script>
<script src="Style/js/owl.carousel.min.js"></script>
<script src="Style/js/jquery.magnific-popup.min.js"></script>
<script src="Style/js/aos.js"></script>
<script src="Style/js/jquery.animateNumber.min.js"></script>
<script src="Style/js/bootstrap-datepicker.js"></script>
<script src="Style/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="Style/js/google-map.js"></script>
<script src="Style/js/main.js"></script>
</body>
</html>

