<%-- 
    Document   : view-invoice-accessory-detail
    Created on : Jun 23, 2019, 5:57:49 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sider.jsp" %>
<link rel="stylesheet" type="text/css" href="/PetCity/css/member-page/invoice-accessory-detail.css">
<div id="snackbar">
    <s:property value="%{mess}" />
</div>
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
                        <s:number name="%{price*quantity}" minimumFractionDigits="2"/>
                    </td>
                </tr>
            </s:iterator>
            <tr>
                <div class="row">
                    <div class="col-12">Total price:</div>
                </div>

                <div class="row totalPrice">
                    <div class="col-12">$<s:property value="%{total}"/></div>
                </div>
            </tr>
        </form>
        </tbody>
    </table>
</div>

<%@include file="end-sider.jsp" %>
