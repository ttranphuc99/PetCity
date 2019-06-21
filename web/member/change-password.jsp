<%-- 
    Document   : change-password
    Created on : Jun 21, 2019, 5:44:12 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<link rel="stylesheet" href="/PetCity/css/member-page/edit-profile.css">
<div id="snackbar">
    <s:property value="%{mess}" />
</div>
<div class="title">Change password</div>

<div class="container-fluid">
    <form action="/PetCity/memberChangePassword" method="POST">
        <input type="hidden" name="username" value="<s:property value="%{#session.USERNAME}"/>">
        
        <div class="form-group">
            <label for="oldPass">Old Password:</label>
            <input type="password" name="oldPassword" id="oldPass" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="newPass">New Password:</label>
            <input type="password" name="newPassword" id="newPass" class="form-control" required minlength="6" maxlength="20">
        </div>

        <div class="form-group">
            <label for="oldPass">Confirm Password:</label>
            <input type="password" name="conPassword" id="conPass" class="form-control" required minlength="6" maxlength="20" oninput="checkMatchConfirmPass('conPass', 'newPass')">
        </div>

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Change Password">
        </div>
    </form>
</div>
<script src="/PetCity/js/public-page/validate-signup.js"></script>
<%@include file="end-sider.jsp" %>
