﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staff.aspx.cs" Inherits="logserv.admin.staff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>All Staff</title>

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
                <h6 class="modal-title">Edit Staff</h6>
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
                            <spane>STAFF UNIQUE ID = </spane><span><asp:Label ID="lbluuid" runat="server" ForeColor="#0066CC"></asp:Label></span>
                        </div>

                    </div>
                    <div class="col-md-6">
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
                        <div class="form-group" id="generalgenderdiv">
                            <p>Select Gender</p>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" runat="server" id="maleRadio" name="genderRadio" value="Male" class="custom-control-input" />
                                <label class="custom-control-label" for="maleRadio">Male</label>
                            </div>
                            <div id="genderdiv" class="custom-control custom-radio custom-control-inline">
                                <input type="radio" runat="server" id="femaleRadio" name="genderRadio" value="Female" class="custom-control-input" />
                                <label class="custom-control-label" for="femaleRadio">Female</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
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
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               <%-- <button type="button" class="btn btn-primary">Save changes</button>--%>
                <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-primary" OnClick="Btnupdate_Click" Text="Save changes" />   
              </div>
            </div>
          </div>
        </div>              

         <%-- Hidden Controls--%>
        <input type = "hidden" id = "txturl" name = "txturl" />
        <input type = "hidden" id = "txtuuid" name = "txtuuid" />

        <script type="text/javascript">
            function showUpdateModel(staffuuid, fileno, fname, surname, mname, gender, qualification, Haddress, imageurl, stateoforigin, oiginLGA, dob) {
                                
                if (staffuuid.length > 0) {                   
                    $("[id*=lbluuid]").text(staffuuid);                    
                    $("[id*=lbluuid]").val(staffuuid);
                    $("[id*=txtfileno]").text(fileno);
                    $("[id*=txtfileno]").val(fileno);
                    $("[id*=txtsurname]").text(surname);
                    $("[id*=txtsurname]").val(surname);
                    $("[id*=txtfirstname]").text(fname);
                    $("[id*=txtfirstname]").val(fname);
                    $("[id*=txtmiddlename]").text(mname);
                    $("[id*=txtmiddlename]").val(mname);
                    $("[id*=txtqualification]").text(qualification);
                    $("[id*=txtqualification]").val(qualification);
                    $("[id*=txtaddress]").text(Haddress);
                    $("[id*=txtaddress]").val(Haddress);
                    $('#upload-img').attr('src', imageurl);
                    $("[id*=daterangepicker]").val(dob);
                    $("[id*=daterangepicker]").text(dob);

                    //Hidden Controls                   
                    $("[id*=txturl]").text(imageurl);
                    $("[id*=txturl]").val(imageurl);
                    $("[id*=txtuuid]").text(staffuuid);
                    $("[id*=txtuuid]").val(staffuuid);

                    /*Automatically trigger State dropdown select(change) vent. This will upload the corresponding LGA into the LGA dropdown*/
                    $("[id*=StateSelect]").val(stateoforigin);
                    $('#StateSelect')[0].focus(); // set the focus
                    $('#StateSelect').trigger('change'); // actually trigger click event for listeners

                    /*Select the LGA*/
                    $("[id*=LGASelect]").val(oiginLGA);

                    /*Select gender*/
                    if (gender == "Male") {
                        $("input:radio[value='Male'][name='genderRadio']").prop('checked', true);
                    }
                    else if (gender == "Female") {
                        $("input:radio[value='Female'][name='genderRadio']").prop('checked', true);
                    }                    
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
                                        <li><a class="active" href="#">Staff list</a></li>
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
                                    <h3>Staff List</h3>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="home.aspx">Home</a>
                                            </li>
                                            <li class="breadcrumb-item">Staff
                                            </li>
                                            <li class="breadcrumb-item active" aria-current="page">Staff List</li>
                                        </ol>
                                    </nav>
                                </div>
                                <span style="float: right"><a href="Register.aspx" class="nav-link" title="Add new record" data-toggle="tooltip">
                                    <i data-feather="plus-circle"></i></a>
                                </span>
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
                                                    <asp:BoundField DataField="servingLGA_Chart" HeaderText="Serving L.G.A" />
                                                    <asp:BoundField DataField="long_appointmentdate" HeaderText="Date of Appointment" />
                                                    <asp:BoundField DataField="qualification" HeaderText="Qualification" />
                                                    <asp:BoundField DataField="age" HeaderText="Age" />
                                                    <asp:BoundField DataField="gender" HeaderText="Gender" />
                                                    <asp:BoundField DataField="stateoforigin" HeaderText="State of Origin" />
                                                    <asp:TemplateField ShowHeader="false">
                                                        <ItemTemplate>
                                                            <button data-toggle="modal" data-target="#editpopup" class="btn btn-default text-secondary" type="button" onclick="showUpdateModel('<%#Eval("uuid")%>' , '<%#Eval("fileNo")%>' , 
                                                                '<%#Eval("firstname")%>' , '<%#Eval("surname")%>', '<%#Eval("middlename")%>', '<%#Eval("gender")%>', '<%#Eval("qualification")%>', 
                                                                '<%#Eval("homeaddress")%>', '<%#Eval("imageurl")%>', '<%#Eval("stateoforigin")%>', '<%#Eval("originLGA")%>', '<%#Eval("dateofbirth")%>')"  
                                                                 title ='<%# string.Concat("Edit" +" "+ Eval("firstname") +" " + Eval("middlename") + " " + Eval("surname")) %>'>
                                                                <i class="ti-pencil"></i>
                                                            </button>

                                                            <asp:LinkButton ID="LnkView" runat="server" CssClass=" text-success ml-2" CommandArgument = '<%# Eval("uuid") %>' CommandName="viewstaff" data-toggle="tooltip" 
                                                                title='<%# string.Concat("View" +" "+ Eval("firstname") +" " + Eval("middlename") + " " + Eval("surname")) %>' >
                                                                <i class="ti-eye"></i>
                                                            </asp:LinkButton>

                                                            <asp:LinkButton ID="Lnkdelete" runat="server" CssClass=" text-danger ml-2" CommandArgument = '<%# Eval("uuid") %>' CommandName="deletestaff" data-toggle="tooltip" 
                                                                title='<%# string.Concat("Delete" +" "+ Eval("firstname") +" " + Eval("middlename") + " " + Eval("surname")) %>' 
                                                                OnClientClick="return sweetAlertConfirm(this);">
                                                                <i class="ti-trash"></i>
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                          
                                            <script type="text/javascript">
                                                function sweetAlertConfirm(btnDelete) {

                                                    if (btnDelete.dataset.confirmed) {
                                                        // The action was already confirmed by the user, proceed with server event
                                                        btnDelete.dataset.confirmed = false;
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
                                                            title: 'Are you sure?',
                                                            text: "You won't be able to revert this!",
                                                            icon: 'warning',
                                                            showCancelButton: true,
                                                            confirmButtonText: 'Yes, delete it!',
                                                            cancelButtonText: 'No, cancel!',
                                                            reverseButtons: true
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                // Set data-confirmed attribute to indicate that the action was confirmed
                                                                btnDelete.dataset.confirmed = true;
                                                                // Trigger button click programmatically
                                                                btnDelete.click();
                                                            } else if (
                                                                /* Read more about handling dismissals below */
                                                                result.dismiss === Swal.DismissReason.cancel
                                                            ) {
                                                                swalWithBootstrapButtons.fire(
                                                                    'Cancelled',
                                                                    'Record was not deleted :)',
                                                                    'error'
                                                                )
                                                                return false
                                                            }
                                                        })
                                                    }
                                                }
                                            </script>

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
        $('input[name="dateofpromotion"]').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true
        });
    </script>
</body>
</html>
