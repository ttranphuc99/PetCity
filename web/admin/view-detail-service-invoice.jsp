<%-- 
    Document   : view-detail-accessory-invoice
    Created on : Jun 24, 2019, 4:41:57 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s" %>
<%@include file="sider.jsp" %>
<link rel="stylesheet" type="text/css" href="/css/admin-page/invoice-service-detail.css">
<div class="title mb-3">Service Invoice Detail</div>

<div class="container-fluid px-2">
    <form action="/updateInvoiceService" method="POST" onsubmit="return validate();">
        <div class="row my-3">
            <div class="col-6">
                <div class="label">ID:</div>
                <div class="info">
                    <s:property value="%{dto.id}"/>
                </div>
                <input type="hidden" name="id" value="<s:property value="%{dto.id}"/>" />
            </div>

            <div class="col-6">
                <div class="label">Created Time:</div>
                <div class="info">
                    <s:property value="%{dto.createTime}"/>
                </div>
            </div>
        </div>

        <div class="row my-3">
            <div class="col-6">
                <div class="label">Service Name:</div>
                <div class="info">
                    <s:property value="%{dto.service.name}"/>
                </div>
            </div>

            <div class="col-6">
                <div class="label">Staff Doing:</div>
                <div class="info">
                    <s:property value="%{dto.staffDoing.id}"/> - <s:property value="%{dto.staffDoing.name}"/>
                </div>

                <div class="form-group mt-3 mb-0">
                    <label for="staff">Change staff:</label>
                    <select name="staff" id="staff" onchange="validate()">
                        <option value="-1" selected></option>
                        <s:iterator value="%{listStaff}">
                            <option value="<s:property value="%{id}"/>">
                                <s:property value="%{name}"/> - <s:property value="%{id}"/>
                            </option>
                        </s:iterator>
                    </select>
                </div>
            </div>
        </div>

        <div class="row my-3">
            <div class="col-6">
                <div class="label">Pet Name:</div>
                <div class="info">
                    <s:property value="%{dto.pet.name}"/> - <s:property value="%{dto.pet.id}"/>
                </div>
            </div>

            <div class="col-6">
                <div class="label">Owner:</div>
                <div class="info">
                    <s:property value="%{dto.pet.owner.fullname}"/> 
                </div>
            </div>
        </div>

        <div class="row my-3">
            <div class="col-6">
                <div class="label">Doing date:</div>
                <div class="info">
                    <s:property value="%{dto.doingDate}"/>
                </div>
            </div>

            <div class="col-6">
                <div class="label">Duration:</div>
                <div class="info">
                    <s:property value="%{dto.duration}"/> hour(s)
                </div>
            </div>
        </div>

        <div class="row my-3">
            <div class="col-6">
                <div class="label">Price:</div>
                <div class="info">
                    $<s:property value="%{dto.price}"/>
                </div>
            </div>

            <div class="col-6">
                <div class="label">Admin Confirm:</div>
                <div class="info">
                    <s:property value="%{dto.adminConfirm}"/>
                </div>
            </div>
        </div>

        <div class="row my-3">
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

        <s:if test="%{dto.status != -1}">
            <div class="row my-3">
                <div class="col-6">
                    <div class="form-group">
                        <label for="status">Change status:</label>
                        <select name="status" id="status" onchange="validate()">
                            <option value="-1" <s:if test="%{dto.status == -1}">selected</s:if> >Canceled</option>
                            <option value="0" <s:if test="%{dto.status == 0}">selected</s:if> >Waiting</option>
                            <option value="1" <s:if test="%{dto.status == 1}">selected</s:if> >Confirm</option>
                        </select>
                    </div>
                </div>
            </div>
        </s:if>

        <div class="row my-3">
            <div class="col-12 text-center">
                <input type="hidden" name="page" value="<s:property value="%{page}"/>"/>
                <input type="submit" value="Update" class="btn btn-success mr-2">
                <a href="/viewListServiceInvoice?page=<s:property value="%{page}"/>" class="ml-2 btn btn-secondary" role="button">Back</a>
            </div>
        </div>
    </form>
</div>
<script src="/js/admin-page/validate-update-service.js"></script>
<%@include file="end-sider.jsp" %>