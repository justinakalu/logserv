﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload_confirmation.aspx.cs" Inherits="logserv.admin.upload_confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Staff file upload</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="../../assets/media/image/favicon.png" />

    <!-- Dropzone -->
    <link rel="stylesheet" href="../../vendors/dropzone/dropzone.css" type="text/css"/>

    <!-- Main css -->
    <link rel="stylesheet" href="../../vendors/bundle.css" type="text/css" />

    <!-- Slick -->
    <link rel="stylesheet" href="../../vendors/slick/slick.css" type="text/css" />
    <link rel="stylesheet" href="../../vendors/slick/slick-theme.css" type="text/css" />

    <!-- Daterangepicker -->
    <link href="../vendors/datepicker/daterangepicker.css" rel="stylesheet" />    

    <!-- App css -->
    <link rel="stylesheet" href="../../assets/css/app.min.css" type="text/css" />

    <!-- Other css -->
    <link href="../Scripts/css/style.css" rel="stylesheet" />
    <script src="../assets/js/jquery.min.js"></script>    

    <!-- Toast examples -->
    <script src="../../assets/js/examples/toast.js"></script>
   
    <%--FOR FILE UPLOAD--%>
    <script type="text/javascript">       
        $(document).ready(function () {
            Dropzone.autoDiscover = false;
            var myDropzone = new Dropzone("#dZUpload", {
                url: "../FileUploader.ashx",
                autoProcessQueue: false,
                //upload more than 2 files by Dropzone.js with button
                parallelUploads: 12,
                //File size
                maxfilesize: 200,
                //Number of files
                maxFiles: 12,
                addRemoveLinks: true,
                imgName: true,
                success: function (file, response) {
                    var imgName = response;
                    file.previewElement.classList.add("dz-success");
                    console.log("Successfully uploaded :" + imgName);

                    ////Clear textbox to avoid re submission
                    //$("#txtdescription").val("");

                    //Show alert
                    ShowPopup("Success", "Document(s) upload was successful.");
                },
                error: function (file, response) {
                    file.previewElement.classList.add("dz-error");
                    ShowPopup2("Document Error", "There was an error.");
                }
            });

            $('#btnsubmit').on('click', function (e) {
                 myDropzone.processQueue();                
            });
        });

        /* FOR MODAL POPUP*/
        function ShowPopup(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
        }

        /* FOR MODAL POPUP without clearing controls*/
        function ShowPopup2(title, body) {
            $("#MyPopup2 .modal-title").html(title);
            $("#MyPopup2 .modal-body").html(body);
            $("#MyPopup2").modal("show");
        }
    </script>

    <style>
        .divred 
            {
              background-color: #FFAAAA;          
            }
        .divgreen 
            {
            background-color: #00CC00;          
            }
    </style>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="horizontal-navigation">
    <form id="form1" runat="server"> 
        
         <!-- Modal Popup -->
        <div id="MyPopup" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="alert alert-success d-flex align-items-center">
                        <i class="ti-check mr-2" style="color:darkgreen" aria-hidden="true"></i>
                        <h4 class="modal-title">
                        </h4>                        
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        <button type="button" runat="server" id="btnNo" class="btn btn-danger" data-dismiss="modal" onserverclick="ClearControls">Close</button>
                        <%--<button type="button" runat="server" id="btnNo" class="btn btn-danger" data-dismiss="modal" onserverclick="return false">Close</button>--%>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Popup -->

        <!-- Modal Popup2 -->
        <div id="MyPopup2" class="modal fade" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="alert alert-danger d-flex align-items-center">
                        <i class=" ti-hand-open mr-2"></i>
                        <h4 class="modal-title">
                        </h4>                        
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        <button type="button" runat="server" id="Button1" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <%--<button type="button" runat="server" id="btnNo" class="btn btn-danger" data-dismiss="modal" onserverclick="return false">Close</button>--%>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Popup -->


        <div>
            <!-- Preloader -->
            <div class="preloader">
                <div class="preloader-icon"></div>
            </div>
            <!-- ./ Preloader -->

            <!-- Sidebar group -->
                <%--deleted--%>
            <!-- ./ Sidebar group -->

            <!-- Layout wrapper -->
            <div class="layout-wrapper">

                <!-- Header -->
                <div class="header d-print-none bg-facebook">
                    <div class="header-container">
                        <div class="header-left bg-facebook">
                            <div class="navigation-toggler">
                                <a href="#" data-action="navigation-toggler">
                                    <i data-feather="menu"></i>
                                </a>
                            </div>

                            <div class="header-logo">
                                <a href="register.aspx">
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
                        <%--<div class="navigation-menu-body">
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
                                        <li><a href="register.aspx">Register Staff</a></li>
                                        <li><a href="promotion-entry.aspx">Record Promotion</a></li>
                                        <li><a href="retirement-entry.aspx">Record Retirement</a></li>
                                        <li><a class="active" href="#">Upload Documents</a></li>
                                        <li><a href="death-entry.aspx">Record Death</a></li>
                                        <li><a href="transfer-entry.aspx">Record Transfer</a></li>
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
                            </ul>
                        </div>--%>
                    </div>
                    <!-- end::navigation -->

                    <!-- Content body -->
                    <div class="content-body">
                        <!-- Content -->
                        <div class="content">

                            <div class="page-header">
                                <div>
                                    <h3>Staff Confirmation Documents Upload</h3>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="#">Home</a>
                                            </li>
                                            <li class="breadcrumb-item">Staff
                                            </li>
                                            <li class="breadcrumb-item active" aria-current="page">Upload document</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">                                  
                                        <div class="card-body">
                                            <%--Card body starts--%>
                                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                            <%--<div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Staff File No.</label>
                                                        
                                                    </div>
                                                </div>  
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Document description</label>
                                                        <asp:Label ID="lbldescription" runat="server" ForeColor="#999999"></asp:Label>
                                                    </div>
                                                </div>                                                                                              
                                            </div>--%>

                                            <div runat="server" id="staffDiv" data-label="STAFF DETAILS" class="demo-code-preview">
                                               <div class="row">
                                                   <div class="col-md-6">
                                                       <div class="text-center">
                                                            <figure class="avatar avatar-lg mb-3 border-0">
                                                                <asp:Image ID="imgstaff" runat="server" CssClass="rounded-circle" />
                                                            </figure>
                                                            <h5 class="mb-0">
                                                                <asp:Label ID="lblfullname" runat="server" ForeColor="#999999"></asp:Label>
                                                            </h5>
                                                       </div>
                                                   </div>
                                                   <div class="col-md-6">
                                                       <p><span>FILE NO: </span><span style="margin-left: 10px"><asp:Label ID="staffFileNo" runat="server" ForeColor="#999999"></asp:Label></span></p>
                                                       <p><span>QUALIFICATION:</span><span style="margin-left: 10px"><asp:Label ID="lblqualification" runat="server" ForeColor="#999999"></asp:Label></span></p>
                                                   </div>
                                               </div>
                                            </div>

                                            <br /><br />
                                            <div id="dZUpload" class="dropzone" >
                                                <div  class="dz-default dz-message">
                                                    <br />
                                                    <br />
                                                    <br /><br />
                                                   Drag & Drop files here
                                                </div>
                                            </div>
                                            <br />
                                            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Save Files" OnClientClick="return false" />
                                            
                                            <style>
                                                .dz-default {
                                                    background-image: url(../assets/images/filebg.jpg);
                                                    background-repeat: no-repeat;
                                                    background-position: center;
                                                }
                                            </style>
                                            <%--Card body ends--%>                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ./ Content -->
                        

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

    <%-- SCRIPT FOR REGISTRATION STARTS--%>
    <%--<script src="../assets/js/jquery.min.js"></script>--%>
    <script src="../assets/js/logoserv.js"></script>
    <script src="../vendors/jquery/jquery-ui.min.js"></script>
    <%-- SCRIPT FOR REGISTRATION ENDS--%>

    <!-- Apex chart -->
    <script src="https://apexcharts.com/samples/assets/irregular-data-series.js"></script>
    <script src="../../vendors/charts/apex/apexcharts.min.js"></script>

          
    <!-- Dashboard scripts -->
    <script src="../../assets/js/examples/pages/ecommerce-dashboard.js"></script>

    <!-- App scripts -->
    <script src="../../assets/js/app.min.js"></script>

   <!-- Dropzone -->
    <script src="../../vendors/dropzone/dropzone.js"></script>

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

