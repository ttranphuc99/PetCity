<%-- 
    Document   : add-service
    Created on : Jun 5, 2019, 6:46:45 PM
    Author     : Thien Phuc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="/struts-tags" prefix="s" %>
<%@include file="sider.jsp" %>
<link rel="stylesheet" href="/PetCity/css/admin-page/add-service.css">
<div class="title mb-4">Service</div>

<div class="container-fluid">
    <form action="/PetCity/updateService" method="POST" enctype="multipart/form-data" onsubmit="return validate();">
        <input type="hidden" value="<s:property value="%{dto.id}"/>" name="id"/>
        <input type="hidden" value="<s:property value="%{dto.image}"/>" name="imgName"/>
        
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="accName">Service Name:</label>
                    <input type="text" id="accName" name="name" class="form-control" required maxlength="50"
                           value="<s:property value="%{dto.name}"/>">
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label for="accPrice">Price:</label>
                    <input type="number" step="0.01" id="accPrice" name="price" class="form-control" min="0" required
                           value="<s:property value="%{dto.price}"/>">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label>For type:</label>
                    <select name="type" class="custom-select">
                        <s:iterator value="listType">
                            <option value='<s:property value="%{id}" />' <s:if test="%{dto.type.id == id}">selected</s:if> >
                                <s:property value="%{name}"/>
                            </option>
                        </s:iterator>
                    </select>
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label>Duration</label>
                    <select name="duration" class="custom-select">
                        <option value="0.5" <s:if test="%{dto.duration == 0.5}">selected</s:if>>0:30</option>
                        <option value="1" <s:if test="%{dto.duration == 1}">selected</s:if>>1:00</option>
                        <option value="1.5" <s:if test="%{dto.duration == 1.5}">selected</s:if>>1:30</option>
                        <option value="2" <s:if test="%{dto.duration == 2}">selected</s:if>>2:00</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description" required><s:property value="%{dto.description}"/></textarea>
                </div>
            </div>
        </div>
                    
       <div class="row">
            <div class="col-12">
                <div class="form-group">
                    <img class="img-accessory" src='/PetCity/img/file/service/<s:property value="%{dto.image}"/>' style="max-width: 75vw">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="form-group">
                    <label class="control-label">Image:</label>
                    <input type="file" name="image" id="image" class="filestyle" data-icon="false">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="form-group">
                    <label>Staff doing:</label>
                    <div class="wrap-list-staff">
                        <s:iterator value="listStaff" status="st">
                            <div class="staff">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id='customCheck_<s:property value="%{id}"/>' value='<s:property value="%{id}"/>' 
                                           name="staff" <s:if test="%{delete}">checked</s:if> >
                                    
                                    <label class="custom-control-label" for='customCheck_<s:property value="%{id}"/>'>
                                        <s:property value="%{name}"/>-<s:property value="%{id}"/>
                                    </label>
                                </div>
                            </div>
                        </s:iterator>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group text-center py-3">
            <input type="submit" class="btn btn-success w-25 font-label" name="action" value="Update">
        </div>
    </form>
    <script src="/PetCity/js/admin-page/validate-add-form.js"></script>
</div>
<%@include file="end-sider.jsp" %>