<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 11:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>

    <style>
        body {
            background: url('../images/back.jpg') fixed;
            background-size: cover;
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
    </style>
</head>
<body>

<div class="container">
    <form class="form-horizontal" role="form" action="./../AccountController" method="POST" name="register">
        <h2>Registration</h2>

        <div class="form-group">
            <label for="firstName" class="col-sm-3 control-label">Full Name</label>
            <div class="col-sm-9">
                <input type="text" id="fullName" name="cName" required="Please enter your name" placeholder="Full Name" class="form-control" autofocus>
            </div>
        </div>

        <div class="form-group">
            <label for="lastName" class="col-sm-3 control-label">User Name</label>
            <div class="col-sm-9">
                <input type="text" id="userName" name="cUsername"placeholder="User Name" class="form-control" autofocus>
            </div>
        </div>



        <div class="form-group">
            <label for="password" class="col-sm-3 control-label">Password*</label>
            <div class="col-sm-9">
                <input type="password" id="password" required="Password can not be empty" name="cPassword" placeholder="Password" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-3 control-label">Confirm Password*</label>
            <div class="col-sm-9">
                <input type="password" id="cofirm-password" name="rePass" placeholder="Password" class="form-control">
            </div>
        </div>


        <div class="form-group">
            <label for="phoneNumber" class="col-sm-3 control-label">Phone number </label>
            <div class="col-sm-9">
                <input type="phoneNumber" name="cPhonenumber"id="phoneNumber" name="cPhonenumber"placeholder="Phone number" class="form-control">
                <span class="help-block">Phone numbers must be true </span>
            </div>
        </div>

        <div class="form-group">
            <label for="address" class="col-sm-3 control-label">Address</label>
            <div class="col-sm-9">
                <input type="text" id="userName" name="address"placeholder="Address" class="form-control" autofocus>
            </div>
        </div>


        <div class="form-group">
            <label for="birthDate" class="col-sm-3 control-label">Date of Birth*</label>
            <div class="col-sm-9">
                <input type="date" name="birthday" required="Please enter date of birth" id="birthDate" class="form-control">
            </div>
        </div>

        <div class="form-group">
            <label for="eMail" class="col-sm-3 control-label">Email*</label>
            <div class="col-sm-9">
                <input type="email" name="email" required="Please enter email" id="eMail" class="form-control " placeholder="Input Email">
            </div>
        </div>



        <div class="form-group" >
            <label for="eMail" class="col-sm-3 control-label">Gender</label>
            <div  class="col-sm-9 ">
                <select name="gender" >
                    <option style="color: #F6CEEC" class="Sex" value="Male">Male</option>
                    <option style="color: #F6CEEC"  class="Sex" value="Female">Female</option>
                    <option style="color: #F6CEEC" class="Sex" value="Other">Other</option>
                </select>
            </div>

        </div>

        <button type="submit" class="btn btn-primary btn-block" id="btnSignIn" name="btnSignIn">Register</button>
    </form>
</div>
<a href="login.jsp">LOGIN</a>

<script>
    var inputs = document.forms['register'].getElementsByTagName('input');
    var run_onchange = false;
    function valid() {
        var errors = false;
        var reg_mail = /^[A-Za-z0-9]+([_\.\-]?[A-Za-z0-9])*@[A-Za-z0-9]+([\.\-]?[A-Za-z0-9]+)*(\.[A-Za-z]+)+$/;
        for (var i = 0; i < inputs.length; i++) {
            var value = inputs[i].value;
            var id = inputs[i].getAttribute('id');

            // T???o ph???n t??? span l??u th??ng tin l???i
            var span = document.createElement('span');
            // N???u span ???? t???n t???i th?? remove
            var p = inputs[i].parentNode;
            if (p.lastChild.nodeName == 'SPAN') {
                p.removeChild(p.lastChild);
            }

            // Ki???m tra r???ng
            if (value == '') {
                span.innerHTML = 'Th??ng tin ???????c y??u c???u';
            } else {
                // Ki???m tra c??c tr?????ng h???p kh??c
                if (id == 'eMail') {
                    if (reg_mail.test(value) == false) {
                        span.innerHTML = 'Email kh??ng h???p l??? (v?? d???: abc@gmail.com)';
                    }
                    var email = value;
                }

                // Ki???m tra password
                if (id == 'password') {
                    if (value.length < 6) {
                        span.innerHTML = 'Password ph???i t??? 6 k?? t???';
                    }
                    var pass = value;
                }
                // Ki???m tra password nh???p l???i
                if (id == 'cofirm-password' && value != pass) {
                    span.innerHTML = 'Password nh???p l???i ch??a ????ng';
                }
                // Ki???m tra s??? ??i???n tho???i
                if (id == 'phoneNumber' && isNaN(value) == true) {
                    span.innerHTML = 'S??? ??i???n tho???i ph???i l?? ki???u s???';
                }
            }

            // N???u c?? l???i th?? ch??n span v??o h??? s??, ch???y onchange, submit return false, highlight border
            if (span.innerHTML != '') {
                inputs[i].parentNode.appendChild(span);
                errors = true;
                run_onchange = true;
                inputs[i].style.border = '1px solid #c6807b';
                inputs[i].style.background = '#fffcf9';
            }
        }// end for

        if (errors == false) {
            alert('????ng k?? th??nh c??ng');
        }
        return !errors;
    }// end valid()

    // Ch???y h??m ki???m tra valid()
    var register = document.getElementById('btnSignIn');
    register.onclick = function () {
        return valid();
    }

    // Ki???m tra l???i v???i s??? ki???n onchange -> g???i l???i h??m valid()
    for (var i = 0; i < inputs.length; i++) {
        var id = inputs[i].getAttribute('id');
        inputs[i].onchange = function () {
            if (run_onchange == true) {
                this.style.border = '1px solid #999';
                this.style.background = '#fff';
                valid();
            }
        }
    }// end for;
</script>
</body>
</html>

