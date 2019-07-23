<%-- 
    Document   : edit-profile
    Created on : Jun 3, 2019, 8:46:03 PM
    Author     : Thien Phuc
--%>

<%@include file="sider.jsp" %>
<div class="title">Edit profile</div>

<div class="container-fluid">
    <form action="/adminEditProfile" method="POST">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" class="form-control" name="username" value="<s:property value='%{dto.username}'/>" readonly>
        </div>

        <div class="form-group">
            <label for="fullname">Fullname:</label>
            <input type="text" id="fullname" class="form-control" name="fullname" required maxlength="50"
                   value="<s:property value='%{dto.fullname}'/>" >
        </div>

        <label>Gender:</label>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="gender" id="rdMale" value="Male" required
                   <s:if test="%{dto.gender}">checked</s:if> >
            <label class="form-check-label" for="rdMale">Male</label>
        </div>

        <div class="form-check">
            <input class="form-check-input" type="radio" name="gender" id="rdFemale" value="Female" required
                   <s:if test="%{!dto.gender}">checked</s:if> >
            <label class="form-check-label" for="rdFemale">Female</label>
        </div>

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Update">
        </div>
    </form>
</div>
<%@include file="end-sider.jsp" %>