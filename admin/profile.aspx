<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="logserv.admin.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Staff profile</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="../../assets/media/image/favicon.png" />

    <!-- Dropzone -->
    <link rel="stylesheet" href="../vendors/dropzone/dropzone.css" type="text/css" />

    <!-- Main css -->
    <link rel="stylesheet" href="../vendors/bundle.css" type="text/css" />

    <!-- DataTable -->
    <link rel="stylesheet" href= " https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" type="text/css" />
   <link rel="stylesheet" href="../vendors/dataTable/datatables.min.css" type="text/css"/>

    <!-- Slick -->
    <link rel="stylesheet" href="../vendors/slick/slick.css" type="text/css" />
    <link rel="stylesheet" href="../vendors/slick/slick-theme.css" type="text/css" />

    <!-- Daterangepicker -->
    <link href="../vendors/datepicker/daterangepicker.css" rel="stylesheet" />

    <!-- App css -->
    <link rel="stylesheet" href="../assets/css/app.min.css" type="text/css" />

    <!-- Other css -->
    <link href="../Scripts/css/style.css" rel="stylesheet" />
    <script src="../assets/js/jquery.min.js"></script>

   <%-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.js" type="text/javascript"></script>
    <link href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/themes/blitzer/jquery-ui.css" rel="stylesheet" type="text/css"/>

    <!-- Toast examples -->
    <script src="../../assets/js/examples/toast.js"></script>

    <%--For CKeditor--%>
    <%--<link href="../ckeditor/samples/css/samples.css" rel="stylesheet" />--%>
    <script src="../ckeditor/ckeditor.js"></script>
    <script src="../ckeditor/samples/js/sample.js"></script>

     <!-- Toast examples -->
    <script src="../assets/js/examples/toast.js"></script>

    <%--FOR FILE UPLOAD--%>
    <script type="text/javascript">
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

        /* FOR MODAL POPUP without clearing controls*/
        function ShowEditPopup()
        {            
            $("#editpopup").modal("show");
        }
    </script>

    <style>
        .divred {
            background-color: #FFAAAA;
        }

        .divgreen {
            background-color: #00CC00;
        }
        .forcancelbtn {
            margin-right: 20px;
        }
        .horizontalLine {
          border-top: 1px dotted grey;
          margin-top: 20px;
          margin-bottom: 20px;
        }
    </style>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= Docgrid.ClientID %>').DataTable({
                responsive: true,
                dom: 'Bfrtip',
                buttons: [
                    
                ],
            });
        });
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
            <%--deleted--%>
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
                                        <li><a href="register.aspx">Register Staff</a></li>
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
                        <h3>Staff Profile</h3>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="home.aspx">Home</a>
                                </li>
                                <li class="breadcrumb-item">Staff
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Staff Profile</li>
                            </ol>
                        </nav>
                    </div>
                    <div>                        
                        <div class="dropdown-menu-right">
                            <span style="margin-right: 10px; color: #0000FF;"><label>Select to view another staff:</label></span>
                            <span><asp:DropDownList ID="DDLstaff" CssClass="btn bg-white" OnSelectedIndexChanged="loadstaff" runat="server" AutoPostBack="True"></asp:DropDownList></span>
                        </div>
                    </div>

                    <%--<span style="float: right">
                        <div class="form-group">
                            <span><label>Select Next Staff:</label></span>
                            <span></span>
                        </div>
                    </span>--%>
                </div>
                
                <div class="row">
                    <div class="col-md-12">

                        <div class="profile-container"  style="background-color: #5B5B5B; height: 100px;" >
                            <div class="d-flex align-items-center">
                                <figure class="avatar avatar-xl mr-3">
                                    <asp:Image ID="staffimg" runat="server" CssClass="rounded-circle" />
                                    <%-- <img src="../../assets/media/image/user/man_avatar3.jpg"
                                            class="rounded-circle" alt="..."/>--%>
                                </figure>
                                <div>
                                    <h4 class="mb-0"><asp:Label ID="lblname" runat="server"></asp:Label></h4>
                                    <small><b>File No:&nbsp</b><asp:Label ID="lblfileno" runat="server"></asp:Label></small>
                                </div>
                            </div>
                            <div class="profile-menu">
                                <asp:Label ID="lblphone" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title">About</h6>
                                        <p>This staff lives at &nbsp <b><asp:Label ID="lbladdress" runat="server"></asp:Label></b>
                                            <br />He was registered on &nbsp <b><asp:Label ID="lbldateregistered" runat="server"></asp:Label></b>
                                        </p>
                                        <div>
                                            <ul class="list-group list-group-flush mb-3">
                                                <li class="list-group-item px-0">Currently serving at &nbsp <b><asp:Label ID="lblLGAofService" runat="server"></asp:Label></b> &nbsp local government</li>
                                                <li class="list-group-item px-0"><b>Age:</b> &nbsp <asp:Label ID="lblage" runat="server"></asp:Label></li>
                                                <li class="list-group-item px-0"><b>Gender:</b> &nbsp <asp:Label ID="lblgender" runat="server"></asp:Label></li>
                                                <li class="list-group-item px-0"><b>Qualification:</b> &nbsp <asp:Label ID="lblqualification" runat="server"></asp:Label></li>
                                                <li class="list-group-item px-0"><b>Date of Appointment:</b> &nbsp <asp:Label ID="lblAppointmentDate" runat="server"></asp:Label></li>
                                                <li class="list-group-item px-0"><b>State: of Origin:</b> &nbsp <asp:Label ID="lblstateoforigin" runat="server"></asp:Label></li>
                                                <li class="list-group-item px-0"><b>L.G.A of Origin:</b> &nbsp <asp:Label ID="lblLGAorigin" runat="server"></asp:Label></li>
                                                <li class="list-group-item px-0"><b>E-mail:</b> &nbsp <asp:Label ID="lblemail" runat="server"></asp:Label></li> 
                                            </ul>
                                        </div>
                                        <%--<div class="d-md-flex">
                                            <button class="btn btn-primary mr-2">
                                                <i data-feather="message-circle" class="mr-1"></i> Message
                                            </button>
                                            <button class="btn btn-secondary">
                                                <i data-feather="plus" class="mr-1"></i> Follow
                                            </button>
                                        </div>--%>
                                    </div>
                                </div>
                                <%--<div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title d-flex justify-content-between align-items-center">
                                            Photos
                                            <a href="#" class="small">All</a>
                                        </h6>
                                        <div class="row row-xs">
                                            <div class="col-lg-6 mb-3">
                                                <a href="#">
                                                    <img class="img-fluid rounded"
                                                            src="../../assets/media/image/portfolio-one.jpg"
                                                            alt="image/">
                                                </a>
                                            </div>
                                            <div class="col-lg-6 mb-3">
                                                <a href="#">
                                                    <img class="img-fluid rounded"
                                                            src="../../assets/media/image/portfolio-two.jpg"
                                                            alt="image/">
                                                </a>
                                            </div>
                                            <div class="col-lg-6 mb-3">
                                                <a href="#">
                                                    <img class="img-fluid rounded"
                                                            src="../../assets/media/image/portfolio-three.jpg"
                                                            alt="image/">
                                                </a>
                                            </div>
                                            <div class="col-lg-6 mb-3">
                                                <a href="#">
                                                    <img class="img-fluid rounded"
                                                            src="../../assets/media/image/portfolio-four.jpg"
                                                            alt="image/">
                                                </a>
                                            </div>
                                            <div class="col-lg-6 mb-3">
                                                <a href="#">
                                                    <img class="img-fluid rounded"
                                                            src="../../assets/media/image/portfolio-five.jpg"
                                                            alt="image/">
                                                </a>
                                            </div>
                                            <div class="col-lg-6 mb-3">
                                                <a href="#">
                                                    <img class="img-fluid rounded"
                                                            src="../../assets/media/image/portfolio-six.jpg"
                                                            alt="image/">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                            <div class="col-md-6">
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="timeline" role="tabpanel">
                                        <div class="card">
                                            <div class="card-body">
                                                <h6 class="card-title">Timeline</h6>
                                                
                                                    <div class="timeline">
                                                        
                                                        <asp:GridView ID="TimelineGrid" runat="server" OnRowDataBound="GridView1_RowDataBound" ShowHeader="False" 
                                                            GridLines="none" DataKeyNames="id" AutoGenerateColumns="false" Width="100%" EmptyDataText="Not available">
                                                            <Columns> 
                                                                <asp:TemplateField ShowHeader="false">
                                                                    <ItemTemplate>
                                                                        
                                                                        <div class="timeline-item">
                                                                           <div>
                                                                                <figure class="avatar avatar-sm mr-3 bring-forward">
                                                                                        <span class="avatar-title bg-success-bright text-success rounded-circle"><i class="ti-check"></i></span>
                                                                                </figure>
                                                                            </div>
                                                                            <div>
                                                                                <h6 class="d-flex justify-content-between mb-4">
                                                                                    <span style="float: left">
                                                                                        <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                                                                                    </span>
                                                                                    <span class="text-muted font-weight-normal" style="margin-left: 20px; float: right">
                                                                                        <asp:Label ID="lbltime" runat="server" Text='<%# Eval("long_activedate") %>'></asp:Label>
                                                                                    </span>
                                                                                </h6>                                                                                
                                                                                <div class="mb-3 border p-3 border-radius-1">
                                                                                    <asp:Label ID="lblnote" runat="server" Text='<%# Eval("note") %>'></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                         </div>
                                                                            
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <RowStyle CssClass="timeline-item" />
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                     </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <h6 class="card-title d-flex justify-content-between align-items-center">
                                                Documents
                                            </h6>
                                                  <div>
                                                    <asp:GridView ID="Docgrid" CssClass="table-striped" runat="server" AutoGenerateColumns="false" 
                                                        GridLines="None" Width="100%" OnRowDataBound="docGrid_RowDataBound" EmptyDataText = "No files uploaded">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                   
                                                                    <figure class="avatar m-r-15">
                                                                        <asp:Image ID="fileimg" runat="server" CssClass="rounded-circle" AlternateText="image" 
                                                                            ImageUrl="~/File_ext_Images/txt3.jpg" />                                                                        
                                                                    </figure>
                                                                    
                                                                    <div>
                                                                       
                                                                       <span style="float: left;">
                                                                           <h6><asp:Label ID="lblfilename" runat="server" Text='<%# Eval("filename") %>'></asp:Label></h6>
                                                                           <small class="text-muted"><%# Eval("long_dateuploaded") %></small>
                                                                       </span>
                                                                        
                                                                       <span style="float: right; margin-bottom: 10px;">
                                                                           <small>
                                                                                <asp:LinkButton ID="lnkDownload" Text="Download" CssClass="btn btn-outline-primary btn-floating" 
                                                                                    CommandArgument = '<%# Eval("filepath") %>' runat="server" OnClick = "DownloadFile"
                                                                                    data-toggle="tooltip" title='<%# string.Concat("Download" +" "+ Eval("filename")) %>'>
                                                                                    <i class="fa fa-download"></i>
                                                                                </asp:LinkButton>
                                                                            </small>
                                                                       </span>                                                                       
                                                                    </div>      
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                                                                                    
                                                        </Columns>
                                                        <RowStyle CssClass="horizontalLine" />
                                                    </asp:GridView>
                                                </div>                                                    
                                        </div>
                                    </div>
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
    <%--<script src="../vendors/jquery/jquery-ui.min.js"></script>--%>
    <%-- SCRIPT FOR REGISTRATION ENDS--%>

    <!-- Dashboard scripts -->
    <script src="../../assets/js/examples/pages/ecommerce-dashboard.js"></script>

    <!-- App scripts -->
    <script src="../../assets/js/app.min.js"></script>

    <!-- Dropzone -->
    <script src="../../vendors/dropzone/dropzone.js"></script>

    <!-- Sweet alert -->
    <%--<script src="../assets/js/examples/sweet-alert.js"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
    

    <!-- Datepicker -->
    <script src="../vendors/datepicker/daterangepicker.js"></script>
    <script src="../../assets/js/examples/datepicker.js"></script>

    <!-- DataTable -->
    <script src="../vendors/dataTable/datatables.min.js"></script>
    
    <%--Grid export buttons--%>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
     <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
     <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>

    <!-- Prism -->
    <script src="../../vendors/prism/prism.js"></script>

    <script>
        $('input[name="dateofappointment"]').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true
        });
    </script>

    <%-- For CKEditor--%>
    <script>
        initSample();
    </script>

    <script>
        $('input[name="dateofpromotion"]').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true
        });
    </script>
</body>
</html>
