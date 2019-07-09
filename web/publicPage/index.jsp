<%-- 
    Document   : index
    Created on : Jun 2, 2019, 6:15:01 PM
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
                            <div class="card-title type-title">
                                <a href="/PetCity/loadExactlyContent?categoryID=1&forType=1" class="stretched-link">Shop For Dog</a>
                            </div>
                            <div class="card-img-bottom">
                                <img src="/PetCity/img/home-page/82673973.jpg" class="img-type"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-10">
                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=1&forType=1" class="stretched-link">Food</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listDogFood">
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

                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=2&forType=1" class="stretched-link">Clothes</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listDogClothes">
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

                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=3&forType=1" class="stretched-link">Toys</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listDogToys">
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

                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=4&forType=1" class="stretched-link">Comestics</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listDogComestic">
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

            <div class="row">
                <div class="col-2">
                    <div class="wrap-type-sider my-2">
                        <div class="card">
                            <div class="card-title type-title">
                                <a href="/PetCity/loadExactlyContent?categoryID=1&forType=2" class="stretched-link">Shop For Cat</a>
                            </div>
                            <div class="card-img-bottom">
                                <img src="/PetCity/img/home-page/592685456.jpg" class="img-type"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-10">
                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=1&forType=2" class="stretched-link">Food</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listCatFood">
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

                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=2&forType=2" class="stretched-link">Clothes</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listCatClothes">
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

                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=3&forType=2" class="stretched-link">Toys</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listCatToys">
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

                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=4&forType=2" class="stretched-link">Comestics</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listCatComestic">
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

            <div class="row">
                <div class="col-2">
                    <div class="wrap-type-sider my-2">
                        <div class="card">
                            <div class="card-title type-title">
                                <a href="/PetCity/loadExactlyContent?categoryID=1&forType=3" class="stretched-link">Shop For Hamster</a>
                            </div>
                            <div class="card-img-bottom">
                                <img src="/PetCity/img/home-page/1060.jpg" class="img-type"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-10">
                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=1&forType=3" class="stretched-link">Food</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listHamsterFood">
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

                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=2&forType=3" class="stretched-link">Clothes</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listHamsterClothes">
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

                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=3&forType=3" class="stretched-link">Toys</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listHamsterToys">
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

                    <div class="row wrap-content-row my-2">
                        <div class="content-sub-title">
                            <a href="/PetCity/loadExactlyContent?categoryID=4&forType=3" class="stretched-link">Comestics</a>
                        </div>
                    </div>

                    <div class="row my-2 justify-content-center">
                        <s:iterator value="listHamsterComestic">
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
<%@include file="footer.jsp" %>