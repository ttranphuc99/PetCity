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
                            <div class="row">
                                <div class="col-12">
                                    <a class="stretched-link" href="">Food</a>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <a class="stretched-link" href="">Clothes</a>                                    
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <a class="stretched-link" href="">Toys</a>    
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <a class="stretched-link" href="">Comestics</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-10">
                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="#" class="stretched-link">Food</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
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
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog w-75 modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="container">
                    <span style="display: none;" id="accessoryDetailID">-1</span>
                    <div class="row">
                        <div class="col-6 justify-content-center align-items-center">
                            <img src="/PetCity/img/file/accessory/3.jpg" class="accessory-img-modal" id="accessoryImg">
                        </div>

                        <div class="col-6">
                            <div class="row">
                                <div class="col-12">
                                    <label>Name</label>
                                    <div class="modal-accessory-name" id="accessoryName">ABC</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <label>Brand</label>
                                    <div class="modal-accessory-name" id="accessoryBrand">ABC</div>    
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <label>Category</label>
                                    <div class="modal-accessory-name" id="accessoryCategory">ABC</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <label>For Type</label>
                                    <div class="modal-accessory-name" id="accessoryType">ABC</div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <label>Price</label>
                                    <div class="modal-accessory-price" id="accessoryPrice">$5.67</div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-12">
                            <label>Description</label>
                            <div class="modal-accessory-name" id="accessoryDes">ABC</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="addAccessory()">Add to cart</button>
            </div>
        </div>
    </div>
</div>

<script src="/PetCity/js/public-page/show-detail-acces.js"></script>
<%@include file="footer.jsp" %>
