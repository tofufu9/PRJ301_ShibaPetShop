<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Change Password</title>
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
            background: linear-gradient(to right, rgba(0, 210, 255, 1) 0%, rgba(58, 123, 213, 1) 100%);
            background: -webkit-linear-gradient(left, rgba(58, 123, 213, 1) 0%, rgba(0, 210, 255, 1) 100%);
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
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto py-4 px-0">
            <div class="card p-0">
                <div class="card-title text-center">
                    <h5 class="mt-5">CHANGE PASSWORD</h5> <small class="para">Please fill in the form</small>
                </div>


                <form class="signup" action="./../ChangeInforCustomer" method="POST" onSubmit = "return checkPassword(this)" id="register" name="register">
                    <div class="form-group">
                        <input placeholder="Old Password" class="form-control" type="password" name="Oldpass" id="Oldpass" required="">
                    </div>

                    <div class="form-group">
                        <input placeholder="New password"  class="form-control"  type="password" name="newPass" id="newPass" required="">
                        <button type="button" id="btnToggle" class="toggle"onclick="myFunction()"><i id="eyeIcon" class="fa fa-fw fa-eye field-icon toggle-password"></i></button>
                    </div>
                    <div class="form-group">
                        <input placeholder="Confirmpass" class="form-control"  type="password" name="Confirmpass" id="Confirmpass" required="">
                        <button type="button" id="btnToggle" class="toggle" onclick="myFunction1()"><i id="eyeIcon" class="fa fa-fw fa-eye field-icon toggle-password"></i></button>
                    </div>

                    <input type="submit" value="Change Password" name="btnChangePass" class="btn btn-primary">


                </form>
                <%-- script thuc hien show password --%>
                <script>
                    function myFunction() {
                        var x = document.getElementById("newPass");
                        if (x.type === "password") {
                            x.type = "text";
                            icon.classList.add("fa-eye-slash");
                        } else {
                            x.type = "password";
                            icon.classList.remove("fa-eye-slash");
                        }
                    }
                    function myFunction1() {
                        var x = document.getElementById("Confirmpass");
                        if (x.type === "password") {
                            x.type = "text";
                            icon.classList.add("fa-eye-slash");
                        } else {
                            x.type = "password";
                            icon.classList.remove("fa-eye-slash");
                        }
                    }
                </script>
                <%-- Bat loi password --%>
                <script>
                    function checkPassword(form) {
                        password1 = form.newPass.value;
                        password2 = form.Cofirmpass.value;

                        // If password not entered
                        if (password1 == '')
                            alert("Please enter Password");

                        // If confirm password not entered
                        else if (password2.length < 6)
                        {
                            alert("Password must be length > 6");
                            return false;
                        } else if (password2 == '')
                        {
                            alert("Please enter confirm password");
                            return  false;
                        }

                        // If Not same return False.
                        else if (password1 != password2) {
                            alert("\nPassword did not match: Please try again...");
                            return false;
                        }

                        // If same return True.
                        else {
                            alert("Change password succcessful");
                            return true;
                        }
                    }
                </script>
            </div>
        </div>
    </div>
</div>
</body>
</html>
