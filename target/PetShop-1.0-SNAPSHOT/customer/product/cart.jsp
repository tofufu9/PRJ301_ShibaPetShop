<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.entity.Products"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Shiba Pet Shop - Cart</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <meta charset="UTF-8">
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <!-- JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
    <style>
        @import url('https://fonts.google.com/specimen/Balsamiq+Sans');
        html ,body {
            width: 100%;
            height: 100%;
            font-family: 'Balsamiq Sans';
            font-size: 17px;
            color: #222;
        }
        h2{
            text-align: center;
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
        .title{
            font-size: 25px;
            text-align: center;
        }
        .price{
            font-size: 20px;
            text-align: center;
            color: #000;
            font-weight: bold;

        }
    </style>
</head>
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
                            out.print("<a class='nav-link' style='color: black' href='../../auth/signin.jsp'>Sign Up </a>");
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
                <p class="breadcrumbs"><span class="mr-2"><a href="./../../home.jsp">Home</a></span> <span>Cart</span></p>
                <h1 class="mb-0 bread">My Cart</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section ftco-cart">
    <div class="container">
        <div class="row">
            <div class="col-md-12 ftco-animate">
                <div>
                    <p class="title">LIST CART<p>

                        <%
                                    HashMap<Integer, Integer> listCart = (HashMap<Integer, Integer>) session.getAttribute("listCart");
                                    String rm = request.getParameter("rm");
                                    ProductsDAO pDao = new ProductsDAO();
                                    double total = 0.0;
                                    if (rm != null) {
                                        listCart.remove(Integer.parseInt(rm));
                                    }
                                    if (listCart == null) {
                                        out.print("<h2>You have no items in your shopping cart !</h2>");

                                    } else {
                                        out.print("<table class='table'>");
                                        out.print(" <thead class='thead-primary'>"
                                                + " <tr class='text-center'>"
                                                + "<th>No.</th>"
                                                + " <th>Product</th>"
                                                + " <th>Price</th>"
                                                + " <th>Discount</th>"
                                                + " <th>Quantity</th>"
                                                + "<th></th>"
                                                + "</tr>"
                                                + "   </thead>"
                                        );

                                        int stt = 0;
                                        for (Integer i : listCart.keySet()) {
                                            int quantity = listCart.get(i);
                                            Products p = pDao.getProduct(i);
                                            out.print("<tr>");
                                            out.print("<td>" + ++stt + "</td>");
                                            out.print("<td><a href='productDetail.jsp?pID=" + i + "'>" + p.getpName() + "</a></td>");
                                            out.print("<td>" + p.getPrice() + "</td>");
                                            out.print("<td>" + p.getDiscount() + "</td>");
                                            out.print("<td>" + quantity + "</td>");
                                            total += (double) quantity * (p.getPrice() - p.getDiscount() * p.getPrice() / 100);
                                            out.print("<td><a href='?rm=" + i + "'>Remove</a></td>");
                                            out.print("</tr>");
                                                                                    }
                                    }
                                    out.print(" </table>");

                                    pDao.closeConn();
                                %>
                </div>
                <div class="row justify-content-start">
                    <div class="col-6 col-sm-4 mt-5 col-lg-4">
                        <p class="text-center"><a href="list.jsp" class="btn btn-primary py-3 px-4">Buy Continue</a></p>
                    </div>
                    <div class="col-6 col-sm-4 mt-5 cart-wrap ftco-animate col-lg-4 ">
                                <span>
                                    <p class="title">CART TOTAL</p>
                                    <p class="price"><%= total%></p>
                                </span>
                    </div>
                    <div class="col-6 col-sm-4 mt-5 col-lg-4">
                        <p class="text-center"><a href="../../LoginController?total=<%= total%>" class="btn btn-primary py-3 px-4">Proceed to Checkout</a></p>
                    </div>
                </div>

            </div>
        </div>
    </div>
    </div>
</section>

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
<script src="Style/js/google-map.js"></script>
<script src="Style/js/main.js"></script>
</body>
</html>
