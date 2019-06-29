<%-- 
    Document   : view-list-accessory-invoice
    Created on : Jun 24, 2019, 7:03:42 AM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s" %>
<%@include file="sider.jsp" %>
<link rel="stylesheet" href="/PetCity/css/admin-page/accessory-invoice.css">
<div id="snackbar">
    <s:property value="%{mess}" />
</div>
<div class="title mb-4">Accessory Invoices</div>

<s:if test="%{listAccessoryInvoice.isEmpty}">
    <div>No invoice yet!</div>
</s:if>
<s:else>
    <table id="dtBasicExample" class="table table-striped table-bordered table-sm mt-4" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm text-center col-id">ID</th>
                <th class="th-sm text-center col-buyer">Buyer</th>
                <th class="th-sm text-center col-time">Created Time</th>
                <th class="th-sm text-center col-total">Total Price</th>
                <th class="th-sm text-center col-status">Status</th>
                <th class="th-sm text-center col-confirm">Admin Confirm</th>
                <th class="th-sm text-center">Action</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="listAccessoryInvoice">
                <tr>
                    <td class="align-middle text-center col-id">
                        <a href='/PetCity/adminViewAccessoryInvoiceDetail?id=<s:property value="%{id}" />&status=<s:property value="%{status}" />&page=<s:property value="%{page}" />' class="link">
                            <s:property value="%{id}" />
                        </a>
                    </td>
                    <td class="align-middle text-center col-buyer">
                        <s:property value="%{buyerUsername}" />
                    </td>
                    <td class="align-middle text-center col-time">
                        <s:property value="%{createdTime}" />
                    </td>
                    <td class="align-middle text-center col-total">
                        $<s:property value="%{total}" />
                    </td>
                    <td class="align-middle text-center col-status">
                        <s:if test="%{status == 0}">
                            <span class="badge badge-warning">Waiting</span>
                        </s:if>
                        <s:elseif test="%{status == 1}">
                            <span class="badge badge-primary">Done</span>
                        </s:elseif>
                        <s:elseif test="%{status == -1}">
                            <span class="badge badge-danger">Canceled</span>
                        </s:elseif>
                    </td>
                    <td class="align-middle text-center col-confirm">
                        <s:property value="%{adminConfirm}" />
                    </td>
                    <td class="align-middle text-center">
                        <s:if test="%{status != -1}">
                        <form method="POST" action="/PetCity/updateStatusAccessoryInvoice">
                            <select name="status" class="custom-select" style="width: 50%">
                                <option value="-1" <s:if test="%{status == -1}">selected</s:if>>Canceled</option>
                                <option value="0" <s:if test="%{status == 0}">selected</s:if>>Waiting</option>
                                <option value="1" <s:if test="%{status == 1}">selected</s:if>>Done</option>
                            </select>
                            <input type="hidden" name="id" value="<s:property value="%{id}" />"/>
                            <input type="hidden" name="page" value="<s:property value="%{page}" />"/>
                                
                           <button type="submit" class="btn btn-sm btn-outline-danger"><i class="fas fa-check"></i></button>   
                        </form>
                        </s:if>
                    </td>
                </tr>
            </s:iterator>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <li class="page-item">
                <s:url action="viewListAccessoryInvoice" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="1" />
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>First</a>
            </li>
            <s:iterator begin="1" end="%{numOfPage}" step="1" status="st">
                <li class='page-item <s:if test="%{#st.count == page}">active</s:if>'>
                    <s:url action="viewListAccessoryInvoice" var="pageUrl" escapeAmp="false">
                        <s:param name="page" value="%{#st.count}" />
                    </s:url>
                    <a class="page-link" href='<s:property value="#pageUrl"/>'>
                        <s:property value="%{#st.count}"/>
                    </a>
                </li>
            </s:iterator>
            <li class="page-item">
                <s:url action="viewListAccessoryInvoice" var="pageUrlFirst" escapeAmp="false">
                    <s:param name="page" value="%{numOfPage}" />
                </s:url>
                <a class="page-link" href='<s:property value="#pageUrlFirst"/>'>Last</a>
            </li>
        </ul>
    </nav>
</s:else>
<script src="https://kit.fontawesome.com/37932e4a19.js"></script>
<%@include file="end-sider.jsp" %>
