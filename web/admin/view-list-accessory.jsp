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

<div class="container-fluid">

    <form>
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label for="accName">Search name:</label>
                    <input type="text" id="accName" name="name" class="form-control" required maxlength="100">
                </div>
            </div>

            <div class="col-3">
                <div class="form-group">
                    <label>Category:</label>
                    <select name="category" class="custom-select" required>
                        <s:iterator value="listCategory">
                            <option value='<s:property value="%{id}"/>'>
                                <s:property value="%{name}" />
                            </option>
                        </s:iterator>
                    </select>
                </div>
            </div>

            <div class="col-3">
                <div class="form-group">
                    <label>For type:</label>
                    <select name="type" class="custom-select" required>
                        <s:iterator value="listType">
                            <option value='<s:property value="%{id}" />'>
                                <s:property value="%{name}" />
                            </option>
                        </s:iterator>
                    </select>
                </div>
            </div>

            <div class="col-2">
                <div class="form-group text-center" style="padding-top: 30px">
                    <input type="submit" class="btn btn-primary font-label" name="action" value="Filter">
                </div>
            </div>
        </div>
    </form>

</div>

<table id="dtBasicExample" class="table table-striped table-bordered table-sm mt-4" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th class="th-sm text-center">ID</th>
            <th class="th-sm text-center">Name</th>
            <th class="th-sm text-center">Image</th>
            <th class="th-sm text-center">Category</th>
            <th class="th-sm text-center">Type</th>
            <th class="th-sm text-center">Quantity</th>
            <th class="th-sm text-center">Price</th>
            <th class="th-sm text-center">Action</th>
        </tr>
    </thead>
    <tbody>
        <s:iterator value="listAccessory">
            <tr>
                <td class="align-middle text-center">
                    <s:property value="%{id}" />
                </td>
                <td class="align-middle">
                    <s:property value="%{name}" />
                </td>
                <td class="align-middle text-center">
                    <img class="img-accessory" src='/PetCity/img/file/accessory/<s:property value="%{image}"/>'>
                </td>
                <td class="align-middle text-center">
                    <s:property value="%{category.name}" />
                </td>
                <td class="align-middle text-center">
                    <s:property value="%{type.name}" />
                </td>
                <td class="align-middle text-center">
                    <s:property value="%{quantity}" />
                </td>
                <td class="align-middle text-center">
                    $
                    <s:property value="%{price}" />
                </td>
            </tr>
        </s:iterator>
    </tbody>
</table>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-end">
        <li class="page-item">
            <a class="page-link" href="#" tabindex="-1">Previous</a>
        </li>
        <s:iterator begin="1" end="%{numOfPage}" step="1" status="st">
            <li class='page-item <s:if test="%{#st.count == page}">active</s:if>'>
                <a class="page-link" href='/PetCity/adminViewListAccessory?page=<s:property value="%{#st.count}"/>'><s:property value="%{#st.count}"/></a>
            </li>
        </s:iterator>
        <li class="page-item">
            <a class="page-link" href="#">Next</a>
        </li>
    </ul>
</nav>

<%@include file="end-sider.jsp" %>