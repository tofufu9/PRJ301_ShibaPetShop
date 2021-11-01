<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="model.DAO.CustomerDAO"%>
<%@page import="model.DAO.CommentDAO"%>
<%@page import="model.DAO.SupplierDAO"%>
<%@page import="model.DAO.BrandDao"%>
<%@page import="model.entity.Brand"%>
<%@page import="model.DAO.TypeDAO"%>
<%@page import="model.entity.Products"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%--<%@page import="model.DAO.ImageDAO"%>--%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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
    <style>
        @import url('https://fonts.google.com/specimen/Balsamiq+Sans');

        .dropdown
        {
            float:  right;
            padding-left: 20px;
        }
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
        .delete{
            padding-left:  30px;

        }
        .zoom:hover{
            transform: scale(1.5);
        }
        .image {
            transition: all 1s ease;
            -webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
        }

        .image:hover {
            transform: scale(3,3);
            -webkit-transform: scale(3,3);
            -moz-transform: scale(3,3);
            -o-transform: scale(3,3);
            -ms-transform: scale(3,3);
        }

    </style>

</head>
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
                <!--<button type="button" class="btn btn-primary  btn-sm" data-dismiss="modal">Close</button>-->
                <button type="button" class="btn btn-primary  btn-sm" data-dismiss="modal" onclick="reload(<%=   request.getParameter("pID") %>)" >Close</button>
                <script>
                    function reload(pId) {
                        location.href = "productDetail.jsp?pID="+ pId
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

<%
    int pID = Integer.parseInt(request.getParameter("pID"));
    ProductsDAO pDao = new ProductsDAO();
    Products p = pDao.getProduct(pID);
    int quantity = p.getQuantity();
%>
<sql:setDataSource var="conn" scope="session"
                   url="jdbc:mysql://localhost/petshop"
                   user="root" password=""
                   driver="com.mysql.jdbc.Driver"/>

<sql:query var="images" dataSource="${conn}">
    SELECT * FROM image where pID=?
    <sql:param value="${param.pID}"/>
</sql:query>
<main class="">
    <div class="container dark-grey-text ">
        <div class="row wow fadeIn">
            <div class="col-md-6 mb-4 p-4">
                <c:forEach var="img" items="${images.rows}" begin="0" end="0">
                    <img src="../../${img.imageName}" class="img-fluid img-thumbnail" alt=""/>
                </c:forEach>
            </div>
            <div class="col-md-6 mb-1">
                <div class="p-1">
                    <div class="mb-1">
                        <a href="">
                            <!--<span class="  purple mr-1"><%= p.gettID()%></span>-->
                            <%
                                TypeDAO tDao = new TypeDAO();
                                String type = tDao.getType(p.gettID());
                            %>
                            <span class=" " style="font-size: 35px">#<%=type%></span>
                        </a>
                        <br>

                        <%
                            if (quantity > 0) {
                                out.print("<span class='  blue mr-1' style='font-size:30px'>Status: On sale</span>");
                            } else {
                                out.print("<span class='  blue mr-1' style='font-size:30px'>Status: Stop sale</span>");
                            }
                        %>

                    </div>
                    <p>
                        <%
                            BrandDao brDao = new BrandDao();
                            String brand = brDao.getBrand(p.getBrID());
                        %>
                        <span class='  blue mr-1' style='font-size:25px'> Brand: <%= brand%></span>
                        <%
                            SupplierDAO supDao = new SupplierDAO();
                            String sup = supDao.getSupplier(p.getSupID());
                        %>
                        <span class='  blue mr-1' style='font-size:25px'>  Supplier:   <%= sup%> </span>
                    </p>
                    <p class="lead">
                        <span  class='  blue mr-1' style='font-size:30px; color: sienna'>Price: <%= p.getPrice()%></span>
                    </p>
                    <p>
                        <span  class='  blue mr-1' style='font-size:25px'>Discount:  <%= p.getDiscount()%>% </span>
                    </p>
                    <p>
                        <span  class='  blue mr-1' style='font-size:25px'>Pet Type:   <%= p.getPetType()%> </span>
                    </p>
                    <p>
                        <span  class='  blue mr-1' style='font-size:25px'>- Quantity:   <%= p.getQuantity()%> </span>
                    </p>
                    <%
                        String url = request.getRequestURI();
                        // System.out.println(url);
                    %>
                    <p class="lead font-weight-bold"  style='font-size:35px; color: darkred' ><%= p.getpName()%></p>
                    <form class="d-flex justify-content-left" action="../../CartController">
                        <input type="hidden" value="${param.pID}" name="id"/>
                        <input type="hidden" value="<%= url%>" name="url"/>
                        <input type="number" value="1" aria-label="Search" class="form-control" name="quantity" min="0" max="<%=p.getQuantity()%>" style="width: 100px">
                        <button class="btn btn-primary btn-md my-0 p" type="submit">Add to cart
                        </button>

                    </form>

                </div>
            </div>
            <div class="container-fluid padding" style="position: relative; top: -100px; left: 25px">
                <div class="row text-center padding">
                    <div  class="col-xs-4 col-sm-4 col-md-4 boder bg-light ">

                        <c:forEach var="img" items="${images.rows}">

                            <img   src="../../${img.imageName}" height="80px" width="80px" class="image img-thumbnail" alt="Error"/>

                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="row d-flex justify-content-center wow fadeIn">
        <div class="col-md-6 text-center">
            <h4 class="my-4 h2">Describe</h4>
            <h4><%= p.getDescrible()%> </h4>
        </div>
    </div>

    <hr>

    <div class="row d-flex justify-content-center wow fadeIn">
        <div class="col-md-6 text-center">
            <h4 class="my-4 h2">Comment</h4>
        </div>

        <%
            CommentDAO cDao = new CommentDAO();
            CustomerDAO cus = new CustomerDAO();
            ResultSet rs = cDao.getCommentbyProduct(pID);

            if (rs == null) {
                out.print("Product don't have any comment !");
            } else {
                while (rs.next()) {
                    int cID = rs.getInt(3);

                    cus.getCustomer(cID);
                    String name = cus.getCustomer(cID).getcUsername();


        %>
        <div class="col-sm-8  mb-4">
            <div class="row">
                <div class="">
                    <p style="font-size: 28px" ><%= name%></p>
                </div>
                <div class="w3-padding w3-xlarge col-md-6">
                    <%

                        for (Cookie c : cookies) {
                            if (c.getName().equals("idCustomer") && Integer.parseInt(c.getValue()) == cID) {
                                out.print("<a class='material-icons' name='Del' href='../../CommentController?cmtID=" + rs.getInt(1) + "&pID=" + pID + "'>  delete  </a>");
                            }
                        }
                    %>

                </div>
                <div class="col-md-12">
                    <p>
                        <%= rs.getString(4)%>
                    </p>

                </div>
            </div>
        </div>
        <% }
        }%>
        <div class="col-sm-8 col-md-8">

            <form action="../../CommentController" method="POST">
                <input type="hidden" value="<%= pID%>" name="pID"/>
                <div class="">
                    <div class="panel-heading">
                        <strong style="font-size: 22px" >Your comment</strong>
                    </div>
                    <div class="panel-body px-4">
                        <textarea style="height: 100px; width: 100%" name="message" ></textarea>
                    </div>
                    <div class="panel-body px-4 ">
                        <input type="submit" value="Send" name="btnComment"/>
                    </div>
                </div>
            </form>
        </div>

    </div>

    </div>
    <div>
        <br>

    </div>
</main>
<%
    brDao.closeConn();
    cDao.closeConn();
    cus.closeConn();
    tDao.closeConn();
    supDao.closeConn();
    pDao.closeConn();

%>
</body>
</html>
