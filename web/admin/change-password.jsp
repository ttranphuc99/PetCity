<%-- 
    Document   : change-pasword
    Created on : Jun 3, 2019, 10:15:03 PM
    Author     : Thien Phuc
--%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="sider.jsp" %>
<div id="snackbar">
    <s:property value="%{mess}" />
</div>
<div class="title">Change password</div>

<div class="container-fluid">
    <form action="/PetCity/changePassword" method="POST">
        <input type="hidden" name="username" value="<s:property value="%{#session.USERNAME}"/>">
        
        <div class="form-group">
            <label for="oldPass">Old Password:</label>
            <input type="password" name="oldPassword" id="oldPass" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="newPass">New Password:</label>
            <input type="password" name="newPassword" id="newPass" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="oldPass">Confirm Password:</label>
            <input type="password" name="conPassword" id="conPass" class="form-control" required>
        </div>

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Change Password">
        </div>
    </form>
</div>
<%@include file="end-sider.jsp" %>