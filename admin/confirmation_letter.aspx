<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmation_letter.aspx.cs" Inherits="logserv.admin.confirmation_letter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Confirmation letter</title>

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
    </style>

    <script type="text/javascript">      

        /*FOR iTEXTSHARP HTML TO PDF*/
        $(document).ready(function () {
            document.getElementById('<%=selectedhtml1.ClientID%>').value = document.getElementById('firstletter').innerHTML.replace(/(]+)/g, "$1 /");
            document.getElementById('<%=selectedhtml2.ClientID%>').value = document.getElementById('secondletter').innerHTML.replace(/(]+)/g, "$1 /");
            
        });


        //FOR HIDING AND SHOWING DIV 

        function sweetAlertConfirm(btnRedirect) {

            if (btnRedirect.dataset.confirmed) {
                // The action was already confirmed by the user, proceed with server event
                btnRedirect.dataset.confirmed = false;
                return true;
            } else {
                // Ask the user to confirm/cancel the action
                event.preventDefault();
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger forcancelbtn'
                    },
                    buttonsStyling: false
                })

                swalWithBootstrapButtons.fire({
                    title: 'Have You Generated the Two Letters?',
                    text: "You should be able to see the letters downloaded!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, continue',
                    cancelButtonText: 'No, cancel!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Set data-confirmed attribute to indicate that the action was confirmed
                        btnRedirect.dataset.confirmed = true;
                        // Trigger button click programmatically
                        btnRedirect.click();
                    } else if (
                        /* Read more about handling dismissals below */
                        result.dismiss === Swal.DismissReason.cancel
                    ) {
                        swalWithBootstrapButtons.fire(
                            'Cancelled',
                            'Please generate the two letters.',
                            'error'
                        )
                        return false
                    }
                })
            }
        }
    </script>

    <style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:3 0 0 0 1 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-469750017 -1073732485 9 0 511 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:0in;
	line-height:107%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:8.0pt;
	line-height:107%;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
-->
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
                        <i class="ti-check mr-2" style="color: darkgreen" aria-hidden="true"></i>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <%--<button type="button" runat="server" id="btnNo" class="btn btn-danger" data-dismiss="modal" onserverclick="return false">Close</button>--%>
                    </div>
                </div>
            </div>
        </div>           

         <%-- Hidden Controls--%>
        <input type = "hidden" id = "txturl" name = "txturl" />
        <input type = "hidden" id = "txtuuid" name = "txtuuid" />     

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
                                               <%-- <div class="input-group">
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
                                        <li><a href="Upload.aspx">Upload Documents</a></li>
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
                                <li>
                                    <a class="active" href="confirmation.aspx">
                                        <span class="nav-link-icon">
                                            <i data-feather="check-square"></i>
                                        </span>
                                        <span>Confirm Staff</span>
                                    </a>
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
                                    <h3>Promoted Staff</h3>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="#">Home</a>
                                            </li>
                                            <li class="breadcrumb-item">Staff
                                            </li>
                                            <li class="breadcrumb-item active" aria-current="page">Promoted Staff</li>
                                            <li class="breadcrumb-item">
                                            </li>
                                        </ol>
                                    </nav>
                                </div>
                                <%--<span style="float: right"><a href="promotion-entry.aspx" class="nav-link" title="Add new record" data-toggle="tooltip">
                                    <i data-feather="plus-circle"></i></a>
                                </span>--%>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <%--Card body starts--%>
                                            <%--=============================--%>
                                            <asp:HiddenField runat="server" ID="selectedhtml1" ValidateRequestMode="Disabled" />
                                            <asp:HiddenField runat="server" ID="selectedhtml2" ValidateRequestMode="Disabled" />

                                            <%--Alert--%>
                                            <div class="alert alert-info" role="alert">
                                                <h5>
                                                    <b>Kindly Note:</b> You MUST generate the two letters by clicking on each GENERATE BUTTON below each letter.<br /> <br />
                                                    Also, you must click the green UPLOAD button to upload the two DOWNLOADED letters.
                                                </h5> 
                                            </div>

                                            <%--FIRST LETTER STARTS--%>
                                            <div class="col-md-12" id="Letter1Div" runat="server">
                                                <div class="col-md-12 mt-5 mb-5 text-center bg-dark-gradient">
                                                    <h3><b style="font-family: calibri">THE FIRST LETTER</b></h3>
                                                </div><br />

                                                 <%--First Letter Content Starts Here--%>
                                                <div class="col-md-12" runat="server" id="firstletter">                                                    
                                                    <div>                                                        
                                                        <p style='text-align:center; width: 100%; margin-right: auto; margin-left: auto;'>
                                                            <img runat="server" id="logoimg"/>                                                            
                                                        </p>

                                                        <p>&nbsp;</p>

                                                        <p style='text-align:center'><b><span
                                                        style='font-size:16.0pt;line-height:107%'>GOVERNMENT OF RIVERS STATE OF NIGERIA</span></b></p>

                                                        <p style='text-align:center'><span style='font-size:12.0pt;line-height:107%'>Local Government Service Commission</span></p>

                                                        <p>&nbsp;</p>
                                                        
                                                        <p style='text-align:right'>
                                                            <b><asp:Label ID="lblDatePrepared" runat="server"></asp:Label></b></p>
                                                        <p>&nbsp;</p>
                                                        

                                                        <p><b><asp:Label ID="lblStaffFileNo" runat="server"></asp:Label></b></p>

                                                        <p style='line-height:1.5'><b><asp:Label ID="lblStaffName" runat="server"></asp:Label></b></p>

                                                        <p style='line-height:normal'><asp:Label ID="lblServingLGA" runat="server"></asp:Label></p>

                                                        <p style='line-height:normal'>&nbsp;</p>

                                                        <p><span class="GramE" style="font-family: 'Lucida Calligraphy'">u:f:s</span> <b>The Executive Chairman,</b></p>

                                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblServingLGA2" runat="server"></asp:Label></p>

                                                        <p>&nbsp;</p>

                                                        <p style='text-align:center'><b><u><span
                                                        style='font-size:14.0pt;line-height:107%'>CONFIRMATION OF APPOINTMENT</span></u></b><span
                                                        style='font-size:14.0pt;line-height:107%'></span></p>

                                                        <p style='line-height:150%'>I refer to your application dated <asp:Label ID="lblConfirmationApplicationDate" runat="server"></asp:Label> on the above subject and to inform you that the Rivers
                                                        State Local Government Service Commission has <b>approved</b> the confirmation
                                                        of your appointment as <b><asp:Label ID="lblDesignation" runat="server"></asp:Label></b>.</p>

                                                        <p>&nbsp;</p>

                                                        <p style='line-height:150%'>2. Accordingly, your appointment has been confirmed with effect from <b><asp:Label ID="lblConfirmationEffectiveDate" runat="server"></asp:Label></b>.</p>
                                                        
                                                        <p>&nbsp;</p>

                                                        <p style='text-align:center; line-height:normal'><b><asp:Label ID="lblSecretaryName" runat="server"></asp:Label></b></p>

                                                        <p style='text-align:center; line-height:normal'>Secretary</p>

                                                        <p style='text-align:center; line-height:normal'>Local
                                                        Government Service Commission</p>

                                                        <p>&nbsp;</p>

                                                        <p style='line-height:normal'><b>CC: <span style='mso-tab-count:1'>        
                                                         
                                                        </span>The Executive Chairman</b>,</p>

                                                        <p style='text-indent:.6in;line-height:normal'><asp:Label ID="lblServingLGA3" runat="server"></asp:Label></p>

                                                        <p style='text-indent:.5in;line-height:normal'>&nbsp;</p>

                                                        <p style='line-height:normal'>Above is for your information and
                                                        necessary action. Kindly deliver the original copy of this letter to <b><asp:Label ID="lblStaffName2" runat="server"></asp:Label>, </b>please.</p>

                                                        <p style='line-height:normal'>&nbsp;</p>

                                                        <p>&nbsp;</p>                                                        

                                                        <p style='text-align:center; line-height:normal'><b><asp:Label ID="lblSecretaryName2" runat="server"></asp:Label></b></p>

                                                        <p style='text-align:center; line-height:normal'>Secretary</p>

                                                        <p style='text-align:center; line-height:normal'>Local
                                                        Government Service Commission</p>
                                                        
                                                        <p>&nbsp;</p>   
                                                        <hr />
                                                        <p style="text-align: center"><b>SECRETARIAT COMPLEX, P.M.B,5655, PORT HARCOURT,RIVERS STATE</b><br />website: www.logoserv.com</p>
                                                    </div>                                                
                                                </div>
                                                 <br /><br />
                                                <div class="col-md-6">
                                                    <asp:Button ID="btnExport" runat="server" CssClass="btn btn-lg btn-secondary" Text="Click to Generate First Letter" OnClick="btnExport_Click" /> 
                                                </div>
                                            </div>

                                            <br /><br />

                                            <%--SECOND LETTER STARTS--%>
                                            <div class="col-md-12" id="Letter2Div" runat="server"><br />
                                                <div class="col-md-12 mt-5 mb-5 text-center bg-dark-gradient">
                                                    <h3><b style="font-family: calibri">THE SECOND LETTER</b></h3>
                                                </div><br />

                                                <%--Second Letter Content Starts Here--%>
                                                <div class="col-md-12" runat="server" id="secondletter">
                                                    <div>                                                        
                                                        <p style='text-align:center; width: 100%; margin-right: auto; margin-left: auto;'>
                                                            <img runat="server" id="logoimgLetter2"/>                                                            
                                                          </p>

                                                        <p>&nbsp;</p>

                                                        <p style='text-align:center'><b><span
                                                        style='font-size:16.0pt;line-height:107%'>GOVERNMENT OF RIVERS STATE OF NIGERIA</span></b></p>

                                                        <p style='text-align:center'><span style='font-size:12.0pt;line-height:107%'>Local Government Service Commission</span></p>

                                                        <p>&nbsp;</p>
                                                        
                                                        <p style='text-align:right'><b><asp:Label ID="lblDatePreparedLetter2" runat="server"></asp:Label></b></p>

                                                        <p>&nbsp;</p>

                                                        <p>&nbsp;</p>

                                                        <p><b><asp:Label ID="lblStaffFileNoLetter2" runat="server"></asp:Label></b></p>

                                                        <p style='line-height:1.5'><b><asp:Label ID="lblStaffNameLetter2" runat="server"></asp:Label></b></p>

                                                        <p style='line-height:normal'><asp:Label ID="lblServingLGALetter2" runat="server"></asp:Label></p>

                                                        <p style='line-height:normal'>&nbsp;</p>

                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>

                                                        <p style='text-align:center'><b><u><span
                                                        style='font-size:14.0pt;line-height:107%'>CONFIRMATION OF APPOINTMENT</span></u></b><span
                                                        style='font-size:14.0pt;line-height:107%'></span></p>

                                                        <p style='line-height:150%'>I refer to your application dated <asp:Label ID="lblConfirmationApplicationDateLetter2" runat="server"></asp:Label> on the above subject and to inform you that the Rivers
                                                        State Local Government Service Commission has <b>approved</b> the confirmation
                                                        of your appointment as <b><asp:Label ID="lblDesignationLetter2" runat="server"></asp:Label></b>.</p>

                                                        <p>&nbsp;</p>

                                                        <p style='line-height:150%'>2. Accordingly, your appointment has been confirmed with effect from <b><asp:Label ID="lblConfirmationEffectiveDateLetter2" runat="server"></asp:Label></b>.</p>
                                                        
                                                       <p style='line-height:normal'>&nbsp;</p>

                                                        <p>&nbsp;</p>                                                        
                                                        <p>&nbsp;</p>

                                                        <p style='text-align:center; line-height:normal'><b><asp:Label ID="lblSecretaryName2Letter2" runat="server"></asp:Label></b></p>

                                                        <p style='text-align:center; line-height:normal'>Secretary</p>

                                                        <p style='text-align:center; line-height:normal'>Local
                                                        Government Service Commission</p>
                                                        
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <hr />
                                                        <p style="text-align: center"><b>SECRETARIAT COMPLEX, P.M.B,5655, PORT HARCOURT,RIVERS STATE</b><br />website: www.logoserv.com</p>
                                                    </div>      
                                                </div>
                                                 <br /><br />
                                                <div class="col-md-6">
                                                    <asp:Button ID="btnExport2" runat="server" CssClass="btn btn-lg btn-info" Text="Click to Generate Second Letter" OnClick="btnExport_Click2" /> 
                                                </div>
                                            </div>                                            

                                            <%--Card body ends--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="col-md-12 pt-2 pb-2 text-center">
                                                <asp:Button ID="btnRedirect" runat="server" CssClass="btn btn-lg btn-success" Text="CLICK TO UPLOAD THE DOWNLOADED LETTERS" OnClick="btncontinue_Click"  OnClientClick="return sweetAlertConfirm(this);"/> 
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

