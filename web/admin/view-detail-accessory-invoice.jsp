<%-- 
    Document   : view-detail-accessory-invoice
    Created on : Jun 24, 2019, 4:41:57 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s" %>
<%@include file="sider.jsp" %>
<link rel="stylesheet" type="text/css" href="/PetCity/css/member-page/invoice-accessory-detail.css">
<div class="title ">Accessory Invoice Detail</div>

<div class="container-fluid px-2">
    <table id="dtBasicExample" class="table table-striped table-bordered table-sm mt-4" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="th-sm text-center col-no">No.</th>
                <th class="th-sm text-center col-img">Image</th>
                <th class="th-sm text-center col-name">Name</th>
                <th class="th-sm text-center col-price">Price</th>
                <th class="th-sm text-center col-quan">Quantity</th>
                <th class="th-sm text-center col-sub-price">Sub Price</th>
            </tr>
        </thead>
        <tbody>
        <form action="/PetCity/updateAccessoryCart" method="POST">
            <s:iterator status="st" value="%{listAccessory}">
                <tr>
                    <td class="col-no text-center align-middle">
                        <s:property value="%{#st.count}"/>
                    </td>
                    <td class="col-img text-center align-middle">
                        <img class="img-accessory" src='/PetCity/img/file/accessory/<s:property value="%{image}"/>'>
                    </td>
                    <td class="col-name align-middle">
                        <s:property value="%{name}" />
                    </td>
                    <td class="col-price text-center align-middle">
                        $
                        <s:property value="%{price}" />
                    </td>
                    <td class="col-quan text-center align-middle">
                        <s:property value="%{quantity}" />
                    </td>
                    <td class="col-sub-price text-center align-middle">
                        $
                        <s:property value="price*quantity" />
                    </td>
                </tr>
            </s:iterator>
        </form>
        <div class="row">
            <div class="col-6">
                <div class="row">
                    <div class="col-12">Total price:</div>
                </div>

                <div class="row totalPrice">
                    <div class="col-12">$<s:property value="%{total}"/></div>
                </div>
            </div>
            <div class="col-6">
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
            </div>
        </div>
        </tbody>
    </table>
    <div class="">
        <a class="btn btn-primary" role="button" href="/PetCity/viewListAccessoryInvoice?page=<s:property value="%{page}"/>">Back</a>
    </div>
</div>

<script src="https://kit.fontawesome.com/37932e4a19.js"></script>
<%@include file="end-sider.jsp" %>
