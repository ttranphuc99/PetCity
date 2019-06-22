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

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Confirm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a role="button" class="btn btn-danger" id="deleteBtnAction" href="javascript(0);">Delete</a>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <form action="/PetCity/viewListPet" method="POST">
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

<s:if test="%{listPet.isEmpty}">
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
                <th class="th-sm text-center">Action</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="listPet" status="st">
                <tr>
                    <td class="align-middle col-num">
                        <s:property value="%{#st.count}" />
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
                        <a class="btn btn-sm btn-outline-info my-1"
                            href='/PetCity/viewPetDetail?id=<s:property value="%{id}"/>'
                            role="button">Detail</a><br>
                        <button class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#exampleModal"
                            onclick='deletePet(<s:property value="%{id}"/>, "<s:property value="%{name}"/>")'>Delete</button>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <li class="page-item">
                <s:url action="viewListPet" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="1" />
                    <s:param name="name" value="%{name}" />
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>First</a>
            </li>
            <s:iterator begin="1" end="%{numOfPage}" step="1" status="st">
                <li class='page-item <s:if test="%{#st.count == page}">active</s:if>'>
                    <s:url action="viewListPet" var="pageUrl" escapeAmp="false">
                        <s:param name="page" value="%{#st.count}" />
                        <s:param name="name" value="%{name}" />
                    </s:url>
                    <a class="page-link" href='<s:property value="#pageUrl"/>'>
                        <s:property value="%{#st.count}"/>
                    </a>
                </li>
            </s:iterator>
            <li class="page-item">
                <s:url action="viewListPet" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="%{numOfPage}" />
                    <s:param name="name" value="%{name}" />
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>Last</a>
            </li>
        </ul>
    </nav>
</s:else>
<script src="/PetCity/js/admin-page/delete-action.js"></script>

<%@include file="end-sider.jsp" %>
