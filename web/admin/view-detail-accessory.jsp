<%-- 
    Document   : add-product
    Created on : Jun 4, 2019, 11:24:07 AM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="sider.jsp" %>
<div class="title mb-4">Accessory</div>

<div class="container-fluid">
    <form action="/PetCity/updateAccessory" method="POST" enctype="multipart/form-data" onsubmit="return validate();">
        <input type="hidden" name="id" value='<s:property value="%{dto.id}"/>'/>
        <input type="hidden" value="<s:property value="%{dto.image}"/>" name="imgName"/>
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="accName">Name:</label>
                    <input type="text" id="accName" name="name" class="form-control" value='<s:property value="%{dto.name}"/>' required maxlength="100">
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label for="accBrand">Brand:</label>
                    <input type="text" id="accBrand" name="brand" class="form-control" value='<s:property value="%{dto.brand}"/>' required maxlength="20">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="accPrice">Price:</label>
                    <input type="number" step="0.01" id="accPrice" name="price" class="form-control" value='<s:property value="%{dto.price}"/>' required min="0">
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label for="accQuantity">Quantity:</label>
                    <input type="number" id="accQuantity" name="quantity" class="form-control" value='<s:property value="%{dto.quantity}"/>' min="0" required>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label>Category:</label>
                    <select name="category" class="custom-select" required>
                        <s:iterator value="listCategory">
                            <option value='<s:property value="%{id}"/>' <s:if test="%{id == dto.category.id}">selected</s:if>>
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
                            <option value='<s:property value="%{id}"/>' <s:if test="%{id == dto.type.id}">selected</s:if>>
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
                    <textarea class="form-control" id="description" name="description" required><s:property value="%{dto.description}"/></textarea>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-12">
                <div class="justify-content-center">
                    <img src='/PetCity/img/file/accessory/<s:property value="%{dto.image}"/>' style="max-width: 200px"/>
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