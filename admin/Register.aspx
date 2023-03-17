<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="logserv.admin.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Staff Registration</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="../../assets/media/image/favicon.png" />

    <!-- Dropzone -->
    <link href="../vendors/dropzone/dropzone.css" rel="stylesheet" />
    <link href="../Scripts/dropzone/basic.min.css" rel="stylesheet" />
    <%--<link href="../Scripts/dropzone/dropzone.css" rel="stylesheet" />--%>

    <!-- Main css -->
    <link rel="stylesheet" href="../../vendors/bundle.css" type="text/css" />

    <!-- Slick -->
    <link rel="stylesheet" href="../../vendors/slick/slick.css" type="text/css" />
    <link rel="stylesheet" href="../../vendors/slick/slick-theme.css" type="text/css" />

    <!-- Daterangepicker -->
    <link href="../vendors/datepicker/daterangepicker.css" rel="stylesheet" />

    <!-- DataTable -->
    <link rel="stylesheet" href="../../vendors/dataTable/datatables.min.css" type="text/css" />

    <!-- App css -->
    <link rel="stylesheet" href="../../assets/css/app.min.css" type="text/css" />

    <!-- Other css -->
    <link href="../Scripts/css/style.css" rel="stylesheet" />

    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>--%>

    <%-- SCRIPT FOR REGISTRATION STARTS--%>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/logoserv.js"></script>
    <script src="../vendors/jquery/jquery-ui.min.js"></script>
    <%-- SCRIPT FOR REGISTRATION ENDS--%>

    <!-- Toast examples -->    
    <script src="../assets/js/examples/toast.js"></script>
    <script>
        function showContent(msg, typeofmsg) {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "progressBar": true,
                "preventDuplicates": false,
                "positionClass": "toast-top-center",
                "showDuration": "400",
                "hideDuration": "1000",
                "timeOut": "7000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            toastr[typeofmsg](msg);

        }

        /* FOR MODAL POPUP*/
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }

        /* FOR MODAL POPUP*/
        function ShowPopup2(title, body) {
            $("#MyPopup2 .modal-title").html(title);
            $("#MyPopup2 .modal-body").html(body);
            $("#MyPopup2").modal("show");
        }
    </script>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="horizontal-navigation">
    <form id="form1" runat="server">
        <div>

            <!-- Preloader -->
            <div class="preloader">
                <div class="preloader-icon"></div>
            </div>
            <!-- ./ Preloader -->

            <!-- Sidebar group -->
            
            <!-- ./ Sidebar group -->

            <!-- Layout wrapper -->
            <div class="layout-wrapper">

                <!-- Header -->
                <div class="header d-print-none bg-facebook">
                    <div class="header-container">
                        <div class="header-left">
                            <div class="navigation-toggler">
                                <a href="#" data-action="navigation-toggler">
                                    <i data-feather="menu"></i>
                                </a>
                            </div>

                            <div class="header-logo">
                                <a href="home.aspx">
                                    <img class="logo" src="../assets/media/image/logo.png" />
                                </a>
                            </div>
                        </div>

                         <div class="header-body">
                            <div class="header-body-left">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <div class="header-search-form">
                                            <%--<form>--%>
                                                <%--<div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <button class="btn">
                                                            <i data-feather="search"></i>
                                                        </button>
                                                    </div>
                                                    <input type="text" class="form-control" placeholder="Search" />
                                                    <div class="input-group-append">
                                                        <button class="btn header-search-close-btn">
                                                            <i data-feather="x"></i>
                                                        </button>
                                                    </div>
                                                </div>--%>
                                            <%--</form>--%>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a href="#" class="nav-link" title="Actions" data-toggle="dropdown">
                                            <i data-feather="plus-circle"></i>
                                        </a>
                                        <div class="dropdown-menu">
                                            <a href="register.aspx" class="dropdown-item">Add Staff</a>
                                            <%--<a href="#" class="dropdown-item">Add Category</a>
                                            <a href="#" class="dropdown-item">Add Report</a>--%>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <div class="header-body-right">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a href="#" class="nav-link mobile-header-search-btn" title="Search">
                                            <i data-feather="search"></i>
                                        </a>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a href="#" class="nav-link" title="Fullscreen" data-toggle="fullscreen">
                                            <i class="maximize" data-feather="maximize"></i>
                                            <i class="minimize" data-feather="minimize"></i>
                                        </a>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" title="User menu" data-toggle="dropdown">
                                            <figure class="avatar avatar-sm">
                                                <img id="userimg" runat="server" src="null" class="rounded-circle"
                                                    alt="avatar" />
                                            </figure>
                                            <span class="ml-2 d-sm-inline d-none">
                                                <asp:Label ID="lblusername" runat="server" Text="User Name"></asp:Label></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-big">
                                            <div class="text-center py-4" data-background-image="../userimages/bgimage.jpg">
                                                <figure class="avatar avatar-lg mb-3 border-0">
                                                    <img id="userimg2" runat="server" src="null" class="rounded-circle" alt="image" />
                                                </figure>
                                                <h5 class="mb-0">
                                                    <asp:Label ID="lblprofilename" runat="server" Text="Profile Name"></asp:Label></h5>
                                            </div>
                                            <div class="list-group list-group-flush">
                                                <%--<a href="#" class="list-group-item">Profile</a>--%>
                                                <%--<a href="#" class="list-group-item" data-sidebar-target="#settings">Settings</a>--%>
                                                <asp:LinkButton ID="lnksignout" runat="server" CssClass="list-group-item text-danger" OnClick ="Usersignout">Sign Out!</asp:LinkButton>
                                                <%--<a href="#" class="list-group-item text-danger" data-sidebar-target="#settings">Sign Out!</a>--%>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item header-toggler">
                                <a href="#" class="nav-link">
                                    <i data-feather="arrow-down"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- ./ Header -->

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- begin::navigation -->
                    <div class="navigation">
                        <div class="navigation-menu-body">
                            <ul>
                                <li>
                                    <a href="home.aspx">
                                        <span class="nav-link-icon">
                                            <i data-feather="home"></i>
                                        </span>
                                        <span>Home</span>
                                    </a>                                   
                                </li>
                                
                                <li>
                                    <a href="#">
                                        <span class="nav-link-icon">
                                            <i data-feather="users"></i>
                                        </span>
                                        <span>Staff</span>
                                    </a>
                                    <ul>
                                        <li><a class="active" href="#">Register Staff</a></li>
                                        <li><a href="promotion-entry.aspx">Record Promotion</a></li>
                                        <li><a href="retirement-entry.aspx">Record Retirement</a></li>
                                        <li><a href="Upload.aspx">Upload Documents</a></li>
                                        <li><a href="death-entry.aspx">Record Death</a></li>
                                        <li><a href="transfer-entry.aspx">Record Transfer</a></li>
                                        <%--<li><a href="lock-screen.html" target="_blank">Lock Screen</a></li>--%>
                                    </ul>
                                </li>

                                <li>
                                    <a href="#">
                                        <span class="nav-link-icon">
                                            <i data-feather="bar-chart"></i>
                                        </span>
                                        <span>Reports</span>
                                    </a>
                                    <ul>
                                        <li><a href="staff.aspx">Staff list</a></li>
                                        <li><a href="promotion.aspx">Promotion</a></li>
                                        <li><a href="transfer.aspx">Transfers</a></li>
                                        <li><a href="retirement.aspx">Retirements</a></li>
                                        <li><a href="death.aspx">Deaths</a></li> 
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="nav-link-icon">
                                            <i data-feather="check-square"></i>
                                        </span>
                                        <span>Staff Confirmation</span>
                                    </a>
                                    <ul>
                                        <li><a href="confirmed.aspx">Confirmed Staff</a></li>
                                        <li><a href="confirmation.aspx">Unconfirmed Staff</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- end::navigation -->

                    <!-- Content body -->
                    <div class="content-body">
                        <!-- Content -->
                        <div class="content">

                            <div class="page-header">
                                <div>
                                    <h3>Staff Registration</h3>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="home.aspx">Home</a>
                                            </li>
                                            <li class="breadcrumb-item">Staff
                                            </li>
                                            <li class="breadcrumb-item active" aria-current="page">Staff Registration</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">

                                    <div class="card">
                                        

                                        <div class="card-body">
                                            <%-- <h6 class="card-title">Content Title</h6>--%>
                                            <ul class="nav nav-tabs mb-3" role="tablist">
                                                <li class="nav-item" id="1tab">
                                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                                        aria-controls="home" aria-selected="true">Staff Personal Information</a>
                                                </li>
                                                <li class="nav-item" id="2tab">
                                                    <a runat="server" class="nav-link" id="profiletab" data-toggle="tab" href="#profile" role="tab"
                                                        aria-controls="profile" aria-selected="false">Staff Appointment</a>
                                                </li>
                                                <%--<li class="nav-item" id="3tab">
                                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab"
                                                        aria-controls="contact" aria-selected="false">Contact</a>
                                                </li>--%>
                                            </ul>
                                            <div class="tab-content">

                                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <div class="profile-images-card">
                                                                    <div class="profile-images">
                                                                        <img src="../assets/media/image/profile.png" id="upload-img" />
                                                                    </div>
                                                                    <div class="custom-file">
                                                                        <label for="fileupload">Upload Profile Picture</label>
                                                                        <asp:FileUpload ID="fileupload" runat="server" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                                            <div class="form-group">
                                                                <label>File No.</label>
                                                                <input id="txtfileno" runat="server" type="text" class="form-control" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Surname</label>
                                                                <input runat="server" id="txtsurname" type="text" class="form-control" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Firstname</label>
                                                                <input runat="server" id="txtfirstname" type="text" class="form-control" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Middlename</label>
                                                                <input runat="server" id="txtmiddlename" type="text" class="form-control" />
                                                            </div>
                                                             <div class="form-group">
                                                                <label>E-mail</label>
                                                                <input runat="server" id="txtemail" type="text" class="form-control" />
                                                            </div>
                                                            <div class="form-group" id="generalgenderdiv">
                                                                <p>Select Gender</p>
                                                                <div class="custom-control custom-radio custom-control-inline">
                                                                    <input type="radio" runat="server" id="maleRadio" name="genderRadio" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="maleRadio">Male</label>
                                                                </div>
                                                                <div id="genderdiv" class="custom-control custom-radio custom-control-inline">
                                                                    <input type="radio" runat="server" id="femaleRadio" name="genderRadio" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="femaleRadio">Female</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Phone Number</label>
                                                                <input runat="server" id="txtphone" type="text" class="form-control" required="required" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Qualification</label>
                                                                <input runat="server" id="txtqualification" type="text" class="form-control" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Home Address</label>
                                                                <input runat="server" id="txtaddress" type="text" class="form-control" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="StateSelect">State of Origin</label>
                                                                <select runat="server" class="form-control" id="StateSelect">
                                                                    <option value="selected" selected="selected">- Select -</option>
                                                                    <option value="Abuja FCT">Abuja FCT</option>
                                                                    <option value="Abia">Abia</option>
                                                                    <option value="Adamawa">Adamawa</option>
                                                                    <option value="Akwa Ibom">Akwa Ibom</option>
                                                                    <option value="Anambra">Anambra</option>
                                                                    <option value="Bauchi">Bauchi</option>
                                                                    <option value="Bayelsa">Bayelsa</option>
                                                                    <option value="Benue">Benue</option>
                                                                    <option value="Borno">Borno</option>
                                                                    <option value="Cross River">Cross River</option>
                                                                    <option value="Delta">Delta</option>
                                                                    <option value="Ebonyi">Ebonyi</option>
                                                                    <option value="Edo">Edo</option>
                                                                    <option value="Ekiti">Ekiti</option>
                                                                    <option value="Enugu">Enugu</option>
                                                                    <option value="Gombe">Gombe</option>
                                                                    <option value="Imo">Imo</option>
                                                                    <option value="Jigawa">Jigawa</option>
                                                                    <option value="Kaduna">Kaduna</option>
                                                                    <option value="Kano">Kano</option>
                                                                    <option value="Katsina">Katsina</option>
                                                                    <option value="Kebbi">Kebbi</option>
                                                                    <option value="Kogi">Kogi</option>
                                                                    <option value="Kwara">Kwara</option>
                                                                    <option value="Lagos">Lagos</option>
                                                                    <option value="Nassarawa">Nassarawa</option>
                                                                    <option value="Niger">Niger</option>
                                                                    <option value="Ogun">Ogun</option>
                                                                    <option value="Ondo">Ondo</option>
                                                                    <option value="Osun">Osun</option>
                                                                    <option value="Oyo">Oyo</option>
                                                                    <option value="Plateau">Plateau</option>
                                                                    <option value="Rivers">Rivers</option>
                                                                    <option value="Sokoto">Sokoto</option>
                                                                    <option value="Taraba">Taraba</option>
                                                                    <option value="Yobe">Yobe</option>
                                                                    <option value="Zamfara">Zamfara</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label runat="server" for="LGASelect">L.G.A of Origin</label>
                                                                <select class="form-control" id="LGASelect" runat="server"></select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Date of Birth</label>
                                                                <input type="text" name="daterangepicker" runat="server" id="daterangepicker" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a class="btn btn-primary" id="lnkContinue" href="javascript:;" style="color: #FFFFFF">Continue</a>
                                                </div>

                                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                                    <div class="col-md-6">
                                                        <br />
                                                        <div class="form-group">
                                                            <h4>
                                                                <%--<label>Staff File No:&nbsp;</label>--%>
                                                                <asp:Label ID="lblfileno" runat="server" Text="No file No." ForeColor="#999999"></asp:Label>
                                                            </h4>
                                                        </div>
                                                        <div class="form-group">
                                                            <h4>
                                                                <%--<label>Staff Full Name:&nbsp;</label>--%>
                                                                <asp:Label ID="lblfullname" runat="server" Text="No Name" ForeColor="#999999"></asp:Label>
                                                                <br />
                                                            </h4>
                                                        </div>
                                                        <hr class="line1" />
                                                        <br />
                                                        <br />
                                                        <div class="form-group">
                                                            <label>Enter Grade Level</label>
                                                            <input runat="server" id="txtgrade" type="text" class="form-control" required="required" />
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Date of Appointment</label>
                                                            <input type="text" name="dateofappointment" runat="server" id="dateofappointment" class="form-control" />
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="RiversLGAselect">Select Serving L.G.A</label>
                                                            <select runat="server" class="form-control" id="RiversLGAselect">
                                                                <option value="selected" selected="selected" aria-required="true">- Select LGA -</option>
                                                                <option value="Port Harcourt">Port Harcourt</option>
                                                                <option value="Obio-Akpor">Obio-Akpor</option>
                                                                <option value="Okrika">Okrika</option>
                                                                <option value="Ogu–Bolo">Ogu–Bolo</option>
                                                                <option value="Eleme">Eleme</option>
                                                                <option value="Tai">Tai</option>
                                                                <option value="Gokana">Gokana</option>
                                                                <option value="Khana">Khana</option>
                                                                <option value="Oyigbo">Oyigbo</option>
                                                                <option value="Opobo–Nkoro">Opobo–Nkoro</option>
                                                                <option value="Andoni">Andoni</option>
                                                                <option value="Bonny">Bonny</option>
                                                                <option value="Degema">Degema</option>
                                                                <option value="Asari-Toru">Asari-Toru</option>
                                                                <option value="Akuku-Toru">Akuku-Toru</option>
                                                                <option value="Abua–Odual">Abua–Odual</option>
                                                                <option value="Ahoada West">Ahoada West</option>
                                                                <option value="Ahoada East">Ahoada East</option>
                                                                <option value="Ogba–Egbema–Ndoni">Ogba–Egbema–Ndoni</option>
                                                                <option value="Emohua">Emohua</option>
                                                                <option value="Ikwerre">Ikwerre</option>
                                                                <option value="Etche">Etche</option>
                                                                <option value="Omuma">Omuma</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <span><a runat="server" class="btn btn-outline-info" id="lnkback" href="javascript:;">Back</a></span>
                                                    <%--<span><button type="button" id="btnsubmit" runat="server" class="btn btn-info" onclick="Btnsubmit_Click">Click Here to Submit</button></span>--%>
                                                    <span>
                                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" OnClick="Btnsubmit_Click" Text="Submit" /></span>
                                                </div>

                                                <%--<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                                    Lorem ipsum dolor sit amet
                                                </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ./ Content -->

                        <!-- Modal Popup for Reg Confirmation-->
                        <div id="MyPopup" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-dialog-centered">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="background-color: #DFF4DF">
                                        <h4 class="modal-title"></h4>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" runat="server" id="btnNo" class="btn btn-danger" data-dismiss="modal" onserverclick="ClearControls">No</button>

                                        <asp:Button ID="btnYes" CssClass="btn btn-success" runat="server" Text="Yes" OnClick="DocUploadRedirect" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Popup -->

                         <!-- Modal Popup for Reg Confirmation-->
                        <div id="MyPopup2" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-dialog-centered">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header" style="background-color: #DFF4DF">
                                        <h4 class="modal-title"></h4>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" id="Button2" class="btn btn-success" data-dismiss="modal" onserverclick="ClearControls">Ok</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Popup -->

                        <!-- Footer -->
                        <footer class="content-footer">
                            <div>© 2021 LOGOSERV  <%--<a href="http://logoserv.com" target="_blank">LOGOSERV</a>--%></div>
                            <%--<div>
                                <nav class="nav">
                                    <a href="https://themeforest.net/licenses/standard" class="nav-link">Licenses</a>
                                    <a href="#" class="nav-link">Change Log</a>
                                    <a href="#" class="nav-link">Get Help</a>
                                </nav>
                            </div>--%>
                        </footer>
                        <!-- ./ Footer -->
                    </div>

                    <!-- ./ Content body -->
                </div>
                <!-- ./ Content wrapper -->
            </div>
            <!-- ./ Layout wrapper -->

            <!-- Main scripts -->
            <script src="../../vendors/bundle.js"></script>

            <!-- To use theme colors with Javascript -->
            <div class="colors">
                <div class="bg-primary"></div>
                <div class="bg-primary-bright"></div>
                <div class="bg-secondary"></div>
                <div class="bg-secondary-bright"></div>
                <div class="bg-info"></div>
                <div class="bg-info-bright"></div>
                <div class="bg-success"></div>
                <div class="bg-success-bright"></div>
                <div class="bg-danger"></div>
                <div class="bg-danger-bright"></div>
                <div class="bg-warning"></div>
                <div class="bg-warning-bright"></div>
            </div>
        </div>
    </form>
    <!-- Apex chart -->
    <script src="https://apexcharts.com/samples/assets/irregular-data-series.js"></script>
    <script src="../../vendors/charts/apex/apexcharts.min.js"></script>

    <!-- DataTable -->
    <script src="../../vendors/dataTable/datatables.min.js"></script>

    <!-- Vamp -->
    <script src="../../vendors/vmap/jquery.vmap.min.js"></script>
    <script src="../../vendors/vmap/maps/jquery.vmap.usa.js"></script>
    <script src="../../assets/js/examples/vmap.js"></script>

    <!-- Dashboard scripts -->
    <script src="../../assets/js/examples/pages/ecommerce-dashboard.js"></script>

    <!-- App scripts -->
    <script src="../../assets/js/app.min.js"></script>

    <!-- Dropzone -->
    <%--<script src="../vendors/dropzone/dropzone.js"></script>--%>
    <script src="../Scripts/dropzone/dropzone.min.js"></script>

    <!-- Datepicker -->
    <script src="../vendors/datepicker/daterangepicker.js"></script>
    <script src="../../assets/js/examples/datepicker.js"></script>

    <script>
        $('input[name="dateofappointment"]').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true
        });
    </script>

    

</body>
</html>
