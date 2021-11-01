<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 11:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="model.entity.Products"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.DAO.SupplierDAO"%>
<%@page import="model.DAO.BrandDao"%>
<%@page import="model.DAO.TypeDAO"%>
<%@page import="model.DAO.ImageDAO"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <link href="https://fonts.googleapis.com/css2?family=Pangolin&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>-->

    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"></script>

    <script>
        $(document).ready(function () {

            $('#example').dataTable({
                "aoColumnDefs": [
                    {'bSortable': false, 'aTargets': [3, 4, 5, 10, 14]}
                ]
            }); // dòng này để nhúng bảng biểu thành dạng bảng được phân trang

        });
    </script>
    <script>
        function myFunction(id) {
            var person = confirm("Are you sure to Recycle ?");
            if (person) {
                location.href = "../../Change?pID=" + id;
            }
        }
    </script>
    <title>List Products </title>
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
            color:#212529;
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
        .btn{
            background: #92A8D1;
            opacity: 0.7;
            color: #000
        }
        #icon{
            border-radius: 40px;
            width: 70px;
            margin-left: 10px
        }
        #bestsale{
            font-weight: bold;
            width: 150px;

        }
        #listAll{
            color: #000;
            background: #92A8D1;
            margin-left: 30px
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

            .zoom:hover {
                transform: scale(1.5);
            }
        }
    </style>
</head>
<body id="page-top" class="">
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <a class="navbar-brand mr-1 fas" href="../../home.jsp">
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

        <li class="nav-item ">
            <a class="nav-link" href="../bill/listbill.jsp">
                <i class="fas fa-fw fa-user"></i>
                <span>Bill</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="../customer/listcustomer.jsp">
                <i class="fas fa-fw fa-book"></i>
                <span>List Customer</span></a>
        </li>
        <li class="nav-item dropdown active">
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
                    <a href="../../dashboard.jsp">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Products</li>

            </ol>

            <!-- DataTables Example -->
            <div class="card ">
                <div class="card-header mb-3 row">
                    <div class="col col-md-3 col-sm-3">
                        <i class="fas fa-user"> List Products</i>

                    </div>

                    <div class='col col-md-3 col-sm-3'>
                        <button  id="bestsale" class="btn btn-primary"><a style="color: #000" href='listproducts.jsp'>
                            List All</a>
                        </button>
                    </div>

                </div>

                <div class="card-body">

                    <div class="table-responsive table-hover">
                        <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">






                            <div class='col col-md-5 col-sm-5 ml-5' >

                                <%
                                    //                                                ProductsDAO pDao = new ProductsDAO();
                                    ResultSet rs = null;
                                    ProductsDAO pDao = new ProductsDAO();
                                    rs = pDao.getDelete();


                                %>
                            </div>
                        </div>

                        <table id="example"  class="table table-bordered dataTable" id="dataTable" width="100%"
                               cellspacing="0" role="grid" aria-describedby="dataTable_info"
                               style="width: 100%;">
                            <thead>
                            <tr>
                                <th style="width: 20px">ID</th>
                                <th style="width: 40px">Product's name</th>
                                <th>Image</th>
                                <th>Brand Products</th>
                                <th>Type Products</th>
                                <th>Supplier </th>
                                <th>Saleprice</th>
                                <th>Price</th>
                                <th>Describle</th>
                                <th>Date</th>
                                <th>Quantity</th>
                                <th>Discount</th>
                                <th>Pet Type</th>
                                <th>Status Product</th>
                                <th></th>

                            </tr>


                            </thead>

                            <tbody>

                            <%                                                //  ResultSet rs = null;
                                BrandDao brDao = new BrandDao();
                                TypeDAO tDao = new TypeDAO();
                                SupplierDAO supDao = new SupplierDAO();
                                while (rs.next()) {

                                    out.print("<tr>");
                                    out.print("<td>" + rs.getInt("pID") + "</td>");
                                    out.print("<td>" + rs.getString("pName") + "</td>");
                                    ImageDAO iDao = new ImageDAO();
                                    ResultSet rsImg = iDao.getImage(rs.getInt("pID"));
                                    out.print("<td>");
                                    while (rsImg.next()) {
                                        out.print("<a href='../../" + rsImg.getString("imageName") + "'> <img class='zoom' src='../../" + rsImg.getString("imageName") + "' height='100px' width='100px' /></a>");
                                    }
                                    out.print("</td>");
                                    iDao.closeConn();
                                    //   BrandDao brDao = new BrandDao();
                                    String brand = brDao.getBrand(rs.getInt("brID"));
                                    out.print("<td>" + brand + "</td>");

                                    //  TypeDAO tDao = new TypeDAO();
                                    String type = tDao.getType(rs.getInt("tID"));
                                    out.print("<td>" + type + "</td>");

                                    //  SupplierDAO supDao = new SupplierDAO();
                                    String sup = supDao.getSupplier(rs.getInt("supID"));
                                    out.print("<td>" + sup + "</td>");
                                    out.print("<td>" + rs.getInt("sellingPrice") + "</td>");
                                    out.print("<td>" + rs.getInt("price") + "</td>");
                                    out.print("<td>" + rs.getString("describle") + "</td>");
                                    out.print("<td>" + rs.getDate("pDate") + "</td>");
                                    out.print("<td>" + rs.getString("quantity") + "</td>");
                                    out.print("<td>" + rs.getString("discount") + "</td>");
                                    out.print("<td>" + rs.getString("pettype") + "</td>");

                                    if (rs.getInt("status") == 1) {
                                        out.println("<td style='color:green; font-weight: bold;' >Valid</td> ");
                                    } else {
                                        out.println("<td style='color:red;font-weight: bold; '>Invalid</td> ");
                                    }
                            %>

                            <td>
                                <button type="button" class="btn btn-link bg-transparent" data-toggle="modal" data-target="#centralModalWarning"> <i class='fa fa-recycle w3-xxlarge' style='color: black; font-size:30px' aria-hidden='true'></i></button>
                            </td>
                            <!-- Central Modal Medium Warning -->
                            <div class="modal fade" id="centralModalWarning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-notify modal-warning" role="document">
                                    <!--Content-->
                                    <div class="modal-content">
                                        <!--Header-->
                                        <div class="modal-header">
                                            <p class="heading lead">Message</p>

                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true" class="white-text">&times;</span>
                                            </button>
                                        </div>

                                        <!--Body-->
                                        <div class="modal-body">
                                            <div class="text-center">
                                                <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                                <p>Do you want to delete</p>
                                            </div>
                                        </div>

                                        <!--Footer-->
                                        <div class="modal-footer justify-content-center">
                                            <a href='../../Change?pID=<%=rs.getInt("pID")%>' class="btn btn-warning">Yes</a>
                                            <a type="button" class="btn btn-outline-warning waves-effect" data-dismiss="modal">No</a>
                                        </div>
                                    </div>
                                    <!--/.Content-->
                                </div>
                            </div>
                            <!-- Central Modal Medium Warning-->


                            <%
                                    out.print("</tr>");
                                }
                            %>
                            </tbody>

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
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<%
    pDao.closeConn();
    tDao.closeConn();
    brDao.closeConn();

    supDao.closeConn();
%>
</body>


</html>


