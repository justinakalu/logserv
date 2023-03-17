<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmation.aspx.cs" Inherits="logserv.admin.confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Unconfirmed Staff</title>

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
        $(document).ready(function () {
            $('#<%= staffgrid.ClientID %>').DataTable({                
                responsive: true,
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'excel', 'print', 'pdf', 'csv'
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
        <!-- Modal Popup -->

        <!-- .Edit modal-xl starts-->
        <div id="editpopup" class="modal fade" tabindex="-1" role="dialog">
          <div class="modal-dialog modal-xl">
            <div class="modal-content">
              <div class="modal-header">
                <h6 class="modal-title">STAFF CONFIRMATION</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <i class="ti-close"></i>
                </button>
              </div>
              <div class="modal-body">
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
                        
                        <div class="col-md-12" style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
                            <spane>STAFF UNIQUE ID = </spane><span><asp:Label ID="lbluuid" runat="server" ForeColor="Gray"></asp:Label></span>
                        </div>

                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label><b>File No:</b></label>
                            <asp:Label ID="lblfileno" runat="server"></asp:Label>
                            <%--<input id="txtfileno" runat="server" type="text" class="form-control" />--%>
                        </div>
                        <div class="form-group">
                            <label><b>Full Name:</b></label>
                            <asp:Label ID="lblfullname" runat="server"></asp:Label>
                            <%--<input runat="server" id="txtsurname" type="text" class="form-control" />--%>
                        </div>
                        <div class="form-group">
                            <label><b>Gender:</b></label>
                            <asp:Label ID="lblgender" runat="server"></asp:Label>
                            <%--<input runat="server" id="txtfirstname" type="text" class="form-control" />--%>
                        </div>
                        <div class="form-group">
                            <label><b>Date of First Appointment:</b></label>
                            <asp:Label ID="lblDateofFirstAppointment" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label><b>Serving L.G.A:</b></label>
                            <asp:Label ID="lblservinglga" runat="server"></asp:Label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card">
                             <div class="card-body bg-dark-bright">
                                <h6 class="card-title"> Fill this Form </h6>
                                <div class="form-group">
                                    <label>Select Preparation Date (Required)</label>
                                    <input type="text" name="daterangepicker" runat="server" id="daterangepicker" class="form-control" required="required" />
                                </div>
                                <div class="form-group">
                                    <label>Select Staff Confirmation Application Date</label>
                                    <input type="text" name="staffconfirmationApplicationdate" runat="server" id="staffconfirmationApplicationdate" class="form-control" required="required" />
                                </div>
                                <div class="form-group">
                                    <label>Enter Secretary Name (Required)</label>
                                    <input runat="server" id="txtsecretary" type="text" class="form-control" required="required" />
                                </div>
                                <div class="form-group">
                                    <label>Enter Staff Designation (Required)</label>
                                    <input runat="server" id="txtdesignation" type="text" class="form-control" required="required" />
                                </div>  
                            </div>
                       </div>
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               <%-- <button type="button" class="btn btn-primary">Save changes</button>--%>
                <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-primary" OnClick="Btncontinue_Click" Text="Continue" OnClientClick="return sweetAlertConfirm(this);" />   
              </div>
            </div>
          </div>
        </div>              

         <%-- Hidden Controls--%>
        <input type = "hidden" id = "txturl" name = "txturl" />
        <input type = "hidden" id = "txtuuid" name = "txtuuid" />
        <input type = "hidden" id = "txtDateofFirstAppointmentlong" name = "txtDateofFirstAppointmentlong" />
        <input type = "hidden" id = "txtDateofFirstAppointmentshort" name = "txtDateofFirstAppointmentshort" />
        <input type = "hidden" id = "txtfullname" name = "txtfullname" />       
        <input type = "hidden" id = "txtfileno" name = "txtfileno" />
        <input type = "hidden" id = "txtservinglga" name = "txtservinglga" />
        <input type = "hidden" id = "txtgender" name = "txtgender" />
        <input type = "hidden" id = "txtDateofJobApplicationLong" name = "txtDateofJobApplicationLong" />
        <input type = "hidden" id = "txtDateofJobApplicationShort" name = "txtDateofJobApplicationShort" />
        <input type = "hidden" id = "txtqualification" name = "txtqualification" />

        <script type="text/javascript">
            function showUpdateModel(staffuuid, fileno, fname, surname, mname, gender, qualification, Haddress, imageurl,
                                    stateoforigin, servingLGA, DateofFirstAppointment_long, DateofFirstAppointment_short,
                                    long_jobApplicationDate, short_jobApplicationDate)
            {
                                
                if (staffuuid.length > 0) {                   
                    $("[id*=lbluuid]").text(staffuuid);                    
                    $("[id*=lbluuid]").val(staffuuid);
                    $("[id*=lblfileno]").text(fileno);
                    $("[id*=lblfileno]").val(fileno);
                    $("[id*=lblfullname]").text(surname +" "+fname+" "+mname);
                    $("[id*=lblfullname]").val(surname + " " + fname + " " + mname);
                    $("[id*=lblgender]").text(gender);
                    $("[id*=lblgender]").val(gender);
                    $("[id*=lblDateofFirstAppointment]").text(DateofFirstAppointment_long);
                    $("[id*=lblDateofFirstAppointment]").val(DateofFirstAppointment_long);
                    $("[id*=lblservinglga]").text(servingLGA);
                    $("[id*=lblservinglga]").val(servingLGA);
                    $('#upload-img').attr('src', imageurl);


                    //Hidden Controls for passing values in Modal form  because ASP Labels cannot do so                 
                    $("[id*=txturl]").text(imageurl);
                    $("[id*=txturl]").val(imageurl);

                    $("[id*=txtuuid]").text(staffuuid);
                    $("[id*=txtuuid]").val(staffuuid);

                    $("[id*=txtDateofFirstAppointmentshort]").text(DateofFirstAppointment_short);
                    $("[id*=txtDateofFirstAppointmentshort]").val(DateofFirstAppointment_short);

                    $("[id*=txtDateofFirstAppointmentlong]").text(DateofFirstAppointment_long);
                    $("[id*=txtDateofFirstAppointmentlong]").val(DateofFirstAppointment_long);

                    $("[id*=txtDateofJobApplicationLong]").text(long_jobApplicationDate);
                    $("[id*=txtDateofJobApplicationLong]").val(long_jobApplicationDate);

                    $("[id*=txtDateofJobApplicationShort]").text(short_jobApplicationDate);
                    $("[id*=txtDateofJobApplicationShort]").val(short_jobApplicationDate);

                    $("[id*=txtfileno]").text(fileno);
                    $("[id*=txtfileno]").val(fileno);

                    $("[id*=txtfullname]").text(surname + " " + fname + " " + mname);
                    $("[id*=txtfullname]").val(surname + " " + fname + " " + mname);

                    $("[id*=txtgender]").text(gender);
                    $("[id*=txtgender]").val(gender);

                    $("[id*=txtservinglga]").text(servingLGA);
                    $("[id*=txtservinglga]").val(servingLGA);

                    $("[id*=txtqualification]").text(qualification);
                    $("[id*=txtqualification]").val(qualification);
                }
            }

            function sweetAlertConfirm(btnupdate) {

                if (btnupdate.dataset.confirmed) {
                    // The action was already confirmed by the user, proceed with server event
                    btnupdate.dataset.confirmed = false;
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
                        title: 'Have You Filled the Form Correctly?',
                        text: "You won't be able to revert this!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'Yes, continue',
                        cancelButtonText: 'No, cancel!',
                        reverseButtons: true
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Set data-confirmed attribute to indicate that the action was confirmed
                            btnupdate.dataset.confirmed = true;
                            // Trigger button click programmatically
                            btnupdate.click();
                        } else if (
                            /* Read more about handling dismissals below */
                            result.dismiss === Swal.DismissReason.cancel
                        ) {
                            swalWithBootstrapButtons.fire(
                                'Cancelled',
                                'Operation has been terminated :)',
                                'error'
                            )
                            return false
                        }
                    })
                }
            }
        </script>
        <!-- .Edit modal-xl ends -->       

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
                                        <li><a class="active" href="confirmation.aspx">Unconfirmed Staff</a></li>
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
                                    <h3>Unconfirmed Staff</h3>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="home.aspx">Home</a>
                                            </li>
                                            <li class="breadcrumb-item active" aria-current="page">Unconfirmed Staff</li>
                                        </ol>
                                    </nav>
                                </div>
                               <%-- <span style="float: right"><a href="Register.aspx" class="nav-link" title="Add new record" data-toggle="tooltip">
                                    <i data-feather="plus-circle"></i></a>
                                </span>--%>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <%--Card body starts--%>

                                            <asp:Label ID="lblmsg" runat="server"></asp:Label>

                                            <asp:GridView CssClass="table table-striped table-bordered" ID="staffgrid" runat="server" DataKeyNames="uuid"
                                                OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="false" Width="100%" EmptyDataText="No record found">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Name" ShowHeader="true">
                                                        <ItemTemplate>
                                                            <a href="#">
                                                                <figure class="avatar avatar-sm mr-2">
                                                                    <img src='<%# Eval("imageurl") %>'
                                                                            class="rounded-circle" alt="avatar">
                                                                </figure>
                                                                <asp:Label ID="lblfullname" runat="server" Text='<%# string.Concat(Eval("firstname") +" " + Eval("middlename") + " " + Eval("surname")) %>'></asp:Label>                                                                                                                              
                                                            </a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="fileNo" HeaderText="File No" />
                                                    <asp:BoundField DataField="current_level" HeaderText="Level" />
                                                    <asp:BoundField DataField="servingLGA_Chart" HeaderText="Serving L.G.A" />
                                                    <asp:BoundField DataField="long_appointmentdate" HeaderText="First Appointment Date" />
                                                    <asp:BoundField DataField="qualification" HeaderText="Qualification" />
                                                    <asp:BoundField DataField="gender" HeaderText="Gender" />
                                                    <asp:TemplateField ShowHeader="false">
                                                        <ItemTemplate>
                                                            <button data-toggle="modal" data-target="#editpopup" class="btn btn-sm btn-primary" type="button" onclick="showUpdateModel('<%#Eval("uuid")%>' , '<%#Eval("fileNo")%>' , 
                                                                '<%#Eval("firstname")%>' , '<%#Eval("surname")%>', '<%#Eval("middlename")%>', '<%#Eval("gender")%>', '<%#Eval("qualification")%>', 
                                                                '<%#Eval("homeaddress")%>', '<%#Eval("imageurl")%>', '<%#Eval("stateoforigin")%>', '<%#Eval("servingLGA_Chart")%>', 
                                                                '<%#Eval("long_appointmentdate")%>', '<%#Eval("appointmentdate")%>', '<%#Eval("long_applicationdate")%>', '<%#Eval("applicationdate")%>')"
                                                                
                                                                 title ='<%# string.Concat("Confirm" +" "+ Eval("firstname") +" " + Eval("middlename") + " " + Eval("surname")) %>'>
                                                                
                                                                Confirm
                                                            </button>

                                                            <asp:LinkButton ID="LnkView" runat="server" CssClass=" text-success ml-2" CommandArgument = '<%# Eval("uuid") %>' CommandName="viewstaff" data-toggle="tooltip" 
                                                                title='<%# string.Concat("View" +" "+ Eval("firstname") +" " + Eval("middlename") + " " + Eval("surname")) %>' >
                                                                <i class="ti-eye"></i>
                                                            </asp:LinkButton>

                                                           <%-- <asp:LinkButton ID="Lnkdelete" runat="server" CssClass=" text-danger ml-2" CommandArgument = '<%# Eval("uuid") %>' CommandName="deletestaff" data-toggle="tooltip" 
                                                                title='<%# string.Concat("Delete" +" "+ Eval("firstname") +" " + Eval("middlename") + " " + Eval("surname")) %>' 
                                                                OnClientClick="return sweetAlertConfirm(this);">
                                                                <i class="ti-trash"></i>
                                                            </asp:LinkButton>--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>                                       
                                            
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
        $('input[name="staffconfirmationApplicationdate"]').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true
        });
    </script>
</body>

</html>
