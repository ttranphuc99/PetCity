<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Pet City - Admin Page</title>
        <link rel="stylesheet" type="text/css" href="/PetCity/css/bootstrap/bootstrap.css">
        <link rel="stylesheet" href="/PetCity/css/admin-page/sider.css">
        <link rel="stylesheet" href="/PetCity/css/admin-page/content.css">
        <link rel="stylesheet" href="/PetCity/css/public-page/snackbar.css">
        <script src="/PetCity/js/bootstrap/jquery-1.9.1.min.js"></script>
        <script src="/PetCity/js/bootstrap/popper.min.js"></script>
        <script src="/PetCity/js/bootstrap/bootstrap.js"></script>
    </head>

    <body>
        <div class="wrapper">
            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h5>Welcome, <s:property value="%{#session.FULLNAME}"/></h5>
                    <a href="/PetCity/logout" class="btn btn-danger" role="button">Logout</a>
                </div>

                <ul class="list-unstyled components">
                    <li>
                        <a href="/PetCity/admin/home.jsp">Dashboard</a>
                    </li>
                    <li>
                        <a href="#view-profile" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">View Profile</a>
                        <ul class="collapse list-unstyled" id="view-profile">
                            <li>
                                <a href="/PetCity/adminViewProfile?username=<s:property value='%{#session.USERNAME}'/>" >Edit profile</a>
                            </li>
                            <li>
                                <a href="/PetCity/admin/change-password.jsp">Change password</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#manage-user" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Manage User</a>
                        <ul class="collapse list-unstyled" id="manage-user">
                            <li>
                                <a href="/PetCity/adminViewListUser?page=1">View list member</a>
                            </li>
                            <li>
                                <a href="/PetCity/adminViewListAdmin?page=1">View list admin</a>
                            </li>
                            <li>
                                <a href="/PetCity/admin/add-admin.jsp">Add new admin</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#manage-accessory" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Manage Accessory</a>
                        <ul class="collapse list-unstyled" id="manage-accessory">
                            <li>
                                <a href="/PetCity/adminViewListAccessory?page=1">View list accessory</a>
                            </li>
                            <li>
                                <a href="/PetCity/loadCategoryType?locationPlace=accessory">Add new accessory</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#manage-service" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Manage Service</a>
                        <ul class="collapse list-unstyled" id="manage-service">
                            <li>
                                <a href="/PetCity/adminViewListService?page=1">View list service</a>
                            </li>
                            <li>
                                <a href="/PetCity/loadCategoryType?locationPlace=service">Add new service</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#manage-staff" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Manage Staff</a>
                        <ul class="collapse list-unstyled" id="manage-staff">
                            <li>
                                <a href="/PetCity/adminViewListStaff?page=1">View list staff</a>
                            </li>
                            <li>
                                <a href="/PetCity/admin/add-staff.jsp">Add new staff</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#view-invoice" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">View Invoice</a>
                        <ul class="collapse list-unstyled" id="view-invoice">
                            <li>
                                <a href="/PetCity/viewListAccessoryInvoice">Accessory invoices</a>
                            </li>
                            <li>
                                <a href="#">Service invoices</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>

            <!-- Page Content  -->
            <div id="content">
                <div class="main-content">