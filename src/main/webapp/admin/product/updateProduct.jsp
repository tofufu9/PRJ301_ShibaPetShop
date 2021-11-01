<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DAO.BrandDao"%>
<%@page import="model.DAO.SupplierDAO"%>
<%@page import="model.DAO.TypeDAO"%>
<%@page import="java.util.Date"%>
<%@page import="model.entity.Products"%>
<%--<%@page import="model.DAO.ImageDAO"%>--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.ProductsDAO"%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .input-group{
            padding-bottom: 30px;
        }
        html {
            position: relative;
            min-height: 100%;
        }

        body {
            height: 100%;
        }

        #wrapper {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
        }

        #wrapper #content-wrapper {
            overflow-x: hidden;
            width: 100%;
            padding-top: 1rem;
            padding-bottom: 80px;
        }

        body.fixed-nav #content-wrapper {
            margin-top: 56px;
            padding-left: 90px;
        }

        body.fixed-nav.sidebar-toggled #content-wrapper {
            padding-left: 0;
        }

        @media (min-width: 768px) {
            body.fixed-nav #content-wrapper {
                padding-left: 225px;
            }

            body.fixed-nav.sidebar-toggled #content-wrapper {
                padding-left: 90px;
            }
        }

        .scroll-to-top {
            position: fixed;
            right: 15px;
            bottom: 15px;
            display: none;
            width: 50px;
            height: 50px;
            text-align: center;
            color: #fff;
            background: #F5A9BC;
            line-height: 46px;
        }

        .scroll-to-top:focus,
        .scroll-to-top:hover {
            color: white;
        }

        .scroll-to-top:hover {
            background: #F5A9BC;
        }

        .scroll-to-top i {
            font-weight: 800;
        }

        .smaller {
            font-size: 0.7rem;
        }

        .o-hidden {
            overflow: hidden !important;
        }

        .z-0 {
            z-index: 0;
        }

        .z-1 {
            z-index: 1;
        }

        .navbar-nav .form-inline .input-group {
            width: 100%;
        }

        .navbar-nav .nav-item.active .nav-link {
            color: #fff;
        }

        .navbar-nav .nav-item.dropdown .dropdown-toggle::after {
            width: 1rem;
            text-align: center;
            float: right;
            vertical-align: 0;
            border: 0;
            font-weight: 900;
            content: '\f105';
            font-family: 'Font Awesome 5 Free';
        }

        .navbar-nav .nav-item.dropdown.show .dropdown-toggle::after {
            content: '\f107';
        }

        .navbar-nav .nav-item.dropdown.no-arrow .dropdown-toggle::after {
            display: none;
        }

        .navbar-nav .nav-item .nav-link:focus {
            outline: none;
        }

        .navbar-nav .nav-item .nav-link .badge {
            position: absolute;
            margin-left: 0.75rem;
            top: 0.3rem;
            font-weight: 400;
            font-size: 0.5rem;
        }

        @media (min-width: 768px) {
            .navbar-nav .form-inline .input-group {
                width: auto;
            }
        }
        .searchbar{
            margin-bottom: auto;
            margin-top: auto;
            height: 60px;
            background-color: #92A8D1;
            border-radius: 30px;
            padding: 10px;
        }

        .search_input{
            color: white;
            border: 0;
            outline: 0;
            background: none;
            width: 0;
            caret-color:transparent;
            line-height: 40px;
            transition: width 0.4s linear;
        }

        .searchbar:hover > .search_input{
            padding: 0 10px;
            width: 450px;
            caret-color:red;
            transition: width 0.4s linear;
        }

        .searchbar:hover > .search_icon{
            background: white;
            color: #e74c3c;
        }

        .search_icon{
            height: 40px;
            width: 40px;
            float: right;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            color:white;
            text-decoration:none;
        }
        .sidebar {
            width: 90px !important;
            background-color: #92A8D1;
            min-height: calc(100vh - 56px);
        }

        .sidebar .nav-item:last-child {
            margin-bottom: 1rem;
        }

        .sidebar .nav-item .nav-link {
            text-align: center;
            padding: 0.75rem 1rem;
            width: 90px;
        }

        .sidebar .nav-item .nav-link span {
            font-size: 0.65rem;
            display: block;
        }

        .sidebar .nav-item .dropdown-menu {
            position: absolute !important;
            -webkit-transform: none !important;
            transform: none !important;
            left: calc(90px + 0.5rem) !important;
            margin: 0;
        }

        .sidebar .nav-item .dropdown-menu.dropup {
            bottom: 0;
            top: auto !important;
        }

        .sidebar .nav-item.dropdown .dropdown-toggle::after {
            display: none;
        }

        .sidebar .nav-item .nav-link {
            color: #212529;
        }

        .sidebar .nav-item .nav-link:active,
        .sidebar .nav-item .nav-link:focus,
        .sidebar .nav-item .nav-link:hover {
            color: #cccccc;
        }

        .sidebar.toggled {
            width: 0 !important;
            overflow: hidden;
        }

        @media (min-width: 768px) {
            .sidebar {
                width: 225px !important;
            }

            .sidebar .nav-item .nav-link {
                display: block;
                width: 100%;
                text-align: left;
                padding: 1rem;
                width: 225px;
            }

            .sidebar .nav-item .nav-link span {
                font-size: 1rem;
                display: inline;
            }

            .sidebar .nav-item .dropdown-menu {
                position: static !important;
                margin: 0 1rem;
                top: 0;
            }

            .sidebar .nav-item.dropdown .dropdown-toggle::after {
                display: block;
            }

            .sidebar.toggled {
                overflow: visible;
                width: 90px !important;
            }

            .sidebar.toggled .nav-item:last-child {
                margin-bottom: 1rem;
            }

            .sidebar.toggled .nav-item .nav-link {
                text-align: center;
                padding: 0.75rem 1rem;
                width: 90px;
            }

            .sidebar.toggled .nav-item .nav-link span {
                font-size: 0.65rem;
                display: block;
            }

            .sidebar.toggled .nav-item .dropdown-menu {
                position: absolute !important;
                -webkit-transform: none !important;
                transform: none !important;
                left: calc(90px + 0.5rem) !important;
                margin: 0;
            }

            .sidebar.toggled .nav-item .dropdown-menu.dropup {
                bottom: 0;
                top: auto !important;
            }

            .sidebar.toggled .nav-item.dropdown .dropdown-toggle::after {
                display: none;
            }
        }

        .sidebar.fixed-top {
            top: 56px;
            height: calc(100vh - 56px);
            overflow-y: auto;
        }

        .card-body-icon {
            position: absolute;
            z-index: 0;
            top: -1.25rem;
            right: -1rem;
            opacity: 0.4;
            font-size: 5rem;
            -webkit-transform: rotate(15deg);
            transform: rotate(15deg);
        }

        @media (min-width: 576px) {
            .card-columns {
                -webkit-column-count: 1;
                column-count: 1;
            }
        }

        @media (min-width: 768px) {
            .card-columns {
                -webkit-column-count: 2;
                column-count: 2;
            }

            .bg-dark {
                background-color: #343a40 !important;
            }
        }
    </style>
</head>
<%! int tID = 0;
    int brID = 0;
    int supID = 0;
%>
<%
    int id = 0, status = 0;
    int quantity = 0;
    String pName = "", description = "", pettype = "";
    Double sellingPrice = 0.0, price = 0.0;
    float discount = 0;
    Date pDate = null;
    ProductsDAO pDao = new ProductsDAO();
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));

        Products p = pDao.getProduct(id);
        status = p.getSpID();
        brID = p.getBrID();
        tID = p.gettID();
        supID = p.getSupID();
        pName = p.getpName();
        sellingPrice = p.getSellingPrice();
        price = p.getPrice();
        description = p.getDescrible();
        pDate = p.getpDate();
        quantity = p.getQuantity();
        discount = p.getDiscount();
        pettype = p.getPetType();
    }
%>

<body id="page-top" class="">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <a class="navbar-brand mr-1 fas" href="../../home.jsp">
        <h3>Clothing</h3>
    </a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">

    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow mx-1"></li>
        <li class="nav-item dropdown no-arrow mx-1"></li>

        <!-- LOGOUT-->
        <li class="nav-item dropdown no-arrow  ">
            <a class="nav-link dropdown-toggle " href="#" id="userDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <h3><i class="fas fa-user-circle fa-fw"></i></h3>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="../../AdminLogoutController">Logout</a>
            </div>
        </li>
    </ul>

</nav>

<div id="wrapper">


    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="../../dashboard.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <li class="nav-item ">
            <a class="nav-link" href="account.jsp">
                <i class="fas fa-fw fa-user"></i>
                <span>Account</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="../customer/listcustomer.jsp">
                <i class="fas fa-fw fa-book"></i>
                <span>List Customer</span></a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="../product/listproducts.jsp" id="pagesDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-box-open"></i>
                <span>Product</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                <a class="dropdown-item" href="../product/listproducts.jsp">List Products</a>
                <a class="dropdown-item" href="../product/insertProduct.jsp">Insert Products</a>

            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../comment/listcomment.jsp">
                <i class="fas fa-fw fa-book"></i>
                <span>List Comment</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../supplier/supplierlist.jsp">
                <i class="fas fa-fw fa-book"></i>
                <span>Supplier</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../other/list.jsp">
                <i class="fas fa-fw fa-book"></i>
                <span>Other</span></a>
        </li>



    </ul>

    <div id="content-wrapper">

        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="index.jsp">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Products</li>

            </ol>

            <!-- DataTables Example -->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-user"></i>
                    Update Bill</div>
                <div class="card-body">
                    <div class="table-responsive">

                        <tbody>
                        <form action="../../ProductController" method="post">
                            <input value="<%= id%>" type="hidden" name="pID">
                            <div class="contact-form">
                                <div class="row">
                                    <div class="col-sm-6 col-xs-12">
                                        <div>Product's name</div>
                                        <div class="input-group">

                                            <input value="<%= pName%>" class="form-control" autofocus=""
                                                   required=" " name="pName">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div>Type</div>
                                        <div class="input-group">
                                            <select name="tID" class="form-control" autofocus="">
                                                <%
                                                    TypeDAO tDao = new TypeDAO();
                                                    ResultSet allType = tDao.getAll();
                                                    while (allType.next()) {
                                                        System.out.println(tID);
                                                        System.out.println(allType.getInt(1));
                                                        if (tID == allType.getInt(1)) {

                                                            out.println("<option value=" + allType.getInt(1) + " selected>" + allType.getString(2) + "</option>");
                                                        } else {
                                                            out.println("<option value=" + allType.getInt(1) + ">" + allType.getString(2) + "</option>");
                                                        }
                                                    }
                                                %>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div>Supplier</div>
                                        <div class="input-group">
                                            <select name="supID" class="form-control" autofocus="">
                                                <%
                                                    SupplierDAO supDao = new SupplierDAO();
                                                    ResultSet allSup = supDao.getAll();
                                                    while (allSup.next()) {
                                                        System.out.println(supID);
                                                        System.out.println(allSup.getInt(1));
                                                        if (supID == allSup.getInt(1)) {

                                                            out.println("<option value=" + allSup.getInt(1) + " selected>" + allSup.getString(2) + "</option>");
                                                        } else {
                                                            out.println("<option value=" + allSup.getInt(1) + ">" + allSup.getString(2) + "</option>");
                                                        }
                                                    }
                                                %>
                                                <!--                                                        <input value="<%= supID%>" class="form-control" autofocus=""
                                                         required=" " name="supID">-->
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div>Brand</div>
                                        <div class="input-group">
                                            <select name="brID" class="form-control" autofocus="">
                                                <%
                                                    BrandDao brDao = new BrandDao();
                                                    ResultSet allRrand = brDao.getAll();
                                                    while (allRrand.next()) {
                                                        System.out.println(brID);
                                                        System.out.println(allRrand.getInt(1));
                                                        if (brID == allRrand.getInt(1)) {

                                                            out.println("<option value=" + allRrand.getInt(1) + " selected>" + allRrand.getString(2) + "</option>");
                                                        } else {
                                                            out.println("<option value=" + allRrand.getInt(1) + ">" + allRrand.getString(2) + "</option>");
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div>Saleprice</div>
                                        <div class="input-group">

                                            <input value="<%= sellingPrice%>" class="form-control" autofocus="" type="number" min="0"
                                                   required=" " name="sellingPrice">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div>Price</div>
                                        <div class="input-group">

                                            <input value="<%= price%>" class="form-control" autofocus="" type="number" min="0"
                                                   required=" " name="price">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div>Description</div>
                                        <div class="input-group">

                                            <input value="<%= description%>" class="form-control" autofocus=""
                                                   required=" " name="describle">
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-xs-12">
                                        <div>Date</div>
                                        <div class="input-group">
                                            <input value="<%= pDate%>" type="date" class="form-control"
                                                   autofocus="" required=" " name="pDate">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div>Quantity</div>
                                        <div class="input-group">
                                            <input value="<%= quantity%>"  class="form-control"  type="number" min="0"
                                                   autofocus="" required=" " name="quantity">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div>Discount</div>
                                        <div class="input-group">
                                            <input value="<%= discount%>"  class="form-control" type="number" min="0" max="100"
                                                   autofocus="" required=" " name="discount">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-xs-12">
                                        <div>Gender</div>
                                        <div class="input-group">
                                            <select name="gender" value="<%= pettype%>">
                                                <option value="Dog">Dog</option>
                                                <option value="Cat">Cat</option>
                                                <option value="All">All Purpose</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-sm-12 col-xs-12">
                                        <div>Submit</div>
                                        <div class="input-group">
                                            <input type="submit" value="UPDATE" name="btnUpdate">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>

                        </tbody>



                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<%
    brDao.closeConn();
    tDao.closeConn();
    supDao.closeConn();
    pDao.closeConn();

%>
</body>


</html>