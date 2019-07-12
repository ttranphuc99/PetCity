<%-- 
    Document   : view-list-accessory-invoice
    Created on : Jun 23, 2019, 10:48:22 AM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<link rel="stylesheet" type="text/css" href="/PetCity/css/member-page/list-service-invoice.css">
<div id="snackbar">
    <s:property value="%{mess}" />
</div>
<div class="title mb-4">Service Invoices</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cancel Confirm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a role="button" class="btn btn-danger" id="deleteBtnAction" href="javascript(0);">Cancel Invoice</a>
            </div>
        </div>
    </div>
</div>

<s:if test="%{listServiceInvoice.isEmpty}">
    <div>No invoice yet!</div>
</s:if>
<s:else>
    <table id="dtBasicExample" class="table table-striped table-bordered table-sm mt-4" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm text-center col-id">ID</th>
                <th class="th-sm text-center col-service">Service Name</th>
                <th class="th-sm text-center col-date">Doing date</th>
                <th class="th-sm text-center col-pet">Pet</th>
                <th class="th-sm text-center col-price">Price</th>
                <th class="th-sm text-center col-status">Status</th>
                <th class="th-sm text-center">Action</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="listServiceInvoice">
                <tr>
                    <td class="align-middle text-center col-id">
                        <s:property value="%{id}" />
                    </td>
                    <td class="align-middle text-center col-service">
                        <s:property value="%{service.name}" />
                    </td>
                    <td class="align-middle text-center col-date">
                        <s:property value="%{doingDate}" />
                    </td>
                    <td class="align-middle text-center col-pet">
                        <s:property value="%{pet.name}" />
                    </td>
                    <td class="align-middle text-center col-price">
                        $
                        <s:property value="%{price}" />
                    </td>
                    <td class="align-middle text-center col-status">
                        <s:if test="%{status == 0}">
                            <span class="badge badge-warning">Waiting</span>
                        </s:if>
                        <s:elseif test="%{status == 1}">
                            <span class="badge badge-primary">Confirm</span>
                        </s:elseif>
                        <s:elseif test="%{status == -1}">
                            <span class="badge badge-danger">Canceled</span>
                        </s:elseif>
                    </td>
                    <td class="align-middle text-center">
                        <a class="btn btn-sm btn-outline-info my-1"
                            href='/PetCity/viewDetailServiceInvoice?id=<s:property value="%{id}" />&page=<s:property value="%{page}" />'
                            role="button">Detail</a><br>
                        <s:if test="%{status == 0}">
                            <button class="btn btn-sm btn-outline-danger" data-toggle="modal"
                                data-target="#exampleModal" onclick='cancelInvoice(<s:property value="%{id}"/>)'>
                                Cancel Invoice
                            </button>
                        </s:if>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <li class="page-item">
                <s:url action="viewListServiceInvoice" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="1" />
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>First</a>
            </li>
            <s:iterator begin="1" end="%{numOfPage}" step="1" status="st">
                <li class='page-item <s:if test="%{#st.count == page}">active</s:if>'>
                    <s:url action="viewListServiceInvoice" var="pageUrl" escapeAmp="false">
                        <s:param name="page" value="%{#st.count}" />
                    </s:url>
                    <a class="page-link" href='<s:property value="#pageUrl"/>'>
                        <s:property value="%{#st.count}"/>
                    </a>
                </li>
            </s:iterator>
            <li class="page-item">
                <s:url action="viewListServiceInvoice" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="%{numOfPage}" />
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>Last</a>
            </li>
        </ul>
    </nav>
</s:else>
<script src="/PetCity/js/admin-page/delete-action.js"></script>

<%@include file="end-sider.jsp" %>