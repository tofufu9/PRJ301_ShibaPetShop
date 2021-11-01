<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="model.entity.Bill"%>
<%@page import="model.entity.Products"%>
<%@page import="model.DAO.BillDetailDAO"%>
<%@page import="model.DAO.BillDAO"%>
<%@page import="model.DAO.ImageDAO"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
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
    <title>List Bill </title>

    <style>
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
            background: #92A8D1;
            line-height: 46px;
        }

        .scroll-to-top:focus,
        .scroll-to-top:hover {
            color: white;
        }

        .scroll-to-top:hover {
            background: #92A8D1;
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

        .searchbar {
            margin-bottom: auto;
            margin-top: auto;
            height: 60px;
            background-color: #92A8D1;
            border-radius: 30px;
            padding: 10px;
        }

        .search_input {
            color: white;
            border: 0;
            outline: 0;
            background: none;
            width: 0;
            caret-color: transparent;
            line-height: 40px;
            transition: width 0.4s linear;
        }

        .searchbar:hover>.search_input {
            padding: 0 10px;
            width: 450px;
            caret-color: red;
            transition: width 0.4s linear;
        }

        .searchbar:hover>.search_icon {
            background: white;
            color: #e74c3c;
        }

        .search_icon {
            height: 40px;
            width: 40px;
            float: right;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            color: white;
            text-decoration: none;
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
<body id="page-top" class="">
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1 fas" href="../../dashboard.jsp">
        <h3>Shiba Pet Shop</h3>
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
    <ul class="sidebar navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="../../dashboard.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>

        <li class="nav-item active">
            <a class="nav-link" href="../bill/listbill.jsp">
                <i class="fas fa-fw fa-user"></i>
                <span>Bill</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="../customer/listcustomer.jsp">
                <i class="fas fa-fw fa-book"></i>
                <span>List Customer</span></a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="../product/listproducts.jsp" id="pagesDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                <li class="breadcrumb-item active">Bills</li>

            </ol>

            <!-- DataTables Example -->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-user"></i>
                    List Bills</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12 col-md-6">
                                    <div class="container h-100">
                                        <div class="d-flex justify-content-center h-100">
                                            <div class="searchbar">
                                                <input class="search_input" type="text" name=""
                                                       placeholder="Search...">
                                                <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table class="table table-bordered dataTable" id="dataTable" width="100%"
                                           cellspacing="0" role="grid" aria-describedby="dataTable_info"
                                           style="width: 100%;">
                                        <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th style="width: 200px">Name</th>
                                            <th>Image</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <%

                                            BillDetailDAO bdDao = new BillDetailDAO(); // goi class billdetail dao
                                            ResultSet rs = bdDao.getBillDetail(Integer.parseInt(request.getParameter("id")));
                                            BillDAO bDao = new BillDAO();
                                            Bill b = bDao.getBill(Integer.parseInt(request.getParameter("id")));
                                            ProductsDAO pDao = new ProductsDAO();
                                            ImageDAO iDao = new ImageDAO();
                                            double total = 0;
                                            int i = 1;
                                            while (rs.next()) {
                                                Products p = pDao.getProduct(rs.getInt(2));

                                                ResultSet rsImg = iDao.getImage(rs.getInt("pID"));

                                                out.print("<tr>");
                                                out.print("<td>" + i++ + "</td>");
                                                out.print("<td>" + p.getpName() + "</td>");
                                                out.print("<td>");
                                                while (rsImg.next()) { // cho vong lap de hien in ra tu data
                                                    out.print("<img class='zoom' src='../../" + rsImg.getString("imageName") + "' height='200px' width='200px' />");//hien thi hinh anh
                                                    break;
                                                }
                                                out.print("</td>");

                                                out.print("<td>" + rs.getInt(3) + "</td>"); // ley gia tri cua cot 3
                                                out.print("<td>" + rs.getInt(4) + "</td>"); // lay gia tri cot 4
                                                out.print(" </tr>");
                                            }
                                        %>
                                        </tbody>

                                        <button style="background: #F5A9BC">  <a style="text-decoration: none;" href="listbill.jsp">BACK</a> </button>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<%
    bDao.closeConn();
    bdDao.closeConn();
    pDao.closeConn();
    iDao.closeConn();

%>
</body>


</html>