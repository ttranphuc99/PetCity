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

    <form action="adminViewListAccessory" method="POST">
        <input type="hidden" name="page" value="1"/>
        <div class="row">
            <div class="col-4">
                <div class="form-group">
                    <label for="searchName">Search name:</label>
                    <input type="text" id="accName" name="searchName" class="form-control" value='<s:property value="%{searchName}"/>' maxlength="100">
                </div>
            </div>

            <div class="col-3">
                <div class="form-group">
                    <label>Category:</label>
                    <select name="category" class="custom-select" required>
                        <option value="-1" selected>All</option>
                        <s:iterator value="listCategory">
                            <option value='<s:property value="%{id}"/>' <s:if test="%{id == category}">selected</s:if>>
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
                        <option value="-1" selected>All</option>
                        <s:iterator value="listType">
                            <option value='<s:property value="%{id}" />' <s:if test="%{id == type}">selected</s:if>>
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

<s:if test="%{listAccessory.isEmpty}">
    <div id="snackbar">Not found!</div>
</s:if>
<s:else>
    <table id="dtBasicExample" class="table table-striped table-bordered table-sm mt-4" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm text-center col-id">ID</th>
                <th class="th-sm text-center col-name">Name</th>
                <th class="th-sm text-center col-img">Image</th>
                <th class="th-sm text-center col-cate">Category</th>
                <th class="th-sm text-center col-type">Type</th>
                <th class="th-sm text-center col-quan">Quantity</th>
                <th class="th-sm text-center col-price">Price</th>
                <th class="th-sm text-center">Action</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="listAccessory">
                <tr>
                    <td class="align-middle text-center col-id">
                        <s:property value="%{id}" />
                    </td>
                    <td class="align-middle col-name">
                        <s:property value="%{name}" />
                    </td>
                    <td class="align-middle text-center col-img">
                        <img class="img-accessory" src='/PetCity/img/file/accessory/<s:property value="%{image}"/>'>
                    </td>
                    <td class="align-middle text-center col-cate">
                        <s:property value="%{category.name}" />
                    </td>
                    <td class="align-middle text-center col-type">
                        <s:property value="%{type.name}" />
                    </td>
                    <td class="align-middle text-center col-quan">
                        <s:property value="%{quantity}" />
                    </td>
                    <td class="align-middle text-center col-price">
                        $<s:property value="%{price}" />
                    </td>
                    <td class="align-middle text-center">
                        <a class="btn btn-sm btn-outline-info my-1" href='/PetCity/adminViewDetailAccessory?id=<s:property value="%{id}"/>' role="button">Detail</a><br>
                        <a class="btn btn-sm btn-outline-danger" href="#" role="button">Delete</a>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <li class="page-item">
                <s:url action="adminViewListAccessory" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="1"/>
                    <s:param name="searchName" value="%{searchName}"/>
                    <s:param name="type" value="%{type}"/>
                    <s:param name="category" value="%{category}"/>
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>First</a>
            </li>
            <s:iterator begin="1" end="%{numOfPage}" step="1" status="st">
                <li class='page-item <s:if test="%{#st.count == page}">active</s:if>'>
                    <s:url action="adminViewListAccessory" var="pageUrl" escapeAmp="false">
                        <s:param name="page" value="%{#st.count}"/>
                        <s:param name="searchName" value="%{searchName}"/>
                        <s:param name="type" value="%{type}"/>
                        <s:param name="category" value="%{category}"/>
                    </s:url>
                    <a class="page-link" href='<s:property value="#pageUrl"/>'>
                        <s:property value="%{#st.count}"/>
                    </a>
                </li>
            </s:iterator>
            <li class="page-item">
                <s:url action="adminViewListAccessory" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="%{numOfPage}"/>
                    <s:param name="searchName" value="%{searchName}"/>
                    <s:param name="type" value="%{type}"/>
                    <s:param name="category" value="%{category}"/>
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>Last</a>
            </li>
        </ul>
    </nav>
</s:else>

<%@include file="end-sider.jsp" %>