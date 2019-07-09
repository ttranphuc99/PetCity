<%-- 
    Document   : viewCart
    Created on : Jun 20, 2019, 2:52:55 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="/PetCity/css/public-page/cart.css">
<div id="snackbar">
    <s:property value="%{mess}" />
</div>
<s:if test="%{#session.CART != null}">
    <s:if test="%{!#session.CART.empty}">
        <div class="container my-5 py-2 px-2">
            <table id="dtBasicExample" class="table table-striped table-bordered table-sm mt-4" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th class="th-sm text-center col-no">No.</th>
                        <th class="th-sm text-center col-img">Image</th>
                        <th class="th-sm text-center col-name">Name</th>
                        <th class="th-sm text-center col-price">Price</th>
                        <th class="th-sm text-center col-quan">Quantity</th>
                        <th class="th-sm text-center col-sub-price">Sub Price</th>
                        <th class="th-sm text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                <form action="/PetCity/updateAccessoryCart" method="POST">
                    <s:iterator status="st" value="%{#session.CART.list}">
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
                                <input type="hidden" name="id" value='<s:property value="%{id}"/>'>
                                <input type="number" class="form-control text-center" name="quantity" min="1" max="50" step="1" value="<s:property value="%{quantity}" />">
                                <div class="error-quantity">
                                    <s:property value="%{brand}"/>
                                </div>
                            </td>
                            <td class="col-sub-price text-center align-middle">
                                $
                                <s:number name="%{price*quantity}" minimumFractionDigits="2"/>
                            </td>
                            <td class="align-middle text-center">
                                <a href="/PetCity/removeAccessoryCart?id=<s:property value="%{id}"/>" class="btn btn-sm btn-outline-info" role="button">
                                    Remove
                                </a>
                            </td>
                        </tr>
                    </s:iterator>
                    <tr>
                        <td class="col-no"></td>
                        <td class="col-img"></td>
                        <td class="col-name"></td>
                        <td class="col-price"></td>
                        <td class="col-quan align-middle text-center">
                            <input type="submit" value="Update Cart" name="action" class="btn btn-info">
                        </td>
                        <td class="col-sub-price px-2">
                            <div class="row">
                                <div class="col-12">Total price:</div>
                            </div>

                            <div class="row">
                                <div class="col-12">$<s:property value="%{#session.CART.total}"/></div>
                            </div>
                        </td>
                        <td class="text-center align-middle">
                            <input type="submit" value="Checkout" name="action" class="btn btn-primary">
                        </td>
                    </tr>
                </form>
                </tbody>
            </table>
        </div>
    </s:if>
    <s:else>
        <div class="text-center w-100 my-5 emptyCart">Empty cart</div>
    </s:else>
</s:if>
<s:else>
    <div class="text-center w-100 my-5 emptyCart">Empty cart</div>      
</s:else>
<script>
</script>
<%@include file="footer.jsp" %>