<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="model.DAO.TypeDAO"%>
<%@page import="model.DAO.SupplierDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.BrandDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <!--<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">-->

    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#centralModalSm").modal('show');
        });
    </script>

    <title>Shiba Pet Shop - List </title>
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
            padding-top: 2em;
        }

        .btn{
            background: #92A8D1
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
        .right {
            transform: rotate(-45deg);
            -webkit-transform: rotate(-45deg);
        }
        .nav-item{
            padding-right: 20px;
            font-size: 25px;
        }
        .arrow {
            border: solid black;
            border-width: 0 3px 3px 0;
            display: inline-block;
            padding: 3px;
        }
        .fotter{
            background-color: black;
            color: white;
        }
        img {
            transition: all 1s ease;
            -webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
        }


        img:hover {
            transform: scale(1.2,1.2);
            -webkit-transform: scale(1.2,1.2);
            -moz-transform: scale(1.2,1.2);
            -o-transform: scale(1.2,1.2);
            -ms-transform: scale(1.2,1.2);
        }
        .active-pink-4 input[type=text]:focus:not([readonly]) {
            border: 1px solid #f48fb1;
            box-shadow: 0 0 0 1px #f48fb1;
        }
        .active-pink-3 input[type=text] {
            border: 1px solid #f48fb1;
            box-shadow: 0 0 0 1px #f48fb1;
        }

    </style>
</head>
<%
    boolean isLogin = false;
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("idCustomer") && !cookie.getValue().equals("0")) {
            isLogin = true;
        }
    }
%>
<body>
<%
    String msg = request.getParameter("message");
    if (msg != null) {%>
<!-- Frame Modal Bottom -->
<!-- Button trigger modal -->

<!-- Central Modal Small -->
<div class="modal fade" id="centralModalSm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">

    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-xl" role="document">


        <div class="modal-content modal-dialog-centered">
            <div class="modal-header">
                <h4 class="modal-title w-100" id="myModalLabel"><p style="font-size: 30px; color:palevioletred ; font-weight: bold">Notification</p></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p style="font-size: 20px; font-weight: bold">The product has been added to cart.</p>
                <p style="font-size: 20px; font-weight: bold">Click on Cart to see details.</p>
                <p style="font-size: 20px; font-weight: bold"> Thank you!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary  btn-sm" data-dismiss="modal" onclick="reload()">Close</button>
                <script>
                    function reload() {
                        location.href = "list.jsp"
                    }
                </script>
            </div>
        </div>
    </div>
</div>
<!-- Central Modal Small -->


<%}

%>


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
                <a href="../../index.jsp" class="nav-link ">Home</a>
            </li>
            <li class="nav-item dropdown">
                <a href="./list.jsp" class="nav-link ">Products</a>

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

                    <%                                if (cookies.length > 1) {
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
                        out.print("<a class='nav-link' style='color: black' href='../../auth/signin.jsp'>Sign Up</a>");
                    }
                    %>
                </div>
            </li>

        </ul>
    </div>
</nav>

<sql:setDataSource var="conn" scope="session"
                   url="jdbc:mysql://localhost/petshop"
                   user="root" password=""
                   driver="com.mysql.jdbc.Driver"/>
<%if (request.getParameter("type") != null && request.getParameter("value") != null) {
    String sql = " select * from products where status= ?";
    String type = request.getParameter("type");

    if (type.equals("pettype")) {
        String value = request.getParameter("value");
        sql = "select * from products where pettype=? AND status = 1";
    } else {
        int value = Integer.parseInt(request.getParameter("value"));
        if (type.equals("type")) {
            sql = "select * from products where tID=? AND status = 1";
        } else if (type.equals("brand")) {
            sql = "select * from products where brID=? AND status = 1";
        } else if (type.equals("supplier")) {
            sql = "select * from products where supID=? AND status = 1";
        }
    }

%>

<sql:query var="p" dataSource="${conn}" sql="<%=sql%>">

    <sql:param value="${param.value}"/>
</sql:query>
<%} else  if(request.getParameter("txtSearch")!=null){%>

<sql:query var="p" dataSource="${conn}">
    SELECT * FROM  products WHERE status =1 and pName like '%${param.txtSearch}%' ORDER BY pID ASC

</sql:query>

<%} else {%>
<sql:query var="p" dataSource="${conn}">
    select * from products where status = 1

</sql:query>
<%}%>

<sql:query dataSource="${conn}" var="i"
           sql="select * from image where pID=?">
    <sql:param value="${row.pID}"/>
</sql:query>
<div class=" row container" style="margin-left: 170px">
    <div>
        <div class="col col-sm-4 col-md-4 ml-3 " >
            <button class="btn btn-light btn-lg" type="button"><a href="list.jsp" style="color: #000000">All Products</a></button>


        </div>
        <div class="col dropright col-sm-4 col-md-4 ">

            <button class="btn btn-light btn-lg "   type="button" id="dropdownMenuButton" data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">
                <div style="width: 200px">   Filter by  <i class="arrow right"></i> </div>
            </button>

            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <li class="dropdown-submenu">
                    <a class="test" tabindex="-1" href="#">Type<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%
                            TypeDAO tDao = new TypeDAO();
                            ResultSet allType = tDao.getAll();
                            while (allType.next()) {
                                out.println("  <li><a tabindex='-1' href='list.jsp?type=type&value=" + allType.getString(1) + "'> " + allType.getString(2) + "</a></li>");
                            }
                        %>
                        <li class="dropdown-submenu">

                        </li>
                    </ul>
                </li>
                <li class="dropdown-submenu">
                    <a class="test" tabindex="-1" href="#">Brand<span class="caret"></span></a>
                    <ul class="dropdown-menu dropright ">
                        <%
                            BrandDao brDao = new BrandDao();
                            ResultSet allBrand = brDao.getAll();
                            while (allBrand.next()) {
                                out.println("  <li><a tabindex='-1' href='list.jsp?type=brand&value=" + allBrand.getString(1) + "'> " + allBrand.getString(2) + "</a></li>");
                            }
                        %>
                        <li class="dropdown-submenu">

                        </li>
                    </ul>
                </li>
                <li class="dropdown-submenu">
                    <a class="test" tabindex="-1" href="#">Supplier<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%
                            SupplierDAO supDao = new SupplierDAO();
                            ResultSet allSup = supDao.getAll();
                            while (allSup.next()) {
                                out.println("  <li><a tabindex='-1' href='list.jsp?type=supppier&value=" + allSup.getString(1) + "'> " + allSup.getString(2) + "</a></li>");
                            }
                        %>
                        <li class="dropdown-submenu">

                        </li>
                    </ul>
                </li>
                <li class="dropdown-submenu">
                    <a class="test" tabindex="-1" href="#">Pet Type<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%
                            out.println("<li><a tabindex='-1' href='?type=pettype&value=Dog'>Dog</a></li>");
                            out.println("<li><a tabindex='-1' href='?type=pettype&value=Cat'>Cat</a></li>");
                            out.println("<li><a tabindex='-1' href='?type=pettype&value=All'>All Purpose</a></li>");
                        %>
                        <li class="dropdown-submenu">

                        </li>
                    </ul>
                </li>
            </ul>

        </div>
        <div class="col col-md-3 col-sm-3" >
            <form class="active-pink-3 active-pink-4 h-120 " style="margin-left: 100px;width: 300px; ">
                <input name="txtSearch"  class="form-control" type="text" placeholder="Search" aria-label="Search">
            </form>
        </div>
    </div>
</div>
<div class="container-fluid mt-0">
    <div class="row text-center padding" style="margin-left: 170px" >
        <c:forEach var="row" items="${p.rows}">
            <sql:query dataSource="${conn}" var="i"
                       sql="select * from image where pID=?">

                <sql:param value="${row.pID}"/>
            </sql:query>

            <div class="col-xs-12 col-sm-6 col-md-3 boder  ml-5 mb-4 mt-0" style="background: rgba(245,169,188, 0.3);">
                <div>
                    <div >
                        <p class="text text-primary" style="font-size: 20px; font: bold">
                            <c:out value="${row.pName}"/>
                        </p>
                    </div>
                    <div><h4>
                        Price:   <c:out value="${row.price}" /></h4>
                    </div>

                    <c:forEach var="img" items="${i.rows}" begin="0" end="0">
                        <a  href="productDetail.jsp?pID=${row.pID}" >
                            <img src="../../${img.imageName}" height="85%" width="85%" alt="Error"/>
                        </a>
                    </c:forEach>
                    <div class="overlay">
                        <!--<a href="./../../CartController?id=${row.pID}&quantity=1" class="btn btn-info btn-lg">-->
                        <%
                            String url = request.getRequestURI();
                            // System.out.println(url);
                        %>
                        <a href="./../../CartController?id=${row.pID}&quantity=1&url=<%= url%>" class="btn btn-info btn-lg">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart
                        </a>
                    </div>
                </div>
            </div>



        </c:forEach>
    </div>
</div>

</body>
<script>
    $(document).ready(function () {
        $('.dropdown-submenu a.test').on("click", function (e) {
            $(this).next('ul').toggle();
            e.stopPropagation();
            e.preventDefault();
        });
    });
</script>
<%
    tDao.closeConn();
    supDao.closeConn();
    brDao.closeConn();
%>
</html>