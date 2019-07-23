<%-- 
    Document   : add-pet
    Created on : Jun 22, 2019, 7:40:41 AM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<link rel="stylesheet" href="/css/member-page/edit-profile.css">
<div id="snackbar">
    <s:property value="%{mess}" />
</div> 

<div class="title mb-4">Add New Pet</div>

<div class="container-fluid">
    <form action="/addPet" method="POST" enctype="multipart/form-data" onsubmit="return validate();">
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" class="form-control" required maxlength="100">
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label>Gender:</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="rdMale" value="Male" required>
                        <label class="form-check-label" for="rdMale">Male</label>
                        <br>
                        <input class="form-check-input" type="radio" name="gender" id="rdFemale" value="Female" required>
                        <label class="form-check-label" for="rdFemale">Female</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label>For type:</label>
                    <select name="type" class="custom-select" required>
                        <s:iterator value="listType">
                            <option value='<s:property value="%{id}" />'>
                                <s:property value="%{name}"/>
                            </option>
                        </s:iterator>
                    </select>
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label for="birthYear">BirthYear:</label>
                    <input type="number" id="birthYear" name="birthYear" class="form-control" min="2000" max="2019" required>
                </div>
            </div>
        </div>

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Add">
        </div>
    </form>
</div>

<%@include file="end-sider.jsp" %>
