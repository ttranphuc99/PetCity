<%-- 
    Document   : view-list-pet
    Created on : Jun 22, 2019, 8:00:27 AM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<link rel="stylesheet" href="/PetCity/css/admin-page/staff.css">

<div id="snackbar">
    <s:property value="%{mess}" />
</div> 

<div class="title mb-4">View List Pet</div>

<div class="container-fluid">
    <form action="/PetCity/adminViewListPet" method="POST">
        <div class="row">
            <div class="col-10">
                <div class="form-group">
                    <label for="searchName">Search name:</label>
                    <input type="text" id="searchName" name="name" class="form-control"
                        value='<s:property value="%{name}"/>' maxlength="100">
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

<s:if test="%{list.isEmpty}">
    <div id="snackbar">Not found!</div>
</s:if>
<s:else>
    <table id="dtBasicExample" class="table table-striped table-bordered table-sm mt-4" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm text-center col-num">No.</th>
                <th class="th-sm text-center col-name">Name</th>
                <th class="th-sm text-center col-type">Type</th>
                <th class="th-sm text-center col-birthyear">BirthYear</th>
                <th class="th-sm text-center col-gender">Gender</th>
                <th class="th-sm text-center">Owner</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="list">
                <tr>
                    <td class="align-middle col-num">
                        <s:property value="%{id}" />
                    </td>
                    <td class="align-middle col-name">
                        <s:property value="%{name}" />
                    </td>
                    <td class="align-middle text-center col-type">
                        <s:property value="%{type.name}" />
                    </td>
                    <td class="align-middle text-center col-birthyear">
                        <s:property value="%{birthYear}" />
                    </td>
                    <td class="align-middle text-center col-gender">
                        <s:if test="%{gender}">Male</s:if>
                        <s:else>Female</s:else>
                    </td>
                    <td class="align-middle text-center">
                        <s:property value="%{owner.username}"/> - <s:property value="%{owner.fullname}"/>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <li class="page-item">
                <s:url action="adminViewListPet" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="1" />
                    <s:param name="name" value="%{name}" />
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>First</a>
            </li>
            <s:iterator begin="1" end="%{numOfPage}" step="1" status="st">
                <li class='page-item <s:if test="%{#st.count == page}">active</s:if>'>
                    <s:url action="adminViewListPet" var="pageUrl" escapeAmp="false">
                        <s:param name="page" value="%{#st.count}" />
                        <s:param name="name" value="%{name}" />
                    </s:url>
                    <a class="page-link" href='<s:property value="#pageUrl"/>'>
                        <s:property value="%{#st.count}"/>
                    </a>
                </li>
            </s:iterator>
            <li class="page-item">
                <s:url action="adminViewListPet" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="%{numOfPage}" />
                    <s:param name="name" value="%{name}" />
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>Last</a>
            </li>
        </ul>
    </nav>
</s:else>
<%@include file="end-sider.jsp" %>
