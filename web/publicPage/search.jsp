<%-- 
    Document   : search
    Created on : Jul 1, 2019, 10:38:04 AM
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
                <div class="col-12">
                    <div class="row my-2 justify-content-center" id="wrap-accessory-list">
                        <s:iterator value="result">
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
                        <button class="btn btn-sm btn-info" id="view-more" 
                                onclick="searchMore('<s:property value="%{search}"/>',<s:property value="%{page+1}"/>)">
                            View More...
                        </button>
                    </div>
                    </s:if>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
