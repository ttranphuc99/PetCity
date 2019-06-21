<%-- 
    Document   : edit-profile
    Created on : Jun 21, 2019, 4:30:58 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<link rel="stylesheet" href="/PetCity/css/member-page/edit-profile.css">
<div id="snackbar">
    <s:property value="%{mess}" />
</div>
<div class="title mb-4">Edit Profile</div>

<div class="container-fluid">
    <form action="/PetCity/updateProfile" method="POST">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" class="form-control" value="<s:property value='%{dto.username}'/>"
                   readonly>
        </div>

        <div class="form-group">
            <label for="fullname">Fullname:</label>
            <input type="text" name="fullname" id="fullname" class="form-control" value="<s:property value='%{dto.fullname}'/>"
                   required maxlength="50">
        </div>

        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" name="address" id="address" class="form-control" value="<s:property value='%{dto.address}'/>"
                   required>
        </div>

        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="number" name="phone" id="phone" class="form-control" min="0" value="<s:property value='%{dto.phone}'/>"
                   required oninput="checkPhone('phone')">
        </div>

        <label>Gender:</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="gender" id="rdMale" value="Male" 
                   required <s:if test="%{dto.gender}">checked</s:if> >
            <label class="form-check-label" for="rdMale">Male</label>
        </div>

        <div class="form-check">
            <input class="form-check-input" type="radio" name="gender" id="rdFemale" value="Female" 
                   required <s:if test="%{!dto.gender}">checked</s:if> >
            <label class="form-check-label" for="rdFemale">Female</label>
        </div>

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Update profile">
        </div>
    </form>
    <script src="/PetCity/js/public-page/validate-signup.js"></script>
    <script src="/PetCity/js/public-page/show-detail-acces.js"></script>
</div>
<%@include file="end-sider.jsp" %>
