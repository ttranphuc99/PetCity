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
<div class="content">
    <div class="container">
        <div class="wrap-type">
            <div class="row">
                <div class="col-3">
                    <div class="wrap-type-sider">
                        <!-- dog -->
                        <div class="type-title">For Dog</div>

                        <div class="wrap-imf-type">
                            <img src="" class="">
                        </div>
                    </div>
                </div>

                <div class="col-9">
                    <div class="row">
                        <div class="float-left">
                            <!-- food dog -->
                            <h4 class="content-sub-title">Food</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listDogFood">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>

                    <div class="row">
                        <div class="float-left">
                            <!-- Clothes dog -->
                            <h4 class="content-sub-title">Clothes</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listDogClothes">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>

                    <div class="row">
                        <div class="float-left">
                            <!-- toys dog -->
                            <h4 class="content-sub-title">Toys</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listDogToys">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>

                    <div class="row">
                        <div class="float-left">
                            <!-- Comestics dog -->
                            <h4 class="content-sub-title">Comestics</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listDogComestic">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>
                </div>

            </div>
        </div>

        <div class="wrap-type">
            <div class="row">
                <div class="col-3">
                    <div class="wrap-type-sider">
                        <!-- cat -->
                        <div class="type-title">For Cat</div>

                        <div class="wrap-imf-type">
                            <img src="" class="">
                        </div>
                    </div>
                </div>

                <div class="col-9">
                    <div class="row">
                        <div class="float-left">
                            <!-- food cat -->
                            <h4 class="content-sub-title">Food</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listCatFood">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>

                    <div class="row">
                        <div class="float-left">
                            <!-- Clothes cat -->
                            <h4 class="content-sub-title">Clothes</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listCatClothes">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>

                    <div class="row">
                        <div class="float-left">
                            <!-- toys cat -->
                            <h4 class="content-sub-title">Toys</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listCatToys">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>

                    <div class="row">
                        <div class="float-left">
                            <!-- Comestics cat -->
                            <h4 class="content-sub-title">Comestics</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listCatComestic">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>
                </div>

            </div>
        </div>

        <div class="wrap-type">
            <div class="row">
                <div class="col-3">
                    <div class="wrap-type-sider">
                        <!-- hamster -->
                        <div class="type-title">For Hamster</div>

                        <div class="wrap-imf-type">
                            <img src="" class="">
                        </div>
                    </div>
                </div>

                <div class="col-9">
                    <div class="row">
                        <div class="float-left">
                            <!-- food hamster -->
                            <h4 class="content-sub-title">Food</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listHamsterFood">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>

                    <div class="row">
                        <div class="float-left">
                            <!-- Clothes hamster -->
                            <h4 class="content-sub-title">Clothes</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listHamsterClothes">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>

                    <div class="row">
                        <div class="float-left">
                            <!-- toys hamster -->
                            <h4 class="content-sub-title">Toys</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listHamsterToys">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>

                    <div class="row">
                        <div class="float-left">
                            <!-- Comestics hamster -->
                            <h4 class="content-sub-title">Comestics</h4>
                        </div>

                        <div class="float-right">
                            <a href="#" class="">More...</a>
                        </div>
                    </div>

                    <div class="row">
                        <s:iterator value="listHamsterComestic">
                        <div class="wrap-accessories">
                            <div class="wrap-accessory-img">
                                <img src="/PetCity/img/file/accessory/<s:property value="%{image}"/>" class="accessory-img">
                            </div>

                            <div class="wrap-accessory-name">
                                <s:property value="%{name}"/>
                            </div>

                            <div class="wrap-accessory-price">
                                $<s:property value="%{price}"/>
                            </div>

                            <div class="wrap-btn-view-accessory">
                                <button class="btn btn-danger">View detail <s:property value="%{id}"/></button>
                            </div>
                        </div>
                        </s:iterator>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</div>
<%@include file="footer.jsp" %>