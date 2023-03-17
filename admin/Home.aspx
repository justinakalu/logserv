<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="logserv.admin.Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Admin home</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="../../assets/media/image/favicon.png" />

    <!-- Main css -->
    <link rel="stylesheet" href="../../vendors/bundle.css" type="text/css" />

    <!-- Slick -->
    <link rel="stylesheet" href="../../vendors/slick/slick.css" type="text/css" />
    <link rel="stylesheet" href="../../vendors/slick/slick-theme.css" type="text/css" />

    <!-- Daterangepicker -->
    <link rel="stylesheet" href="../../vendors/datepicker/daterangepicker.css" type="text/css" />

    <!-- DataTable -->
    <link rel="stylesheet" href="../../vendors/dataTable/datatables.min.css" type="text/css" />

    <!-- App css -->
    <link rel="stylesheet" href="../../assets/css/app.min.css" type="text/css" />

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script lang="javascript">
        function printdiv(printpage) {
            var headstr = "<html><head></head><body>";
            var footstr = "</body></html>";
            var newstr = document.getElementById(printpage).innerHTML;
            var oldstr = document.body.innerHTML;
            document.body.innerHTML = headstr + newstr + footstr;
            window.print();
            document.body.innerHTML = oldstr;
            return false;
        }
    </script>
    <style>
        .divchart {
            width: 100% !important;
        }

        .chartcss {
            width: 40% !important;
            height: 40% !important;
        }
    </style>
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
                        <div class="header-left bg-facebook">
                            <div class="navigation-toggler">
                                <a href="#" data-action="navigation-toggler">
                                    <i data-feather="menu"></i>
                                </a>
                            </div>

                            <div class="header-logo">
                                <a href="home.aspx">
                                    <img class="logo" src="../../assets/media/image/logo.png" alt="logo" />
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
                                                <asp:LinkButton ID="lnksignout" runat="server" CssClass="list-group-item text-danger" OnClick="Usersignout">Sign Out!</asp:LinkButton>
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
                                    <a class="active" href="#">
                                        <span class="nav-link-icon">
                                            <i data-feather="home"></i>
                                        </span>
                                        <span>Home</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <span class="nav-link-icon"><i data-feather="users"></i></span>
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
                        <div id="div_print" class="content">
                            <div class="page-header">
                                <div>
                                    <h3>Local Government Service Commission</h3>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">Dashboard
                                            <%--<a href="#">Dashboard</a>--%>
                                            </li>
                                            <li class="breadcrumb-item active" aria-current="page">Home</li>
                                        </ol>
                                    </nav>
                                </div>
                                <div>
                                    <%--<div id="ecommerce-dashboard-daterangepicker" class="btn bg-white">
                                        <span></span>
                                    </div>--%>
                                    <a href="#" class="btn btn-primary ml-2" data-toggle="dropdown">
                                        <i data-feather="download"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <%-- <a href="#" class="dropdown-item">Download</a>--%>
                                        <%-- <a href="#" class="dropdown-item">Print</a>--%>
                                        <input name="b_print" type="button" class="dropdown-item" onclick="printdiv('div_print');" value=" Print " />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4 col-md-12">
                                    <div class="card bg-secondary">
                                        <div class="card-body">
                                            <h6 class="card-title d-flex justify-content-between">Total No of Staff
                                            <%--<small class="opacity-7">Last 30 days</small>--%>
                                            </h6>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="font-size-35">
                                                    <asp:Label ID="lblTotalNoOfStaff" runat="server" ></asp:Label>
                                                </div>
                                                <div class="icon-block icon-block-xl icon-block-floating icon-block-outline-white opacity-7">
                                                    <i class="fa fa-users"></i>
                                                </div>
                                            </div>
                                            <%--<p class="mb-0">
                                            <i class="ti-angle-up mr-1"></i>
                                            2.00%
                                        </p>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-12">
                                    <div class="card bg-info">
                                        <div class="card-body">
                                            <h6 class="card-title d-flex justify-content-between">No of Staff Promoted
                                            <%--<small class="opacity-7">Last 30 days</small>--%>
                                            </h6>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="font-size-35">
                                                    <asp:Label ID="lblNoOfPromotion" runat="server"></asp:Label>
                                                </div>
                                                <div class="icon-block icon-block-xl icon-block-floating icon-block-outline-white opacity-7">
                                                    <i class="fa fa-level-up"></i>
                                                </div>
                                            </div>
                                            <%--<p class="mb-0">
                                            <i class="ti-angle-down mr-1"></i>
                                            1.59%
                                        </p>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-12">
                                    <div class="card bg-warning">
                                        <div class="card-body">
                                            <h6 class="card-title d-flex justify-content-between">No of Retired Staff
                                           <%-- <small class="opacity-7">Last 30 days</small>--%>
                                            </h6>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="font-size-35">
                                                    <asp:Label ID="lblNoOfRetiredStaff" runat="server"></asp:Label>
                                                </div>
                                                <div class="icon-block icon-block-xl icon-block-floating icon-block-outline-white opacity-7">
                                                    <i class="fa fa-pause"></i>
                                                </div>
                                            </div>
                                            <%--<p class="mb-0">
                                            <i class="ti-angle-up mr-1"></i>
                                            2.07%
                                        </p>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-xl-3 col-lg-6 mb-3 mb-xl-0">
                                                    <p class="mb-2">In Service</p>
                                                    <div class="d-flex align-items-end">
                                                        <h2 class="mb-0 line-height-30 font-size-30">
                                                            <asp:Label ID="lblinService" runat="server" Text="123"></asp:Label></h2>
                                                        <span class="text-success small ml-2 d-flex align-items-center">
                                                            <%--<span class="ti-rotate"></span>--%>
                                                            <span class="badge bg-info-bright text-info rounded d-inline-flex align-items-center"><i class="fa fa-refresh"></i></span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-lg-6 mb-3 mb-xl-0">
                                                    <p class="mb-2">Out of Service</p>
                                                    <div class="d-flex align-items-end">
                                                        <h2 class="mb-0 line-height-30 font-size-30">
                                                            <asp:Label ID="lblOutOfService" runat="server" Text="210"></asp:Label></h2>
                                                        <span class="text-warning small ml-2 d-flex align-items-center">
                                                            <%-- <span class="ti-arrow-down mr-2"></span>--%>
                                                            <span class="badge bg-warning-bright text-warning rounded d-inline-flex align-items-center"><i class="fa fa-sign-out"></i></span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-lg-6 mb-3 mb-xl-0">
                                                    <p class="mb-2">Transfers</p>
                                                    <div class="d-flex align-items-end">
                                                        <h2 class="mb-0 line-height-30 font-size-30">
                                                            <asp:Label ID="lblNoTransfered" runat="server"></asp:Label></h2>
                                                        <span class="text-success small ml-2 d-flex align-items-center">
                                                            <%--<span class="ti-arrow-up mr-2"></span>--%>
                                                            <span class="badge bg-success-bright text-success rounded d-inline-flex align-items-center"><i class="fa fa-exchange"></i></span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-lg-6">
                                                    <p class="mb-2">Deaths</p>
                                                    <div class="d-flex align-items-end">
                                                        <h2 class="mb-0 line-height-30 font-size-30">
                                                            <asp:Label ID="lblNoOfDeath" runat="server"></asp:Label></h2>
                                                        <span class="text-danger small ml-2 d-flex align-items-center">
                                                            <%--<span class="ti-arrow-down mr-2"></span>--%>
                                                            <span class="badge bg-danger-bright text-danger rounded d-inline-flex align-items-center"><i class="ti-close"></i></span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--Chart Begins--%>

                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title d-flex justify-content-between">
                                        <h6 class="card-title">Number of Staff in Each L.G.A</h6>
                                    </div>

                                    <div id="aspCharts">
                                        <asp:Chart ID="Chart1" runat="server" CssClass="col-md-4">
                                            <%-- "table  table-bordered table-condensed table-responsive"--%>
                                            <Series>
                                                <asp:Series Name="Series1" XValueMember="servingLGA_Chart" YValueMembers="NEWCOUNT"></asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" AlignmentStyle="PlotPosition">
                                                    <AxisY Title="Number of Staff" TitleForeColor="Green" TitleFont="Microsoft Sans Serif, 12pt"></AxisY>
                                                    <AxisX Title="Local Governments" TitleForeColor="Red" IsLabelAutoFit="True" TitleFont="Microsoft Sans Serif, 12pt">
                                                        <LabelStyle Angle="-90" Interval="1" />
                                                    </AxisX>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
                                    </div>
                                    <%--<div id="sales"></div>--%>
                                </div>
                            </div>

                            <%-- Chart Ends--%>

                            <%--<div class="row">
                                <div class="col-md-8">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="card-title d-flex justify-content-between">
                                                <h6 class="card-title">Revenue by Country</h6>
                                                <div>
                                                    <a href="#" class="btn btn-outline-light btn-sm mr-2">
                                                        <i class="fa fa-refresh"></i>
                                                    </a>
                                                    <div class="dropdown">
                                                        <a href="#" data-toggle="dropdown"
                                                            class="btn btn-outline-light btn-sm"
                                                            aria-haspopup="true" aria-expanded="false">
                                                            <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="#">Action</a>
                                                            <a class="dropdown-item" href="#">Another action</a>
                                                            <a class="dropdown-item" href="#">Something else here</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <p>Total Revenue</p>
                                            <h2 class="mb-4 font-size-35">$469,453</h2>
                                            <div class="progress mb-3" style="height: 10px">
                                                <div class="progress-bar w-25 bg-secondary-gradient" role="progressbar"></div>
                                                <div class="progress-bar w-50 bg-info-gradient" role="progressbar"></div>
                                                <div class="progress-bar w-25 bg-warning-gradient" role="progressbar"></div>
                                                <div class="progress-bar w-25 bg-success-gradient" role="progressbar"></div>
                                                <div class="progress-bar w-50 bg-danger-gradient" role="progressbar"></div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="mb-0">
                                                        <span class="fa fa-circle text-danger mr-1"></span>
                                                        Russia
                                                    </p>
                                                    <h5 class="mt-2 mb-0">25%</h5>
                                                </div>
                                                <div class="col">
                                                    <p class="mb-0">
                                                        <span class="fa fa-circle text-info mr-1"></span>
                                                        Australia
                                                    </p>
                                                    <h5 class="mt-2 mb-0">50%</h5>
                                                </div>
                                                <div class="col">
                                                    <p class="mb-0">
                                                        <span class="fa fa-circle text-warning mr-1"></span>
                                                        China
                                                    </p>
                                                    <h5 class="mt-2 mb-0">15%</h5>
                                                </div>
                                                <div class="col">
                                                    <p class="mb-0">
                                                        <span class="fa fa-circle text-success mr-1"></span>
                                                        Tunisia
                                                    </p>
                                                    <h5 class="mt-2 mb-0">20%</h5>
                                                </div>
                                                <div class="col">
                                                    <p class="mb-0">
                                                        <span class="fa fa-circle text-danger mr-1"></span>
                                                        Spain
                                                    </p>
                                                    <h5 class="mt-2 mb-0">20%</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card bg-info">
                                        <div class="card-body text-center">
                                            <p>Total Sales</p>
                                            <h2 class="font-size-35 mb-3">$58,000</h2>
                                            <p class="mb-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto, consequatur.</p>
                                            <div class="d-inline-flex align-items-center">
                                                <span class="text-success d-inline-flex align-items-center mr-2 badge bg-white rounded">
                                                    <span class="ti-arrow-up mr-2"></span>5.1%
                                                </span>Up from past week
                                            </div>
                                            <div class="mt-4">
                                                <a href="#" class="btn bg-white">View Detail</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>

                            <%-- <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="card-title">Recent Orders</h6>
                                        <div>
                                            <a href="#" class="btn btn-outline-light btn-sm mr-2">
                                                <i class="fa fa-refresh"></i>
                                            </a>
                                            <div class="dropdown">
                                                <a href="#" data-toggle="dropdown"
                                                    class="btn btn-outline-light btn-sm"
                                                    aria-haspopup="true" aria-expanded="false">
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table id="recent-orders" class="table table-lg">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Product Name</th>
                                                            <th>Customer</th>
                                                            <th>Total Price</th>
                                                            <th>Status</th>
                                                            <th>Date</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <a href="#">3145</a>
                                                            </td>
                                                            <td>
                                                                <a href="product-detail.html" class="d-flex align-items-center">
                                                                    <img width="40" src="../../assets/media/image/products/product1.png"
                                                                        class="rounded mr-3" alt="grape" />
                                                                    <span>HP Pavilion 15-EC0005NT AMD</span>
                                                                </a>
                                                            </td>
                                                            <td>Dollie Bullock</td>
                                                            <td>$230</td>
                                                            <td>
                                                                <span
                                                                    class="badge bg-secondary-bright text-secondary">On pre-order (not paid)</span>
                                                            </td>
                                                            <td>2018/08/28 21:24:36</td>
                                                            <td>
                                                                <a href="#" class="text-secondary" data-toggle="tooltip" title="Edit">
                                                                    <i class="ti-pencil"></i>
                                                                </a>
                                                                <a href="#" class="text-danger ml-2" data-toggle="tooltip" title="Delete">
                                                                    <i class="ti-trash"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="#">7321</a>
                                                            </td>
                                                            <td>
                                                                <a href="product-detail.html" class="d-flex align-items-center">
                                                                    <img width="40" src="../../assets/media/image/products/product2.png"
                                                                        class="rounded mr-3" alt="banana">
                                                                    <span>Samsung Galaxy A51 128 GB</span>
                                                                </a>
                                                            </td>
                                                            <td>Holmes Hines</td>
                                                            <td>$300</td>
                                                            <td>
                                                                <span class="badge bg-success-bright text-success">Payment accepted</span>
                                                            </td>
                                                            <td>2018/08/28 21:24:36</td>
                                                            <td>
                                                                <a href="#" class="text-secondary" data-toggle="tooltip" title="Edit">
                                                                    <i class="ti-pencil"></i>
                                                                </a>
                                                                <a href="#" class="text-danger ml-2" data-toggle="tooltip" title="Delete">
                                                                    <i class="ti-trash"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="#">9342</a>
                                                            </td>
                                                            <td>
                                                                <a href="product-detail.html" class="d-flex align-items-center">
                                                                    <img width="40" src="../../assets/media/image/products/product3.png"
                                                                        class="rounded mr-3" alt="cherry">
                                                                    <span>Snopy SN-BT96 Pretty</span>
                                                                </a>
                                                            </td>
                                                            <td>Serena Glover</td>
                                                            <td>$250</td>
                                                            <td>
                                                                <span class="badge bg-danger-bright text-danger">Payment error</span>
                                                            </td>
                                                            <td>2018/08/28 21:24:36</td>
                                                            <td>
                                                                <a href="#" class="text-secondary" data-toggle="tooltip" title="Edit">
                                                                    <i class="ti-pencil"></i>
                                                                </a>
                                                                <a href="#" class="text-danger ml-2" data-toggle="tooltip" title="Delete">
                                                                    <i class="ti-trash"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="#">6416</a>
                                                            </td>
                                                            <td>
                                                                <a href="product-detail.html" class="d-flex align-items-center">
                                                                    <img width="40" src="../../assets/media/image/products/product4.png"
                                                                        class="rounded mr-3" alt="papaya">
                                                                    <span>Ultimate Ears Wonderboom</span>
                                                                </a>
                                                            </td>
                                                            <td>Dianne Prince</td>
                                                            <td>$550</td>
                                                            <td>
                                                                <span class="badge bg-success-bright text-success">Payment accepted</span>
                                                            </td>
                                                            <td>2018/08/28 21:24:36</td>
                                                            <td>
                                                                <a href="#" class="text-secondary" data-toggle="tooltip" title="Edit">
                                                                    <i class="ti-pencil"></i>
                                                                </a>
                                                                <a href="#" class="text-danger ml-2" data-toggle="tooltip" title="Delete">
                                                                    <i class="ti-trash"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="#">92327</a>
                                                            </td>
                                                            <td>
                                                                <a href="product-detail.html" class="d-flex align-items-center">
                                                                    <img width="40" src="../../assets/media/image/products/product5.png"
                                                                        class="rounded mr-3" alt="pig">
                                                                    <span>Canon Pixma E3140 Printer</span>
                                                                </a>
                                                            </td>
                                                            <td>Morgan Pitts</td>
                                                            <td>$280</td>
                                                            <td>
                                                                <span class="badge bg-warning-bright text-warning">Preparing the order</span>
                                                            </td>
                                                            <td>2018/08/28 21:24:36</td>
                                                            <td>
                                                                <a href="#" class="text-secondary" data-toggle="tooltip" title="Edit">
                                                                    <i class="ti-pencil"></i>
                                                                </a>
                                                                <a href="#" class="text-danger ml-2" data-toggle="tooltip" title="Delete">
                                                                    <i class="ti-trash"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="#">3013</a>
                                                            </td>
                                                            <td>
                                                                <a href="product-detail.html" class="d-flex align-items-center">
                                                                    <img width="40" src="../../assets/media/image/products/product6.png"
                                                                        class="rounded mr-3" alt="pineapple">
                                                                    <span>Canon 4000D 18-55 MM</span>
                                                                </a>
                                                            </td>
                                                            <td>Merrill Richardson</td>
                                                            <td>$128</td>
                                                            <td>
                                                                <span class="badge bg-info-bright text-info">Awaiting PayPal payment</span>
                                                            </td>
                                                            <td>2018/08/28 21:24:36</td>
                                                            <td>
                                                                <a href="#" class="text-secondary" data-toggle="tooltip" title="Edit">
                                                                    <i class="ti-pencil"></i>
                                                                </a>
                                                                <a href="#" class="text-danger ml-2" data-toggle="tooltip" title="Delete">
                                                                    <i class="ti-trash"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="#">10323</a>
                                                            </td>
                                                            <td>
                                                                <a href="product-detail.html" class="d-flex align-items-center">
                                                                    <img width="40" src="../../assets/media/image/products/product7.png"
                                                                        class="rounded mr-3" alt="pomegranate">
                                                                    <span>Lenovo Tab E10 TB-X104F 32GB 10.1"</span>
                                                                </a>
                                                            </td>
                                                            <td>Krista Mathis</td>
                                                            <td>$500</td>
                                                            <td>
                                                                <span class="badge bg-secondary-bright text-secondary">Shipped</span>
                                                            </td>
                                                            <td>2018/08/28 21:24:36</td>
                                                            <td>
                                                                <a href="#" class="text-secondary" data-toggle="tooltip" title="Edit">
                                                                    <i class="ti-pencil"></i>
                                                                </a>
                                                                <a href="#" class="text-danger ml-2" data-toggle="tooltip" title="Delete">
                                                                    <i class="ti-trash"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="#">4218</a>
                                                            </td>
                                                            <td>
                                                                <a href="product-detail.html" class="d-flex align-items-center">
                                                                    <img width="40" src="../../assets/media/image/products/product8.png"
                                                                        class="rounded mr-3" alt="raspberry">
                                                                    <span>Samsung 55Q60RAT 55"</span>
                                                                </a>
                                                            </td>
                                                            <td>Frankie Hewitt</td>
                                                            <td>$300</td>
                                                            <td>
                                                                <span class="badge bg-success-bright text-success">Remote payment accepted</span>
                                                            </td>
                                                            <td>2018/08/28 21:24:36</td>
                                                            <td>
                                                                <a href="#" class="text-secondary" data-toggle="tooltip" title="Edit">
                                                                    <i class="ti-pencil"></i>
                                                                </a>
                                                                <a href="#" class="text-danger ml-2" data-toggle="tooltip" title="Delete">
                                                                    <i class="ti-trash"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="#">3158</a>
                                                            </td>
                                                            <td>
                                                                <a href="product-detail.html" class="d-flex align-items-center">
                                                                    <img width="40" src="../../assets/media/image/products/product9.png"
                                                                        class="rounded mr-3" alt="strawberry">
                                                                    <span>Toshiba Canvio Basic 1TB 2.5"</span>
                                                                </a>
                                                            </td>
                                                            <td>Hayden Fitzgerald</td>
                                                            <td>$200</td>
                                                            <td>
                                                                <span class="badge bg-success-bright text-success">Delivered</span>
                                                            </td>
                                                            <td>2018/08/28 21:24:36</td>
                                                            <td>
                                                                <a href="#" class="text-secondary" data-toggle="tooltip" title="Edit">
                                                                    <i class="ti-pencil"></i>
                                                                </a>
                                                                <a href="#" class="text-danger ml-2" data-toggle="tooltip" title="Delete">
                                                                    <i class="ti-trash"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="#">9610</a>
                                                            </td>
                                                            <td>
                                                                <a href="product-detail.html" class="d-flex align-items-center">
                                                                    <img width="40" src="../../assets/media/image/products/product10.png"
                                                                        class="rounded mr-3" alt="watermelon">
                                                                    <span>Fms Wireless Controller</span>
                                                                </a>
                                                            </td>
                                                            <td>Cole Holcomb</td>
                                                            <td>$700</td>
                                                            <td>
                                                                <span
                                                                    class="badge bg-secondary-bright text-secondary">On pre-order (not paid)</span>
                                                            </td>
                                                            <td>2018/08/28 21:24:36</td>
                                                            <td>
                                                                <a href="#" class="text-secondary" data-toggle="tooltip" title="Edit">
                                                                    <i class="ti-pencil"></i>
                                                                </a>
                                                                <a href="#" class="text-danger ml-2" data-toggle="tooltip" title="Delete">
                                                                    <i class="ti-trash"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-8 col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h6 class="card-title">Activities</h6>
                                            <div id="ecommerce-activity-chart"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-12">
                                    <div class="card">
                                        <div class="card-body pb-0">
                                            <div class="d-flex justify-content-between align-items-start mb-3">
                                                <h6 class="card-title mb-0">Top Sales</h6>
                                                <a href="#" class="small">All Sales</a>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>Product</th>
                                                        <th>Total Sales</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <a href="#">Apple</a>
                                                        </td>
                                                        <td>21</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <a href="#">Samsung <span class="badge badge-danger ml-1">New</span></a>
                                                        </td>
                                                        <td>52</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <a href="#">Huawei</a>
                                                        </td>
                                                        <td>74</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <a href="#">General Mobile</a>
                                                        </td>
                                                        <td>25</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <a href="#">Xiaomi</a>
                                                        </td>
                                                        <td>11</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <a href="#">Nokia</a>
                                                        </td>
                                                        <td>8</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <a href="#">Sony</a>
                                                        </td>
                                                        <td>5</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <a href="#">Alcatel</a>
                                                        </td>
                                                        <td>5</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <h6 class="card-title d-flex justify-content-between">
                                                <span>Income Distribution</span>
                                                <span class="dropdown">
                                                    <a class="btn btn-outline-light btn-sm dropdown-toggle" href="#"
                                                        data-toggle="dropdown">USA</a>
                                                    <span class="dropdown-menu dropdown-menu-right">
                                                        <a href="#" class="dropdown-item">USA</a>
                                                        <a href="#" class="dropdown-item">Germany</a>
                                                        <a href="#" class="dropdown-item">France</a>
                                                        <a href="#" class="dropdown-item">Italy</a>
                                                    </span>
                                                </span>
                                            </h6>
                                            <div id="vmap_usa_en" style="height: 300px"></div>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-borderless table-lg table-striped mb-0">
                                                <thead>
                                                    <tr>
                                                        <th class="wd-40">States</th>
                                                        <th class="wd-25 text-center">Orders</th>
                                                        <th class="wd-35 text-center">Earnings</th>
                                                        <th class="wd-35"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>California</td>
                                                        <td class="text-center">12,201</td>
                                                        <td class="text-center text-success">$150,200.80</td>
                                                        <td class="text-right">
                                                            <a href="#" data-toggle="tooltip" title="Detail">
                                                                <i class="fa fa-external-link"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Texas</td>
                                                        <td class="text-center">11,950</td>
                                                        <td class="text-center text-success">$138,910.20</td>
                                                        <td class="text-right">
                                                            <a href="#" data-toggle="tooltip" title="Detail">
                                                                <i class="fa fa-external-link"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Wyoming</td>
                                                        <td class="text-center">11,198</td>
                                                        <td class="text-center text-danger">$132,050.00</td>
                                                        <td class="text-right">
                                                            <a href="#" data-toggle="tooltip" title="Detail">
                                                                <i class="fa fa-external-link"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Florida</td>
                                                        <td class="text-center">9,885</td>
                                                        <td class="text-center text-success">$127,762.10</td>
                                                        <td class="text-right">
                                                            <a href="#" data-toggle="tooltip" title="Detail">
                                                                <i class="fa fa-external-link"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>New York</td>
                                                        <td class="text-center">21,198</td>
                                                        <td class="text-center text-danger">$432,410.00</td>
                                                        <td class="text-right">
                                                            <a href="#" data-toggle="tooltip" title="Detail">
                                                                <i class="fa fa-external-link"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Montana</td>
                                                        <td class="text-center">2,885</td>
                                                        <td class="text-center text-success">$7,100.00</td>
                                                        <td class="text-right">
                                                            <a href="#" data-toggle="tooltip" title="Detail">
                                                                <i class="fa fa-external-link"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <h6 class="card-title">Reviews</h6>
                                            <div class="card-scroll">
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item d-flex pl-0 pr-0">
                                                        <a href="#">
                                                            <figure class="avatar mr-3">
                                                                <img src="../../assets/media/image/user/man_avatar1.jpg" class="rounded-circle" alt="image">
                                                            </figure>
                                                        </a>
                                                        <div class="flex-grow-1">
                                                            <div class="d-flex justify-content-between">
                                                                <a href="#">
                                                                    <h6>Valentine Maton</h6>
                                                                    <ul class="list-inline mb-1">
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">(5)</li>
                                                                    </ul>
                                                                </a>
                                                                <div class="ml-auto">
                                                                    <div class="dropdown">
                                                                        <a href="#" data-toggle="dropdown"
                                                                            class="btn btn-outline-light btn-sm"
                                                                            aria-haspopup="true" aria-expanded="false">
                                                                            <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a href="#" class="dropdown-item">View</a>
                                                                            <a href="#" class="dropdown-item">Send Message</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio, tempora.</p>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item d-flex pl-0 pr-0">
                                                        <a href="#">
                                                            <figure class="avatar mr-3">
                                                                <img src="../../assets/media/image/user/man_avatar2.jpg" class="rounded-circle" alt="image">
                                                            </figure>
                                                        </a>
                                                        <div class="flex-grow-1">
                                                            <div class="d-flex justify-content-between">
                                                                <a href="#">
                                                                    <h6>Valentine Maton</h6>
                                                                    <ul class="list-inline mb-1">
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star-half-o text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star-o"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">(3.5)</li>
                                                                    </ul>
                                                                </a>
                                                                <div class="ml-auto">
                                                                    <div class="dropdown">
                                                                        <a href="#" data-toggle="dropdown"
                                                                            class="btn btn-outline-light btn-sm"
                                                                            aria-haspopup="true" aria-expanded="false">
                                                                            <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a href="#" class="dropdown-item">View</a>
                                                                            <a href="#" class="dropdown-item">Send Message</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio, tempora.</p>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item d-flex pl-0 pr-0">
                                                        <a href="#">
                                                            <figure class="avatar mr-3">
                                                                <img src="../../assets/media/image/user/man_avatar3.jpg" class="rounded-circle" alt="image">
                                                            </figure>
                                                        </a>
                                                        <div class="flex-grow-1">
                                                            <div class="d-flex justify-content-between">
                                                                <a href="#">
                                                                    <h6>Valentine Maton</h6>
                                                                    <ul class="list-inline mb-1">
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star-half-o text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">(4.5)</li>
                                                                    </ul>
                                                                </a>
                                                                <div class="ml-auto">
                                                                    <div class="dropdown">
                                                                        <a href="#" data-toggle="dropdown"
                                                                            class="btn btn-outline-light btn-sm"
                                                                            aria-haspopup="true" aria-expanded="false">
                                                                            <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a href="#" class="dropdown-item">View</a>
                                                                            <a href="#" class="dropdown-item">Send Message</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio, tempora.</p>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item d-flex pl-0 pr-0">
                                                        <a href="#">
                                                            <figure class="avatar mr-3">
                                                                <img src="../../assets/media/image/user/man_avatar4.jpg" class="rounded-circle" alt="image">
                                                            </figure>
                                                        </a>
                                                        <div class="flex-grow-1">
                                                            <div class="d-flex justify-content-between">
                                                                <a href="#">
                                                                    <h6>Valentine Maton</h6>
                                                                    <ul class="list-inline mb-1">
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star text-warning"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">
                                                                            <i class="fa fa-star-o"></i>
                                                                        </li>
                                                                        <li class="list-inline-item mb-0">(4)</li>
                                                                    </ul>
                                                                </a>
                                                                <div class="ml-auto">
                                                                    <div class="dropdown">
                                                                        <a href="#" data-toggle="dropdown"
                                                                            class="btn btn-outline-light btn-sm"
                                                                            aria-haspopup="true" aria-expanded="false">
                                                                            <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                                                        </a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a href="#" class="dropdown-item">View</a>
                                                                            <a href="#" class="dropdown-item">Send Message</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio, tempora.</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="mt-3 text-center">
                                                <a href="#" class="btn btn-primary">View All
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between">
                                                <h6 class="card-title">Hot Products</h6>
                                                <div>
                                                    <div class="dropdown">
                                                        <a href="#" data-toggle="dropdown"
                                                            class="btn btn-outline-light btn-sm"
                                                            aria-haspopup="true" aria-expanded="false">
                                                            <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="#">Action</a>
                                                            <a class="dropdown-item" href="#">Another action</a>
                                                            <a class="dropdown-item" href="#">Something else here</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="hot-products"></div>
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <i class="fa fa-circle mr-1 text-primary"></i>Iphone
                                                </li>
                                                <li class="list-inline-item">
                                                    <i class="fa fa-circle mr-1 text-secondary"></i>Samsung
                                                </li>
                                                <li class="list-inline-item">
                                                    <i class="fa fa-circle mr-1 text-success"></i>Huawei
                                                </li>
                                                <li class="list-inline-item">
                                                    <i class="fa fa-circle mr-1 text-warning"></i>General Mobile
                                                </li>
                                                <li class="list-inline-item">
                                                    <i class="fa fa-circle mr-1 text-danger"></i>Xiaomi
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                        <!-- ./ Content -->

                        <!-- Footer -->
                        <footer class="content-footer">
                            <div>© 2021 LOGOSERV <%--- <a href="http://laborasyon.com" target="_blank">Laborasyon</a>--%></div>
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

    <!-- Daterangepicker -->
    <script src="../../vendors/datepicker/daterangepicker.js"></script>

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

    <%-- <!-- Jquery -->
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
            <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
</body>
</html>
