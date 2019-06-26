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
                            <div class="card-title type-title">Service For Dog</div>
                            <div class="card-img-bottom">
                                <img src="/PetCity/img/home-page/82673973.jpg" class="img-type"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-10">
                    <s:iterator value="listDog">
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

            <div class="row">
                <div class="col-2">
                    <div class="wrap-type-sider my-2">
                        <div class="card">
                            <div class="card-title type-title">Service For Cat</div>
                            <div class="card-img-bottom">
                                <img src="/PetCity/img/home-page/592685456.jpg" class="img-type"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-10">
                    <s:iterator value="listCat">
                        <div class="row wrap-service">
                            <div class="col-6 align-self-center">
                                <img class="img-service" src="/PetCity/img/file/service/<s:property value="%{image}"/>">
                            </div>
                            <div class="col-6">
                                <div class="row">
                                    <span class="service-name"><s:property value="%{name}"/></span>
                                </div>
                                <div class="row">
                                    <span class="service-duration"><s:property value="%{duration}"/> hour</span>
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

            <div class="row">
                <div class="col-2">
                    <div class="wrap-type-sider my-2">
                        <div class="card">
                            <div class="card-title type-title">Service For Hamster</div>
                            <div class="card-img-bottom">
                                <img src="/PetCity/img/home-page/1060.jpg" class="img-type"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-10">
                    <s:iterator value="listHamster">
                        <div class="row wrap-service">
                            <div class="col-6 align-self-center">
                                <img class="img-service" src="/PetCity/img/file/service/<s:property value="%{image}"/>">
                            </div>
                            <div class="col-6">
                                <div class="row">
                                    <span class="service-name"><s:property value="%{name}"/></span>
                                </div>
                                <div class="row">
                                    <span class="service-duration"><s:property value="%{duration}"/> hour</span>
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
