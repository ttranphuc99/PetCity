<%-- 
    Document   : service
    Created on : Jun 25, 2019, 4:59:43 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="/PetCity/css/public-page/index.css">
<link rel="stylesheet" type="text/css" href="/PetCity/css/public-page/service.css">
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
                                    <a class="stretched-link" href="/PetCity/loadListService?type=1">Dog</a>
                                </div>
                            </div>

                            <div class="row wrap-category">
                                <div class="col-12">
                                    <a class="stretched-link" href="/PetCity/loadListService?type=2">Cat</a>                                    
                                </div>
                            </div>

                            <div class="row wrap-category">
                                <div class="col-12">
                                    <a class="stretched-link" href="/PetCity/loadListService?type=3">Hamster</a>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-10">
                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <s:if test="%{type == 1}">Dog</s:if>
                            <s:elseif test="%{type == 2}">Cat</s:elseif>
                            <s:elseif test="%{type == 3}">Hamster</s:elseif>
                            </div>
                        </div>

                    <s:iterator value="list">
                        <div class="row wrap-service">
                            <div class="col-6 align-self-center">
                                <img class="img-service" src="/PetCity/img/file/service/<s:property value="%{image}"/>">
                            </div>
                            <div class="col-6">
                                <div class="row">
                                    <span class="service-name"><s:property value="%{name}"/></span>
                                </div>
                                <div class="row">
                                    <span class="service-duration">
                                        <s:property value="%{duration}"/> hour
                                    </span>
                                </div>
                                <div class="row">
                                    $<span class="service-price"><s:property value="%{price}"/></span>
                                </div>
                                <div class="row">
                                    <span class="service-description"><s:property value="%{description}"/></span>
                                </div>
                                <div class="row justify-content-center mt-2">
                                    <a role="button" href="/PetCity/viewServiceDetail?id=<s:property value="%{id}"/>" class="btn btn-outline-info">Book</a>
                                </div>
                            </div>
                        </div>        
                    </s:iterator>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/PetCity/js/public-page/show-detail-acces.js"></script>
<%@include file="footer.jsp" %>
