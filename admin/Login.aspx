<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="logserv.admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGOSERV Login</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="../../assets/media/image/favicon.png" />

    <!-- Plugin styles -->
    <link rel="stylesheet" href="../../vendors/bundle.css" type="text/css" />

    <!-- App styles -->
    <link rel="stylesheet" href="../../assets/css/app.min.css" type="text/css" />
    <style type="text/css">
        .btn-block {
            width: 62px;
        }
    </style>
</head>
<body class="form-membership">
    <form id="form1" runat="server">
        <div>
            <!-- begin::preloader-->
            <div class="preloader">
                <div class="preloader-icon"></div>
            </div>
            <!-- end::preloader -->

            <div class="form-wrapper">

                <!-- logo -->
                <div id="logo">
                    <p style="font-size: large"><b>RIVERS STATE LOCAL GOVERNMENT SERVICE COMMISSION</b></p>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    <%--<img class="logo" src="../../assets/media/image/logo.png" alt="image" />
                    <img class="logo-dark" src="../../assets/media/image/logo-dark.png" alt="image" />--%>
                </div>
                <!-- ./ logo -->

                <h5>Sign in</h5>

                <!-- form -->
                <%--<form>--%>
                <div class="form-group">
                    <input runat="server" id="txtusername" type="text" class="form-control" placeholder="Username or email" />
                    <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtusername" ErrorMessage="Please enter your username!" SetFocusOnError="True" EnableClientScript="False" ForeColor="red" />
                </div>
                <div class="form-group">
                    <input runat="server" id="txtpsw" type="password" class="form-control" placeholder="Password" required="required" />
                    <asp:RequiredFieldValidator runat="server" ID="reqpassword" ControlToValidate="txtpsw" ErrorMessage="Please enter your password!" SetFocusOnError="True" EnableClientScript="False" ForeColor="Red" />
                </div>
                <div class="form-group d-flex justify-content-between">
                    <div class="custom-control custom-checkbox">
                        <%--<input type="checkbox" class="custom-control-input" checked="" id="customCheck1" />--%>
                        <label class="custom-control-label" for="customCheck1">Remember me</label>
                    </div>
                    <a href="#">Reset password</a>
                </div>
                <button runat="server" id="btnLogin" class="btn btn-primary btn-block" onserverclick="LoginBtn_Click">Sign in</button>
                <%-- <hr>--%>
                <%-- <p class="text-muted">Login with your social media account.</p>--%>
                <%--    <ul class="list-inline">
                        <li class="list-inline-item">
                            <a href="#" class="btn btn-floating btn-facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#" class="btn btn-floating btn-twitter">
                                <i class="fa fa-twitter"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#" class="btn btn-floating btn-dribbble">
                                <i class="fa fa-dribbble"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#" class="btn btn-floating btn-linkedin">
                                <i class="fa fa-linkedin"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#" class="btn btn-floating btn-google">
                                <i class="fa fa-google"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#" class="btn btn-floating btn-behance">
                                <i class="fa fa-behance"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#" class="btn btn-floating btn-instagram">
                                <i class="fa fa-instagram"></i>
                            </a>
                        </li>
                    </ul>--%>
                <hr />
                <p class="text-muted" style="visibility: hidden">Don't have an account?</p>
                <a href="register.html" class="btn btn-outline-light btn-sm" style="visibility: hidden">Register now!</a>
                <%--</form>--%>
                <!-- ./ form -->
            </div>
        </div>
    </form>
    <!-- Plugin scripts -->
    <script src="../../vendors/bundle.js"></script>

    <!-- App scripts -->
    <script src="../../assets/js/app.min.js"></script>
</body>
</html>
