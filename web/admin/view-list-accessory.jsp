<%-- 
    Document   : view-list-accessory
    Created on : Jun 5, 2019, 6:43:04 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s" %>
<%@include file="sider.jsp" %>
<link rel="stylesheet" href="/PetCity/css/admin-page/accessory.css">
<div class="title mb-4">View list accessory</div>

<table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th class="th-sm">ID</th>
            <th class="th-sm">Name</th>
            <th class="th-sm">Image</th>
            <th class="th-sm">Category</th>
            <th class="th-sm">Type</th>
            <th class="th-sm">Quantity</th>
            <th class="th-sm">Price</th>
            <th class="th-sm">Action</th>
        </tr>
    </thead>
    <tbody>
        <s:iterator value="listAccessory">
            <tr>
                <td><s:property value="%{id}"/></td>
                <td><s:property value="%{name}"/></td>
                <td><s:property value="%{category.name}"/></td>
                <td><img class="img-accessory" src='/PetCity/img/file/accessory/<s:property value="%{image}"/>'></td>
                <td><s:property value="%{type.name}"/></td>
                <td><s:property value="%{quantity}"/></td>
                <td><s:property value="%{price}"/></td>
            </tr>
        </s:iterator>
    </tbody>
</table>

<%@include file="end-sider.jsp" %>