<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">

<head>
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

    <title>Contact</title>
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
    .nav-item{
        padding-right: 20px;
        font-size: 25px;
    }
    .map
    {
        padding-top: 4em;
    }
    li p {
        color: #666;
        font-weight: 300;

    }
    p {
        margin: 0 0 10px 0;
        line-height: 21px;
    }
    .fotter{
        background-color: #232323;


    }
    #link{
        color: white;
    }
    .fotter-contact{
        color: white;
        font-family: 'Quicksand', sans-serif!important;
    }
    .logo-image{
        width: 70px;
        padding-bottom: 5px;
    }
    .button.dark {
        background-color: white;
        color: black;
        border: 2px solid #e7e7e7;
        font-size: 20px;
    }
    .button:hover{
        background-color: #666; /* Green */

    }
    .input-group
    {
        padding: 3px;
    }
    .fotter{
        background-color: black;
        color: white;
    }
    ul{
        list-style: none;
    }
</style>
<body>
<%@include file="../header/header.jsp" %>
<nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top">

    <a class="navbar-branch" href="../index.jsp">
        <img src="../images/logo.png" height="80px" alt="">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto" style="padding-left: 600px">
            <li class="nav-item">
                <a href="../home.jsp" class="nav-link ">Home</a>
            </li>
            <li class="nav-item dropdown">
                <a href="../customer/product/../product/list.jsp" class="nav-link ">Products</a>

            </li>
            <li class="nav-item">
                <a href="about.jsp" class="nav-link">About us</a>
            </li>
            <li class="nav-item">
                <a href="contact.jsp" class="nav-link">Contact</a>
            </li>
            <li class="nav-item">
                <a href="../customer/product/cart.jsp" class="nav-link">Cart</a>
            </li>

            <li class="nav-item dropdown no-arrow  ">
                <a style="color: black;position:relative; top: -20px;" class="nav-link dropdown-toggle " href="#" id="userDropdown" role="button" data-toggle="dropdown"
                >
                    <h3><i style="color: black;position:relative; top: -1px;" class="fas fa-user-circle fa-fw"></i></h3>
                </a>
                <div class="dropdown-menu dropdown-menu-"  >
                    <!--<a class="dropdown-item" href="#">Logout</a>-->

                    <%
                        Cookie[] cookies = request.getCookies();
                        if (cookies.length > 1) {
                            for (Cookie cookie : cookies) {
                                if (cookie.getName().equals("user")) {
                                    out.print("<a class='nav-link' style='color: black' href='../customer/Information.jsp'>" + cookie.getValue() + "</a>");
                                    out.print("<a class='nav-link' style='color: black' href='LogoutController'>Logout</a>");
                                }
                            }
                        } else {
                            out.print("<a class='nav-link' class='color' style='color: black' href='login.jsp'>Login</a>");
                            out.print("<a class='nav-link' style='color: black' href='signin.jsp'>Sigin</a>");
                        }
                    %>
                </div>
            </li>

        </ul>
    </div>
</nav>

<div class="container-fluid padding">
    <div class="row text-center padding">
        <div class="col-xs-12 col-sm-6">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3929.058115804464!2d105.72942691474229!3d10.012058492842899!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0882139720a77%3A0x3916a227d0b95a64!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgQ-G6p24gVGjGoQ!5e0!3m2!1sen!2s!4v1595307063984!5m2!1sen!2s"
                    width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>
        <div class="col-xs-12 col-sm-6">

            <ul class="list-infor" style="list-style: none;">
                <li>
                    <strong>Contact</strong>
                    <hr width="30%" size="10px" align="center" />
                    <p>Address</p>
                    <strong>FPT University (Can Tho Campus), 600 Nguyen Van Cu Street, Can Tho City</strong>
                </li>
                <li>
                    <p>Email</p>
                    <strong>
                        caspian.huynh@gmail.com
                    </strong>
                </li>
                <li>
                    <p>
                        Hotline
                    </p>

                    <strong>0786997179</strong>

                </li>
                <hr width="30%" size="10px" align="center" />

                <hr width="30%" size="10px" align="center" />
            </ul>
        </div>
    </div>
    <div class="fotter" style="width: 100% ;">
        <div class="container-fluid padding">
            <div class="row  text-center padding">
                <div class="col-xs-12 col-sm-6 ">
                    <ul class="icon">
                        <li>
                            <a id="link" target="_blank" class="footer-link has-icon has-icon facebook"
                               href="https://www.facebook.com/supportbuff101/"><i
                                    style="font-size:24px" class="fa">&#xf230;</i> Facebook</a>
                        </li>
                        <li>
                            <a id="link" target="_blank" class="footer-link has-icon has-icon instagram"
                               href="https://www.instagram.com/gnolhnyuh/"><i style="font-size:24px"
                                                                               class="fa">&#xf16d;</i>
                                Instagram</a>
                        </li>
                    </ul>


                </div>
                <div class="col-xs-12 col-sm-6 ">
                    <ul class="fotter-contact" style="list-style: none;">
                        <li>
                            <img class="logo-image" src="./images/logo.jpg" alt="">
                        </li>
                        <li class="Infor">
                            <span>FPT University (Can Tho Campus), 600 Nguyen Van Cu Street, Can Tho City</span>
                        </li>
                        <li>
                            <span>078.699.7179</span>
                        </li>
                        <li>
                            <span>longhbce150048@fpt.edu.vn</span>
                        </li>
                    </ul>
                </div>


            </div>
        </div>
    </div>

    <div class="fotter">
        <div class="footer-copyright text-center py-3">
            Shiba PetShop - Brought to you the best
        </div>
    </div>
</div>
</body>

</html>.