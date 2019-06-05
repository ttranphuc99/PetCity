<%-- 
    Document   : add-staff
    Created on : Jun 5, 2019, 7:05:16 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<div class="title mb-4">Add new staff</div>

<div class="container-fluid">
    <form action="/PetCity/addStaff" method="POST" enctype="multipart/form-data">
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="accName">Name:</label>
                    <input type="text" id="accName" name="name" class="form-control" required>
                </div>
            </div>

            <div class="col-3">
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

            <div class="col-3">
                <div class="form-group pt-4">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck1" name="available">
                        <label class="custom-control-label" for="customCheck1">Is Available</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="form-group">
                    <label class="control-label">Image:</label>
                    <input type="file" name="image" class="filestyle" data-icon="false">
                </div>
            </div>
        </div>

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Add">
        </div>
    </form>
</div>
<%@include file="end-sider.jsp" %>