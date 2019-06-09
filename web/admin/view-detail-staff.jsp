<%-- 
    Document   : add-staff
    Created on : Jun 5, 2019, 7:05:16 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="sider.jsp" %>
<div class="title mb-4">Add new staff</div>

<div class="container-fluid">
    <form action="/PetCity/updateStaff" method="POST" enctype="multipart/form-data" onsubmit="return validate();">
        <input type="hidden" value="<s:property value="%{dto.id}"/>" name="id"/>
        <input type="hidden" value="<s:property value="%{dto.image}"/>" name="imgName"/>
        
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="accName">Name:</label>
                    <input type="text" id="accName" name="name" class="form-control" required maxlength="50"
                           value="<s:property value="%{dto.name}"/>">
                </div>
            </div>

            <div class="col-3">
                <div class="form-group">
                    <label>Gender:</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="rdMale" value="Male" required
                               <s:if test="%{dto.gender}">checked</s:if>>
                        <label class="form-check-label" for="rdMale">Male</label>
                        <br>
                        <input class="form-check-input" type="radio" name="gender" id="rdFemale" value="Female" required
                               <s:if test="%{!dto.gender}">checked</s:if>>
                        <label class="form-check-label" for="rdFemale">Female</label>
                    </div>
                </div>
            </div>

            <div class="col-3">
                <div class="form-group pt-4">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck1" name="available"
                               <s:if test="%{dto.available}">checked</s:if>>
                        <label class="custom-control-label" for="customCheck1">Is Available</label>
                    </div>
                </div>
            </div>
        </div>
                        
        <div class="row">
            <div class="col-12">
                <div class="justify-content-center">
                    <img src='/PetCity/img/file/staff/<s:property value="%{dto.image}"/>' style="max-width: 200px"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="form-group">
                    <label class="control-label">Image:</label>
                    <input type="file" name="image" id="image" class="filestyle" data-icon="false">
                </div>
            </div>
        </div>

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Update">
        </div>
    </form>
    <script src="/PetCity/js/admin-page/validate-add-form.js"></script>
</div>
<%@include file="end-sider.jsp" %>