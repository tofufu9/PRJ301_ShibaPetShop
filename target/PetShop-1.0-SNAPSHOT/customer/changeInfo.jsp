<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="model.entity.Customer"%>
<%@page import="model.DAO.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
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
    <title>Change Information</title>
</head>
<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        background-color: rgba(255, 1, 1, 0.1)
    }

    .card {
        border: none;
        border-radius: 0;
        width: 420px !important;
        margin: 0 auto
    }

    .signup {
        display: flex;
        flex-flow: column;
        justify-content: center;
        padding: 10px 50px
    }

    a {
        text-decoration: none !important
    }

    h5 {
        color: #ff0147;
        margin-bottom: 3px;
        font-weight: bold
    }

    small {
        color: rgba(0, 0, 0, 0.3)
    }

    input {
        width: 100%;
        display: block;
        margin-bottom: 7px
    }

    .form-control {
        border: 1px solid #dc354575;
        border-radius: 30px;
        background-color: rgba(0, 0, 0, .075);
        letter-spacing: 1px
    }

    .form-control:focus {
        border: 0.5px solid #dc354575;
        border-radius: 30px;
        box-shadow: none;
        background-color: rgba(0, 0, 0, .075);
        color: #000;
        letter-spacing: 1px
    }

    .btn {
        display: block;
        width: 100%;
        border-radius: 30px;
        border: none;
        background: linear-gradient(to right, rgba(249, 0, 104, 1) 0%, rgba(247, 117, 24, 1) 100%);
        background: -webkit-linear-gradient(left, rgba(249, 0, 104, 1) 0%, rgba(247, 117, 24, 1) 100%)
    }

    .text-left {
        color: rgba(0, 0, 0, 0.3);
        font-weight: 400
    }

    .text-right {
        color: #ff0147;
        font-weight: bold
    }

    span.text-center {
        color: rgba(0, 0, 0, 0.3)
    }

    .fab {
        padding: 15px;
        font-size: 23px
    }

    .fa-facebook {
        color: #71dd8a;
    }

    .fa-twitter {
        color: #71dd8a;
    }

    .fa-linkedin {
        color: #18b1c0;
    }

    /* BASIC */

    html {
        background-color: #92A8D1;
    }

    body {
        background-color: #92A8D1;
        position: relative;
        background-size: cover;
        font-family: "Poppins", sans-serif;
        height: 100vh;
    }

    a {
        color: #92A8D1;
        display:inline-block;
        text-decoration: none;
        font-weight: 400;
    }

    h2 {
        text-align: center;
        font-size: 16px;
        font-weight: 600;
        text-transform: uppercase;
        display:inline-block;
        margin: 40px 8px 10px 8px;
        color: #cccccc;
    }



    /* STRUCTURE */

    .wrapper {
        display: flex;
        align-items: center;
        flex-direction: column;
        justify-content: center;
        width: 100%;
        min-height: 100%;
        padding: 20px;
    }

    #formContent {
        -webkit-border-radius: 10px 10px 10px 10px;
        border-radius: 10px 10px 10px 10px;
        background: #fff;
        padding: 30px;
        width: 90%;
        max-width: 450px;
        position: relative;
        padding: 0px;
        -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
        box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
        text-align: center;
    }

    #formFooter {
        background-color: #f6f6f6;
        border-top: 1px solid #dce8f1;
        padding: 25px;
        text-align: center;
        -webkit-border-radius: 0 0 10px 10px;
        border-radius: 0 0 10px 10px;
    }



    /* TABS */

    h2.inactive {
        color: #cccccc;
    }

    h2.active {
        color: #0d0d0d;
        border-bottom: 2px solid #5fbae9;
    }



    /* FORM TYPOGRAPHY*/

    input[type=button], input[type=submit], input[type=reset]  {
        background-color: #56baed;
        border: none;
        color: white;
        padding: 15px 80px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        text-transform: uppercase;
        font-size: 13px;
        -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
        box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
        margin: 5px 20px 40px 20px;
        -webkit-transition: all 0.3s ease-in-out;
        -moz-transition: all 0.3s ease-in-out;
        -ms-transition: all 0.3s ease-in-out;
        -o-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
    }

    input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
        background-color: #39ace7;
    }

    input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
        -moz-transform: scale(0.95);
        -webkit-transform: scale(0.95);
        -o-transform: scale(0.95);
        -ms-transform: scale(0.95);
        transform: scale(0.95);
    }

    input[type=text] {
        background-color: #f6f6f6;
        border: none;
        color: #0d0d0d;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 5px;
        width: 85%;
        border: 2px solid #f6f6f6;
        -webkit-transition: all 0.5s ease-in-out;
        -moz-transition: all 0.5s ease-in-out;
        -ms-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
    }

    input[type=text]:focus {
        background-color: #fff;
        border-bottom: 2px solid #5fbae9;
    }

    input[type=text]::placeholder {
        color: #cccccc;
    }


    input[type=password] {
        background-color: #f6f6f6;
        border: none;
        color: #0d0d0d;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 5px;
        width: 85%;
        border: 2px solid #f6f6f6;
        -webkit-transition: all 0.5s ease-in-out;
        -moz-transition: all 0.5s ease-in-out;
        -ms-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
    }

    input[type=password]:focus {
        background-color: #fff;
        border-bottom: 2px solid #5fbae9;
    }

    input[type=password]::placeholder {
        color: #cccccc;
    }




    /* ANIMATIONS */

    /* Simple CSS3 Fade-in-down Animation */
    .fadeInDown {
        -webkit-animation-name: fadeInDown;
        animation-name: fadeInDown;
        -webkit-animation-duration: 1s;
        animation-duration: 1s;
        -webkit-animation-fill-mode: both;
        animation-fill-mode: both;
    }

    @-webkit-keyframes fadeInDown {
        0% {
            opacity: 0;
            -webkit-transform: translate3d(0, -100%, 0);
            transform: translate3d(0, -100%, 0);
        }
        100% {
            opacity: 1;
            -webkit-transform: none;
            transform: none;
        }
    }

    @keyframes fadeInDown {
        0% {
            opacity: 0;
            -webkit-transform: translate3d(0, -100%, 0);
            transform: translate3d(0, -100%, 0);
        }
        100% {
            opacity: 1;
            -webkit-transform: none;
            transform: none;
        }
    }

    /* Simple CSS3 Fade-in Animation */
    @-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
    @-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
    @keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

    .fadeIn {
        opacity:0;
        -webkit-animation:fadeIn ease-in 1;
        -moz-animation:fadeIn ease-in 1;
        animation:fadeIn ease-in 1;

        -webkit-animation-fill-mode:forwards;
        -moz-animation-fill-mode:forwards;
        animation-fill-mode:forwards;

        -webkit-animation-duration:1s;
        -moz-animation-duration:1s;
        animation-duration:1s;
    }

    .fadeIn.first {
        -webkit-animation-delay: 0.4s;
        -moz-animation-delay: 0.4s;
        animation-delay: 0.4s;
    }

    .fadeIn.second {
        -webkit-animation-delay: 0.6s;
        -moz-animation-delay: 0.6s;
        animation-delay: 0.6s;
    }

    .fadeIn.third {
        -webkit-animation-delay: 0.8s;
        -moz-animation-delay: 0.8s;
        animation-delay: 0.8s;
    }

    .fadeIn.fourth {
        -webkit-animation-delay: 1s;
        -moz-animation-delay: 1s;
        animation-delay: 1s;
    }

    /* Simple CSS3 Fade-in Animation */
    .underlineHover:after {
        display: block;
        left: 0;
        bottom: -10px;
        width: 0;
        height: 2px;
        background-color: #56baed;
        content: "";
        transition: width 0.2s;
    }

    .underlineHover:hover {
        color: #0d0d0d;
    }

    .underlineHover:hover:after{
        width: 100%;
    }



    /* OTHERS */

    *:focus {
        outline: none;
    }

    #icon {
        width:60%;
    }
    .mail
    {
        background: #f6f6f6;
        padding: 15px 32px;
        position: relative;

        left: 17px;

        border: none;
        animation-delay: 0.6s;
        text-align: center;
        display: inline-block;
        border-radius: 4px;
    }

    .hai{
        left: 20px;
        background: #f6f6f6;
        padding: 15px 32px;
        position: relative;

        left: 17px;
        text-align: center;
        border: none ;
        border-radius: 4px;

    }
    .gender{
        left: 20px;
        background: #f6f6f6;
        padding: 15px 32px;
        position: relative;

        left: 17px;
        text-align: center;
        border: none ;
        border-radius: 4px;
    }

</style>
<body>
<%-- kiem tra xem khach hang da dang nhap chua --%>
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


%>

<%--Show cac infor cua nguoi dung ra va cho nguoi dung chinh sua thong tin neu muon --%>
<div class="wrapper fadeInDown">
    <div id="formContent">

        <div class="fadeIn first">
            <img src="../images/logolog.png"  id="icon" alt="User Icon" />
        </div>

        <form action="./../ChangeInforCustomer" method="POST">

            <input  class="fadeIn second" type="hidden" name="txtID" value="<%= c.getcID()%>">
            <input  class="fadeIn second" type="hidden" name="txtPassword" value="<%= c.getcPassword()%>">
            <input  class="fadeIn second" type="hidden" name="txtStatus" value="<%= c.getStatus()%>">
            <input  class="fadeIn second" required="" type="text"  name="txtName" value="<%= c.getcName()%>">
            <input  class="fadeIn second" required="" type="text" name="txtUser" value="<%= c.getcUsername()%>">
            <input  class="fadeIn second" required="" type="text" name="txtPhone" value="<%= c.getPhonenumber()%>">
            <input  class="fadeIn second" required="" type="text" name="txtAddress" value="<%= c.getAddress()%>">
            <div class="col-sm-11 col-xs-11">
                <input  class="hai" type="date" name="txtBirthday" value="<%= c.getBirthday()%>">
            </div>
            <div class="col-sm-11 col-xs-11">
                <div class="input-group">
                    <input  class="mail" required="" type="email" name="txtEmail" value="<%= c.getEmail()%>">
                </div>
            </div>
            <div class="col-sm-11 col-xs-11">
                <div class="input-group">
                    <select  class="gender" name="txtGender" value="<%=c.getGender()%>" >
                        <option class="fadeIn second" value="Male">Male</option>
                        <option class="fadeIn second" value="Female">Female</option>
                        <option class="fadeIn second" value="Other">Other</option>
                    </select>
                </div>
            </div>

            <div id="formFooter">
                <button type="submit" class="btn btn-secondary" value="Update" name="btnChange">Update</button>
            </div>
        </form>


    </div>
</div>

<%
    cDao.closeConn();
%>
</body>
</html>
