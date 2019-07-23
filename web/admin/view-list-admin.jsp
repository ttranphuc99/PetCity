<%-- 
    Document   : view-list-user.jsp
    Created on : Jun 8, 2019, 7:44:12 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s" %>
<%@include file="sider.jsp" %>
<link rel="stylesheet" href="/css/admin-page/list-admin.css">
<div class="title mb-4">View list admin</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ban Confirm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a role="button" class="btn btn-danger" id="deleteBtnAction" href="javascript(0);">Ban</a>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <form action="adminViewListAdmin" method="POST">
        <div class="row">
            <div class="col-10">
                <div class="form-group">
                    <label for="searchName">Search name:</label>
                    <input type="text" id="searchName" name="fullname" class="form-control"
                        value='<s:property value="%{fullname}"/>' maxlength="100">
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

<s:if test="%{listUser.isEmpty}">
    <div id="snackbar">Not found!</div>
</s:if>
<s:else>
    <table id="dtBasicExample" class="table table-striped table-bordered table-sm mt-4" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm text-center col-id">Username</th>
                <th class="th-sm text-center col-name">Fullname</th>
                <th class="th-sm text-center col-gender">Gender</th>
                <th class="th-sm text-center col-status">Status</th>
                <th class="th-sm text-center">Action</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="listUser">
                <tr>
                    <td class="align-middle col-id">
                        <s:property value="%{username}" />
                    </td>
                    <td class="align-middle col-name">
                        <s:property value="%{fullname}" />
                    </td>
                    <td class="align-middle text-center col-gender">
                        <s:if test="%{gender}">Male</s:if>
                        <s:else>Female</s:else>
                    </td>
                    <td class="align-middle text-center col-status">
                        <s:if test="%{delete}"><span class="badge badge-danger">Banned</span></s:if>
                        <s:else><span class="badge badge-primary">Active</span></s:else>
                    </td>
                    <td class="align-middle text-center">
                        <s:set var="curUsername" value="%{#session.USERNAME}"/>
                        <s:if test="%{!username.equals(#curUsername)}">
                            <s:if test="%{delete}">
                                <a href="activeUser?role=admin&id=<s:property value="%{username}"/>" class="btn btn-sm btn-outline-primary" role="button">
                                    Active
                                </a>
                            </s:if>
                            <s:else>
                                <button class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#exampleModal"
                                        onclick='deleteUser("<s:property value="%{username}"/>", "<s:property value="%{fullname}"/>", "admin")'>
                                    Ban
                                </button>
                            </s:else>
                        </s:if>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <li class="page-item">
                <s:url action="adminViewListUser" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="1" />
                    <s:param name="fullname" value="%{fullname}" />
                    <s:param name="phone" value="%{phone}" />
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>First</a>
            </li>
            <s:iterator begin="1" end="%{numOfPage}" step="1" status="st">
                <li class='page-item <s:if test="%{#st.count == page}">active</s:if>'>
                    <s:url action="adminViewListUser" var="pageUrl" escapeAmp="false">
                        <s:param name="page" value="%{#st.count}" />
                        <s:param name="fullname" value="%{fullname}" />
                        <s:param name="phone" value="%{phone}" />
                    </s:url>
                    <a class="page-link" href='<s:property value="#pageUrl"/>'>
                        <s:property value="%{#st.count}"/>
                    </a>
                </li>
            </s:iterator>
            <li class="page-item">
                <s:url action="adminViewListUser" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="%{numOfPage}" />
                    <s:param name="fullname" value="%{fullname}" />
                    <s:param name="phone" value="%{phone}" />
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>Last</a>
            </li>
        </ul>
    </nav>
</s:else>
<script src="/js/admin-page/delete-action.js"></script>
<%@include file="end-sider.jsp" %>