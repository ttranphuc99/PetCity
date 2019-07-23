<%-- 
    Document   : view-invoice-accessory-detail
    Created on : Jun 23, 2019, 5:57:49 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<link rel="stylesheet" type="text/css" href="/css/admin-page/invoice-service-detail.css">
<div id="snackbar">
    <s:property value="%{mess}" />
</div>
<div class="title">Service Invoice Detail</div>

<!-- Modal -->
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
                <a role="button" class="btn btn-danger" id="deleteBtnAction" href="javascript(0);">Cancel</a>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid px-2">
    <div class="row my-3">
        <div class="col-6">
            <div class="label">ID:</div>
            <div class="info">
                <s:property value="%{dto.id}" />
            </div>
            <input type="hidden" name="id" value="<s:property value=" %{dto.id}" />" />
        </div>

        <div class="col-6">
            <div class="label">Created Time:</div>
            <div class="info">
                <s:property value="%{dto.createTime}" />
            </div>
        </div>
    </div>

    <div class="row my-3">
        <div class="col-6">
            <div class="label">Service Name:</div>
            <div class="info">
                <s:property value="%{dto.service.name}" />
            </div>
        </div>

        <div class="col-6">
            <div class="label">Pet Name:</div>
            <div class="info">
                <s:property value="%{dto.pet.name}" />
            </div>
        </div>
    </div>

    <div class="row my-3">
        <div class="col-6">
            <div class="label">Staff Name:</div>
            <div class="info">
                <s:property value="%{dto.staffDoing.name}" /> -
                <s:property value="%{dto.staffDoing.id}" />
            </div>
        </div>

        <div class="col-6">
            <div class="label">Staff Image:</div>
            <div class="info">
                <s:if test="%{dto.staffDoing.image != null}">
                    <img src='/img/file/staff/<s:property value="%{dto.staffDoing.image}"/>' class="img-staff" />
                </s:if>
            </div>
        </div>
    </div>

    <div class="row my-3">
        <div class="col-6">
            <div class="label">Doing date:</div>
            <div class="info">
                <s:property value="%{dto.doingDate}" />
            </div>
        </div>

        <div class="col-6">
            <div class="label">Duration:</div>
            <div class="info">
                <s:property value="%{dto.duration}" /> hour(s)
            </div>
        </div>
    </div>

    <div class="row my-3">
        <div class="col-6">
            <div class="label">Price:</div>
            <div class="info">
                $<s:property value="%{dto.price}" />
            </div>
        </div>

        <div class="col-6">
            <div class="label">Status:</div>
            <div class="info">
                <s:if test="%{dto.status == -1}">
                    <span class="badge badge-danger">Canceled</span>
                </s:if>
                <s:elseif test="%{dto.status == 0}">
                    <span class="badge badge-warning">Waiting</span>
                </s:elseif>
                <s:elseif test="%{dto.status == 1}">
                    <span class="badge badge-primary">Confirm</span>
                </s:elseif>
            </div>
        </div>
    </div>

    <div class="row my-3">
        <div class="col-12 text-center">
            <s:if test="%{dto.status == 0}">
                <button class="btn btn-danger" data-toggle="modal" data-target="#exampleModal"
                        onclick='cancelInvoice(<s:property value="%{id}"/>)'>
                    Cancel Invoice
                </button>
            </s:if>
            <a href="/viewListServiceInvoice?page=<s:property value="%{page}" />" class="ml-2 btn
               btn-secondary" role="button">Back</a>
        </div>
    </div>
</div>
<script src="/js/admin-page/delete-action.js"></script>
<%@include file="end-sider.jsp" %>