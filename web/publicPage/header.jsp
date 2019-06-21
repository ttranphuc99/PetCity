<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Pet City</title>
        <link rel="stylesheet" type="text/css" href="/PetCity/css/public-page/header-footer.css">
        <link rel="stylesheet" type="text/css" href="/PetCity/css/public-page/snackbar.css">
        <link rel="stylesheet" type="text/css" href="/PetCity/css/bootstrap/bootstrap.css">
        <script src="/PetCity/js/bootstrap/jquery-1.9.1.min.js"></script>
        <script src="/PetCity/js/bootstrap/popper.min.js"></script>
        <script src="/PetCity/js/bootstrap/bootstrap.js"></script>
        <script src="/PetCity/js/public-page/add-accessory-to-cart.js"></script>
    </head>

    <body>
        <header>
            <div class="row mx-5 my-4 text-center align-items-center">
                <!-- logo -->
                <div class="col-3">
                    <a href="/PetCity/"><img class="header-logo" src="/PetCity/img/header-footer/petcity.png"></a>                    
                </div>

                <!-- search -->
                <div class="col-6" style="margin-top: 10px">
                    <form action="">
                        <div class="row">
                            <div class="form-group has-danger col-10 mx-0 px-0">
                                <input type="text" name="txtSearch" class="form-control form-control-danger" placeholder="Search..."
                                       required>
                            </div>
                            <div class="col-2 mx-0 px-0">
                                <input type="submit" class="btn btn-primary" name="action" value="Search">
                            </div>
                        </div>
                    </form>
                </div>

                <!-- login + cart -->
                <div class="col-3">
                    <div class="row">
                        <!-- login btn -->
                        <div class="col-8">
                            <s:if test="%{#session.USERNAME != null}">
                                <a href="/PetCity/loadProfile" class="nav-link">Hello, <s:property value="%{#session.FULLNAME}"/></a>
                                <a href="/PetCity/logout" class="btn btn-danger" role="button">Logout</a>
                            </s:if>
                            <s:else>
                                <a href="/PetCity/publicPage/login.jsp" class="btn btn-danger" role="button">Login</a>
                            </s:else>
                        </div>

                        <!-- cart -->
                        <div class="col-4 wrap-cart">
                            <a href="/PetCity/publicPage/viewCart.jsp" class="nav-link">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="icon-quantity"><span id="quantityCart">0</span></div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12">
                                        <img src="/PetCity/img/header-footer/red-shopping-cart-hi.png" class="img-cart">
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
                <div class="col-2"><a href="#" role="button" class="nav-link">SHOP FOR DOG</a></div>
                <div class="col-2"><a href="#" role="button" class="nav-link">SHOP FOR CAT</a></div>
                <div class="col-2"><a href="#" role="button" class="nav-link">SHOP FOR HAMSTER</a></div>
                <div class="col-2"><a href="#" role="button" class="nav-link">SERVICE</a></div>
                <div class="col-2"></div>
            </div>
        </nav>