<%-- 
    Document   : add-product
    Created on : Jun 4, 2019, 11:24:07 AM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<div class="title mb-4">Add new accessory</div>

<div class="container-fluid">
    <form action="" method="POST">
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="accName">Name:</label>
                    <input type="text" id="accName" name="name" class="form-control" required>
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label for="accBrand">Brand:</label>
                    <input type="text" id="accBrand" name="brand" class="form-control" required>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="accPrice">Price:</label>
                    <input type="number" id="accPrice" name="price" class="form-control" required>
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label for="accQuantity">Quantity:</label>
                    <input type="number" id="accQuantity" name="quantity" class="form-control" required>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label>Category:</label>
                    <select class="custom-select">
                        <s:iterator value="listCategory">
                            <option name="category" value='<s:property value="%{id}"/>'>
                                <s:property value="%{name}"/>
                            </option>
                        </s:iterator>
                    </select>
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label>For type:</label>
                    <select class="custom-select">
                        <s:iterator value="listType">
                            <option name="type" value='<s:property value="%{id}" />'>
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
                    <label for="accDes">Description:</label>
                    <textarea class="form-control" id="accDes" name="description" required></textarea>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="form-group">
                    <label class="control-label">Image:</label>
                    <input type="file" class="filestyle" data-icon="false">
                </div>
            </div>
        </div>

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Add">
        </div>
    </form>
</div>
<%@include file="end-sider.jsp" %>