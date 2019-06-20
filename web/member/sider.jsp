<%-- 
    Document   : home
    Created on : Jun 2, 2019, 7:25:18 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/publicPage/header.jsp" %>
<link rel="stylesheet" href="/PetCity/css/member-page/sider.css">

<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <ul class="list-unstyled components">
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
                            <a href="#">Accessory invoices</a>
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
            </div>
        </div>
    </div>
</div>

<%@include file="/publicPage/footer.jsp" %>