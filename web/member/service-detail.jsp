<%-- 
    Document   : service-detail
    Created on : Jun 26, 2019, 1:07:20 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s" %>
<%@include file="/publicPage/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/PetCity/css/member-page/service-detail.css">
<div id="snackbar">
    <s:property value="%{mess}" />
</div>

<div class="wrapper my-3">
    <div class="wrap-img-service">
        <img src="/PetCity/img/file/service/<s:property value="%{dto.image}"/>" class="img-service">
    </div>

    <div class="container my-4">
        <div class="row my-3 justify-content-center">
            <span class="service-name"><s:property value="%{dto.name}"/></span>
        </div>

        <div class="row my-3">
            <span class="label-bold">Duration: </span> 
            <span> <s:property value="%{dto.duration}"/> hour</span>
        </div>

        <div class="row my-3">
            $<span class="price"><s:property value="%{dto.price}"/></span>
        </div>

        <div class="row my-3">
            <span class="label-bold">Description:</span>
            <p><s:property value="%{dto.description}"/></p>
        </div>

        <form method="POST" action="/PetCity/bookService">
            <div class="row my-3">
                <label class="label-bold">Your Pet:</label>
                <select name="petId" class="custom-select" required>
                    <s:iterator value="%{listPet}">
                        <option <s:if test="%{petId == id}">selected</s:if> value="<s:property value="%{id}"/>">
                            <s:property value="%{name}"/>
                        </option>
                    </s:iterator>
                </select>
            </div>

            <div class="row my-3">
                <label class="label-bold">Time:</label>
                <select name="timeStart" id="time" class="custom-select" required onchange="checkTime()">
                    <option <s:if test="%{timeStart == 8}">selected</s:if> value="8">8:00</option>
                    <option <s:if test="%{timeStart == 8.5}">selected</s:if> value="8.5">8:30</option>
                    <option <s:if test="%{timeStart == 9}">selected</s:if> value="9">9:00</option>
                    <option <s:if test="%{timeStart == 9.5}">selected</s:if> value="9.5">9:30</option>
                    <option <s:if test="%{timeStart == 10}">selected</s:if> value="10">10:00</option>
                    <option <s:if test="%{timeStart == 10.5}">selected</s:if> value="10.5">10:30</option>
                    <option <s:if test="%{timeStart == 11}">selected</s:if> value="11">11:00</option>
                    <option <s:if test="%{timeStart == 13.5}">selected</s:if> value="13.5">13:30</option>
                    <option <s:if test="%{timeStart == 14}">selected</s:if> value="14">14:00</option>
                    <option <s:if test="%{timeStart == 14.5}">selected</s:if> value="14.5">14:30</option>
                    <option <s:if test="%{timeStart == 15}">selected</s:if> value="15">15:00</option>
                    <option <s:if test="%{timeStart == 15.5}">selected</s:if> value="15.5">15:30</option>
                    <option <s:if test="%{timeStart == 16}">selected</s:if> value="16">16:00</option>
                    <option <s:if test="%{timeStart == 16.5}">selected</s:if> value="16.5">16:30</option>
                    <option <s:if test="%{timeStart == 17}">selected</s:if> value="17">17:00</option>
                    <option <s:if test="%{timeStart == 17.5}">selected</s:if> value="17.5">17:30</option>
                    <option <s:if test="%{timeStart == 18}">selected</s:if> value="18">18:00</option>
                </select>
            </div>

            <div class="row my-3">
                <label class="label-bold">Day:</label>
                <input type="text" name="doingDate" class="form-control" id="date" readonly>
            </div>
            <div class="row">
                <font color="red">
                <s:property value="%{error}"/>
                </font>
            </div>
            <div class="row my-3 justify-content-center">
                <input type="hidden" name="serviceId" value='<s:property value="%{dto.id}"/>'>
                <input type="submit" class="btn btn-primary" value="Book">
            </div>
        </form>
    </div>
</div>
<script src="/PetCity/js/member-page/book-service.js"></script>
<%@include file="/publicPage/footer.jsp" %>