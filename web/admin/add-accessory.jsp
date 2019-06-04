<%-- 
    Document   : add-product
    Created on : Jun 4, 2019, 11:24:07 AM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<div class="title">Add new accessory</div>

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
                    <input type="text" id="accPrice" name="price" class="form-control" required>
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label for="accQuantity">Quantity:</label>
                    <input type="text" id="accQuantity" name="quantity" class="form-control" required>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label>Category:</label>
                    <select class="custom-select">
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label>For type:</label>
                    <select class="custom-select">
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
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