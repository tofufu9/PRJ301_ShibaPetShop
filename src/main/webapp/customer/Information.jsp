<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="model.DAO.BillDetailDAO"%>
<%@page import="model.entity.Products"%>
<%@page import="model.DAO.ProductsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.BillDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="model.entity.Customer"%>
<%@page import="model.DAO.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <title>Information</title>
</head>
<style>
    body {

        background-size: cover;
        height: 100%;
        background-color: #92A8D1;
    }

    *[role="form"] {
        max-width: 530px;
        padding: 15px;
        margin: 0 auto;
        border-radius: 0.3em;
        background-color: #f2f2f2;
    }

    *[role="form"] h2 {
        font-family: 'Open Sans' , sans-serif;
        font-size: 40px;
        font-weight: 600;
        color: #000000;
        margin-top: 5%;
        text-align: center;
        text-transform: uppercase;
        letter-spacing: 4px;
    .Sex{
        font-family: 'Open Sans' , sans-serif;
        font-size: 40px;
        font-weight: 600;
        width: 200px;
        color: red;
    }
    }
    .input-group{
        padding-bottom: 30px;
    }
    html {
        position: relative;
        min-height: 100%;
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


        a {

            text-decoration: none;
            color: #000;
        }

        .input-group {
            padding-bottom: 30px;
        }

        #p {
            font-size: 25px;
            padding: 5px
        }

        .table-danger td {
            background: #D8D8D8;
            border-radius: 7px;
        }

        button:hover {
            opacity: 0.7;

        }
    }

</style>
<body>
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
    <a class="navbar-brand mr-1 fas" href="../home.jsp">
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

    </ul>

</nav>
<%--
cookie xem nguoi dung da dang nhap chua
--%>
<%
    Cookie[] cookies = request.getCookies();
    int id = 0;
    for (Cookie c : cookies) {
        if (c.getName().equals("idCustomer")) {
            id = Integer.parseInt(c.getValue());
        }
    }
    CustomerDAO cDao = new CustomerDAO();
    Customer c = cDao.getCustomer(id);
    BillDAO bDao = new BillDAO();
    ResultSet bill = bDao.getBillbyCustomer(id);
    ProductsDAO pDao = new ProductsDAO();
    BillDetailDAO bdDao = new BillDetailDAO();
%>
<%-- Show cac thong in cua customer ra  --%>
<h1 style="text-align: center"> Information </h1>
<div class="container">
    <form action="./../ChangeInforCustomer" method="POST">
        <table class="col-sm-10 table table-bordered table-danger table-hover">
            <tr>
                <td>Full name</td>
                <td class="text"><%= c.getcName()%></td>
            </tr>
            <tr>
                <td>User name</td>
                <td><%= c.getcUsername()%></td>
            </tr>
            <tr>
                <td>Phone</td>
                <td><%= c.getPhonenumber()%></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><%= c.getAddress()%> </td>
            </tr>
            <tr>
                <td>BirthDay</td>
                <td> <%= c.getBirthday()%> </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>  <%= c.getEmail()%>  </td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>  <%= c.getGender()%> </td>
            </tr>
            <%-- Cho customer changepassword va change thong tin --%>
        </table>
        <div class="row" style="position: relative ; left: 12px;" >
            <button style=" background: #f2f2f2; " type="button" class="btn btn-outline-danger mr-md-3"><a style="text-decoration: none"  href="changeInfo.jsp">Change Information</a></button>
            <button style=" background: #f2f2f2;" type="button" class="btn btn-outline-danger mr-md-3"><a style="text-decoration: none" href="changePassword.jsp">Change password</a></button>
        </div>
    </form>
    <hr>

    <h1 style="text-align: center"> List bill </h1>
    <div>
        <table class="table table-hover border-primary">
            <tr>
                <th>No.</th>
                <th>Receiver</th>
                <th>Date of purchase</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Status</th>
                <th>List product</th>
                <th>Total</th>
                <th>Note</th>
            </tr>
            <%
                int i = 1;
                while (bill.next()) {
                    out.print("<tr>");
                    out.print("<td> " + i++ + "</td>");
                    out.print("<td> " + bill.getString(4) + "</td>");
                    out.print("<td> " + bill.getDate(5) + "</td>");
                    out.print("<td> " + bill.getString(6) + "</td>");
                    out.print("<td> " + bill.getString(7) + "</td>");
                    out.print("<td> " + bill.getString(3) + "</td>");
                    out.print("<td>");

                    ResultSet billDetail = bdDao.getBillDetail(bill.getInt(1));

                    while (billDetail.next()) {
                        Products p = pDao.getProduct(billDetail.getInt(2));
                        out.print("<p> - " + p.getpName() + "<b> #SL:" + billDetail.getInt(3) + "</b>" + "</p>");

                    }
                    out.print("</td>");
                    out.print("<td> " + bill.getString(9) + "</td>");
                    out.print("<td> " + bill.getString(8) + "</td>");
                    out.print("</tr>");
                }
            %>
        </table>

    </div>
        <%
                    cDao.closeConn();
                    bDao.closeConn();
                    pDao.closeConn();
                    bdDao.closeConn();

                %>
</body>
</html>