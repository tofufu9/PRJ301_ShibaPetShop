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
    <title>About Us</title>
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
        @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900,900italic);

        body {
            font-family: 'Source Sans Pro', sans-serif;
            line-height: 1.5;
            color: #323232;
            font-size: 15px;
            font-weight: 400;
            text-rendering: optimizeLegibility;
            -webkit-font-smoothing: antialiased;
            -moz-font-smoothing: antialiased;
        }
        .heading-title {
            margin-bottom: 50px;
            margin-left: 175px;
        }
        .text-center {
            text-align: center;
        }
        .heading-title h3 {
            margin-bottom: 0;
            letter-spacing: 2px;
            font-weight: normal;
        }
        .p-top-30 {
            padding-top: 30px;
        }
        .half-txt {
            width: 60%;
            margin: 0 auto;
            display: inline-block;
            line-height: 25px;
            color: #7e7e7e;
        }
        .text-uppercase {
            text-transform: uppercase;
        }

        .team-member, .team-member .team-img {
            position: relative;
        }
        .team-member {
            overflow: hidden;
        }
        .team-member, .team-member .team-img {
            position: relative;
        }

        .team-hover {
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            margin: 0;
            border: 20px solid rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.90);
            opacity: 0;
            -webkit-transition: all 0.3s;
            transition: all 0.3s;
        }
        .team-member:hover .team-hover .desk {
            top: 35%;
        }
        .team-member:hover .team-hover, .team-member:hover .team-hover .desk, .team-member:hover .team-hover .s-link {
            opacity: 1;
        }
        .team-hover .desk {
            position: absolute;
            top: 0%;
            width: 100%;
            opacity: 0;
            -webkit-transform: translateY(-55%);
            -ms-transform: translateY(-55%);
            transform: translateY(-55%);
            -webkit-transition: all 0.3s 0.2s;
            transition: all 0.3s 0.2s;
            padding: 0 20px;
        }
        .desk, .desk h4, .team-hover .s-link a {
            text-align: center;
            color: #222;
        }
        .team-member:hover .team-hover .s-link {
            bottom: 10%;
        }
        .team-member:hover .team-hover, .team-member:hover .team-hover .desk, .team-member:hover .team-hover .s-link {
            opacity: 1;
        }
        .team-hover .s-link {
            position: absolute;
            bottom: 0;
            width: 100%;
            opacity: 0;
            text-align: center;
            -webkit-transform: translateY(45%);
            -ms-transform: translateY(45%);
            transform: translateY(45%);
            -webkit-transition: all 0.3s 0.2s;
            transition: all 0.3s 0.2s;
            font-size: 35px;
        }
        .desk, .desk h4, .team-hover .s-link a {
            text-align: center;
            color: #222;
        }
        .team-member .s-link a {
            margin: 0 10px;
            color: #333;
            font-size: 16px;
        }
        .team-title {
            position: static;
            padding: 20px 0;
            display: inline-block;
            letter-spacing: 2px;
            width: 100%;
        }
        .team-title h5 {
            margin-bottom: 0px;
            display: block;
            text-transform: uppercase;
        }
        .team-title span {
            font-size: 12px;
            text-transform: uppercase;
            color: #a5a5a5;
            letter-spacing: 1px;
        }

    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<%@include file="../header/header.jsp" %>
<nav class=" navbar navbar-expand-md navbar-light bg-light sticky-top">

    <a class="navbar-branch" href="index.jsp">
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
                <a href="../customer/product/list.jsp" class="nav-link ">Products</a>

            </li>
            <li class="nav-item">
                <a href="about.jsp" class="nav-link">About us</a>
            </li>
            <li class="nav-item">
                <a href="contact.jsp" class="nav-link">Contact</a>
            </li>
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
                                if (cookie.getName().equals("user")) { // neu user dang nhap
                                    out.print("<a class='nav-link' style='color: black' href='../customer/Information.jsp'>" + cookie.getValue() + "</a>"); // chuyen vao trang infor user
                                    out.print("<a class='nav-link' style='color: black' href='LogoutController'>Logout</a>");
                                }
                            }
                        } else {
                            out.print("<a class='nav-link' class='color' style='color: black' href='login.jsp'>Login</a>"); // neu user chua dang nhap
                            out.print("<a class='nav-link' style='color: black' href='signin.jsp'>Sign Up</a>");
                        }
                    %>
                </div>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="heading-title text-center">
            <h3 class="text-uppercase">Our Team </h3>
            <p class="p-top-30 half-txt">We are sophomore Software Engineer's student. We are currently studying Java Web Application and many interesting subjects. </p>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="team-member">
                <div class="team-img">
                    <img src="../images/ava1.jpg" alt="team member" class="img-responsive">
                </div>
                <div class="team-hover">
                    <div class="desk">
                        <h4>Hi There !</h4>
                        <p>I love to introduce myself as a cat lover.</p>
                    </div>
                    <div class="s-link">
                        <a href="https://www.facebook.com/supportbuff101/"><i class="fa fa-facebook"></i></a>
                        <a href="https://www.instagram.com/gnolhnyuh/"><i class="fa fa-instagram"></i></a>
                        <a href="mailto:longhbce150048@fpt.edu.vn"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>
            </div>
            <div class="team-title">
                <h5>Huynh Bao Long</h5>
                <span>Leader & front-end developer</span>
            </div>
        </div>
        <div class="col-md-4 col-sm-4">
            <div class="team-member">
                <div class="team-img">
                    <img src="../images/ava2.jpeg" alt="team member" class="img-responsive">
                </div>
                <div class="team-hover">
                    <div class="desk">
                        <h4>Hello Everyone</h4>
                        <p>You can play League of Legends with me if we have free time.</p>
                    </div>
                    <div class="s-link">
                        <a href="https://www.facebook.com/duc.thien.263"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>
            </div>
            <div class="team-title">
                <h5>Le Dao Thien Duc</h5>
                <span>Database & Back-end developer</span>
            </div>
        </div>
        <div class="col-md-4 col-sm-4">
            <div class="team-member">
                <div class="team-img">
                    <img src="../images/ava3.jpeg" alt="team member" class="img-responsive">
                </div>
                <div class="team-hover">
                    <div class="desk">
                        <h4>I love to play basketball</h4>
                        <p>I love to introduce myself as a basketball player of my university.</p>
                    </div>
                    <div class="s-link">
                        <a href="https://www.facebook.com/profile.php?id=100004653615040"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>
            </div>
            <div class="team-title">
                <h5>Doan Hieu Nhan</h5>
                <span>Editor & Back-end developer</span>
            </div>
        </div>

    </div>
<!-- <div class="textabouts">
    <div class="container-fluid padding">
        <div class="row text-ceter padding">
            <div class="col-xs-12">
                <p class="text-abouts" style="font-weight: 600;">
                    Shiba Pet Shop was produced in view of the pet darling.
                    We see pets as individuals from the family, so our point is to give clients items and administrations that can guarantee their darling pet will appreciate an upbeat, solid life. </p>
                <br> </br>

                <p style="font-weight: 600;">We know how essential the human-creature bond is, so our promise to quality creature care reaches out to each aspect of our business. </p>
                <br> </br>
                <p style="font-weight: 600;"> Have you at any point met an enthusiastic creature sweetheart? An obstinate, fringe fixated pet proprietor? All things considered, permit us the joy of acquainting you with our client benefit office. Every one of our client bolster staff individuals has more than 10 years of involvement in their related pet field.
                <p>
                    <br>
                    </br>
                <p style="font-weight: 600;">
                Have an inquiry? We have the appropriate response.

                The forefront of ‘Organization Name’ is our prestigious client bolster group. Be that as it may, the stays of our business are our extraordinary costs, wide choice, speed of conveyance and prevalent administration. A demonstration of that is the way that we deliver 97% of requests same-day. We structured Shiba Pet Shop with the aim of giving not just the best items at the most competitive costs, yet to wind up the #1 supplier of pet items, training and data.
                </p>

                <div class="col-xs-12 boder bg-light">
                            <span class="image1">
                                <img class="image" src="../images/about2.jpg" alt="" style="width:100%">
                            </span>
                </div>
                <br></br>
                <div class="col-xs-12 boder bg-light">
                            <span class="image1">
                                <img class="image" src="../images/about4.jpg" alt="" style="width:100% " style="padding: 50px">
                            </span>
                </div>
            </div>
        </div>

    </div>
</div>
-->
</div>
<div class="fotter">
    <div class="footer-copyright text-center py-3">
        Shiba PetShop - Brought to you the best
    </div>
</div>
</body>

</html>
