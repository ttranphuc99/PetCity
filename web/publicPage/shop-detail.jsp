<%-- 
    Document   : shop-for-dog
    Created on : Jun 30, 2019, 10:15:38 AM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="/PetCity/css/public-page/index.css">
<div id="snackbar">
    <s:property value="%{mess}" />
</div>
<img src="/PetCity/img/header-footer/banner_839ab468.png" style="width: 100%;"/>
<div class="content">
    <div class="container-fluid" style="padding: 0 10%;">
        <div class="wrap-type">
            <div class="row">
                <div class="col-2">
                    <div class="wrap-type-sider my-2">
                        <div class="card">
                            <div class="row wrap-category">
                                <div class="col-12">
                                    <a class="stretched-link" href="/PetCity/loadExactlyContent?categoryID=1&forType=<s:property value="%{forType}"/>">Food</a>
                                </div>
                            </div>

                            <div class="row wrap-category">
                                <div class="col-12">
                                    <a class="stretched-link" href="/PetCity/loadExactlyContent?categoryID=2&forType=<s:property value="%{forType}"/>">Clothes</a>                                    
                                </div>
                            </div>

                            <div class="row wrap-category">
                                <div class="col-12">
                                    <a class="stretched-link" href="/PetCity/loadExactlyContent?categoryID=3&forType=<s:property value="%{forType}"/>">Toys</a>    
                                </div>
                            </div>

                            <div class="row wrap-category">
                                <div class="col-12">
                                    <a class="stretched-link" href="/PetCity/loadExactlyContent?categoryID=4&forType=<s:property value="%{forType}"/>">Comestics</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-10"> 
                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <s:if test="%{categoryID == 1}">Food</s:if>
                            <s:elseif test="%{categoryID == 2}">Clothes</s:elseif>
                            <s:elseif test="%{categoryID == 3}">Toys</s:elseif>
                            <s:elseif test="%{categoryID == 4}">Comestics</s:elseif>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center" id="wrap-accessory-list">
                        <s:iterator value="list">
                            <div class="wrap-accessories card justify-content-center mx-2">
                                <div class="wrap-accessory-img card-img-top">
                                    <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                                </div>

                                <div class="card-body">
                                    <div class="card-text accessory-name text-center">
                                        <s:property value="%{name}"/>
                                    </div>

                                    <div class="card-title accessory-price text-center">
                                        $<s:property value="%{price}"/>
                                    </div>

                                    <div class="wrap-btn-view-accessory text-center">
                                        <button class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" onclick="loadAccessory(<s:property value="%{id}"/>)">View detail</button>
                                    </div>
                                </div> 
                            </div>
                        </s:iterator>
                    </div>

                    <s:if test="%{page < numOfPage}">
                    <div class="row my-2 justify-content-center">
                        <button class="btn btn-info" id="view-more" 
                                onclick="loadMore(<s:property value="%{forType}"/>, <s:property value="%{categoryID}"/>, <s:property value="%{page+1}"/>)">
                            View More...
                        </button>
                    </div>
                    </s:if>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/PetCity/js/public-page/load-more-accessory.js"></script>
<%@include file="footer.jsp" %>
