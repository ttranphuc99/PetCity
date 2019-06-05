<%-- 
    Document   : add-admin
    Created on : Jun 4, 2019, 6:51:50 AM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<div class="title mb-4">Add a admin</div>

<div class="container-fluid">
    <form action="/PetCity/addAdmin" method="POST">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="conPassword">Confirm Password:</label>
            <input type="password" name="conPassword" id="conPassword" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="fullname">Fullname:</label>
            <input type="text" name="fullname" id="fullname" class="form-control" required>
        </div>

        <label>Gender:</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="gender" id="rdMale" value="Male" required>
            <label class="form-check-label" for="rdMale">Male</label>
        </div>

        <div class="form-check">
            <input class="form-check-input" type="radio" name="gender" id="rdFemale" value="Female" required>
            <label class="form-check-label" for="rdFemale">Female</label>
        </div>

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Add admin">
        </div>
    </form>
</div>
<%@include file="end-sider.jsp" %>