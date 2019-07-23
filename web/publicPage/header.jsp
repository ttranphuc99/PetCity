<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Pet City</title>
        <link rel="stylesheet" type="text/css" href="/css/public-page/header-footer.css">
        <link rel="stylesheet" type="text/css" href="/css/public-page/suggestion.css">
        <link rel="stylesheet" type="text/css" href="/css/public-page/snackbar.css">
        <link rel="stylesheet" type="text/css" href="/css/public-page/index.css">
        <link rel="stylesheet" type="text/css" href="/css/bootstrap/bootstrap.css">
        <script src="/js/bootstrap/jquery-1.9.1.min.js"></script>
        <script src="/js/bootstrap/popper.min.js"></script>
        <script src="/js/bootstrap/bootstrap.js"></script>
        <script src="/js/public-page/add-accessory-to-cart.js"></script>
    </head>

    <body>
        <header>
            <div class="row mx-5 my-4 text-center align-items-center">
                <!-- logo -->
                <div class="col-3">
                    <a href="/"><img class="header-logo" src="/img/header-footer/petcity.png"></a>                    
                </div>

                <!-- search -->
                <div class="col-6" style="margin-top: 10px">
                    <div>
                        <div class="row">
                            <div class="form-group has-danger col-12 mx-0 px-0 autocomplete">
                                <input type="text" id="txtSearch-suggestion" name="txtSearch" class="form-control form-control-danger" placeholder="Search..."
                                       required minlength=3 oninput="searchAccessory()" onfocusin="searchAccessory()" onfocusout="clearSuggestion()"
                                       value="<s:property value="%{search}"/>">
                                <div class="autocomplete-items" id="suggestion">
                                    <!-- <div class="row align-items-center">
                                        <div class="col-3">
                                            <img class="suggestion-img" src="/img/file/accessory/1.jpg"/>
                                        </div>
                                        <div class="col-4">
                                            Puppy food nutrition 1.5kg Smartheart
                                        </div>
                                        <div class="col-2 suggestion-price">
                                            $10.5
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#exampleModalCenter" onclick="loadAccessory(1)">View detail</button>
                                        </div>
                                    </div> -->
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- login + cart -->
                <div class="col-3">
                    <div class="row">
                        <!-- login btn -->
                        <div class="col-8">
                            <s:if test="%{#session.USERNAME != null}">
                                <a href="/loadProfile" class="nav-link">Hello, <s:property value="%{#session.FULLNAME}"/></a>
                                <a href="/logout" class="btn btn-danger" role="button">Logout</a>
                            </s:if>
                            <s:else>
                                <a href="/publicPage/login.jsp" class="btn btn-danger" role="button">Login</a>
                            </s:else>
                        </div>

                        <!-- cart -->
                        <div class="col-4 wrap-cart">
                            <a href="/publicPage/viewCart.jsp" class="nav-link">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="icon-quantity"><span id="quantityCart">0</span></div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12">
                                        <img src="/img/header-footer/red-shopping-cart-hi.png" class="img-cart">
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <nav>
            <div class="row text-center align-items-center w-100">
                <div class="col-2"></div>
                <div class="col-2"><a href="/loadExactlyContent?categoryID=1&forType=1" role="button" class="nav-link">SHOP FOR DOG</a></div>
                <div class="col-2"><a href="/loadExactlyContent?categoryID=1&forType=2" role="button" class="nav-link">SHOP FOR CAT</a></div>
                <div class="col-2"><a href="/loadExactlyContent?categoryID=1&forType=3" role="button" class="nav-link">SHOP FOR HAMSTER</a></div>
                <div class="col-2"><a href="/loadListService?type=1" role="button" class="nav-link">SERVICE</a></div>
                <div class="col-2"></div>
            </div>
        </nav>
        <script src="/js/public-page/suggestion.js"></script>