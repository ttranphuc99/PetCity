<%-- 
    Document   : add-product
    Created on : Jun 4, 2019, 11:24:07 AM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<div class="title mb-4">Add new accessory</div>

<div class="container-fluid">
    <form action="/PetCity/addAccessory" method="POST" enctype="multipart/form-data" onsubmit="return validate();">
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="accName">Name:</label>
                    <input type="text" id="accName" name="name" class="form-control" required maxlength="100">
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label for="accBrand">Brand:</label>
                    <input type="text" id="accBrand" name="brand" class="form-control" required maxlength="20">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="accPrice">Price:</label>
                    <input type="number" step="0.01" id="accPrice" name="price" class="form-control" required min="0">
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label for="accQuantity">Quantity:</label>
                    <input type="number" id="accQuantity" name="quantity" class="form-control" min="0" required>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label>Category:</label>
                    <select name="category" class="custom-select" required>
                        <s:iterator value="listCategory">
                            <option value='<s:property value="%{id}"/>'>
                                <s:property value="%{name}"/>
                            </option>
                        </s:iterator>
                    </select>
                </div>
            </div>

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

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Add">
        </div>
    </form>
    <script src="/PetCity/js/admin-page/validate-add-form.js"></script>
</div>
<%@include file="end-sider.jsp" %>