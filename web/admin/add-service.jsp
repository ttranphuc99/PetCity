<%-- 
    Document   : add-service
    Created on : Jun 5, 2019, 6:46:45 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<link rel="stylesheet" href="/css/admin-page/add-service.css">
<div class="title mb-4">Add new service</div>

<div class="container-fluid">
    <form action="/addService" method="POST" enctype="multipart/form-data" onsubmit="return validate();">
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="accName">Service Name:</label>
                    <input type="text" id="accName" name="name" class="form-control" required maxlength="50">
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label for="accPrice">Price:</label>
                    <input type="number" step="0.01" id="accPrice" name="price" class="form-control" min="0" required>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label>For type:</label>
                    <select name="type" class="custom-select">
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
                    <label>Duration</label>
                    <select name="duration" class="custom-select">
                        <option value="0.5">0:30</option>
                        <option value="1">1:00</option>
                        <option value="1.5">1:30</option>
                        <option value="2">2:00</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description" required></textarea>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="form-group">
                    <label class="control-label">Image:</label>
                    <input type="file" name="image" id="image" class="filestyle" data-icon="false" required>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="form-group">
                    <label>Staff doing:</label>
                    <div class="wrap-list-staff">
                        <s:iterator value="listStaff" status="st">
                            <div class="staff">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id='customCheck_<s:property value="%{id}"/>' value='<s:property value="%{id}"/>' name="staff">
                                    <label class="custom-control-label" for='customCheck_<s:property value="%{id}"/>'>
                                        <s:property value="%{name}"/>-<s:property value="%{id}"/>
                                    </label>
                                </div>
                            </div>
                        </s:iterator>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Add">
        </div>
    </form>
    <script src="/js/admin-page/validate-add-form.js"></script>
</div>
<%@include file="end-sider.jsp" %>