<%-- 
    Document   : home
    Created on : Jun 2, 2019, 7:25:18 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/publicPage/header.jsp" %>
<link rel="stylesheet" href="/css/member-page/sider.css">

<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <ul class="list-unstyled components">
                <li>
                    <a href="#view-profile" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">View Profile</a>
                    <ul class="collapse list-unstyled" id="view-profile">
                        <li>
                            <a href="/loadProfile" >Edit profile</a>
                        </li>
                        <li>
                            <a href="/member/change-password.jsp">Change password</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#manage-service" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Manage Pet</a>
                    <ul class="collapse list-unstyled" id="manage-service">
                        <li>
                            <a href="/viewListPet?page=1">View list pet</a>
                        </li>
                        <li>
                            <a href="/loadCategoryType?locationPlace=pet">Add new pet</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#view-invoice" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">View Invoice</a>
                    <ul class="collapse list-unstyled" id="view-invoice">
                        <li>
                            <a href="/viewListAccessoryInvoice">Accessory invoices</a>
                        </li>
                        <li>
                            <a href="/viewListServiceInvoice">Service invoices</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>

        <!-- Page Content  -->
        <div id="content">
            <div class="main-content">
            