<%-- 
    Document   : footer
    Created on : Jun 2, 2019, 6:20:23 PM
    Author     : Thien Phuc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div style="position: fixed; top: 70px; right: 10px; z-index: 1000" id="noti">

</div>

<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog w-75 modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="container">
                    <span style="display: none;" id="accessoryDetailID">-1</span>
                    <div class="row">
                        <div class="col-6 justify-content-center align-items-center">
                            <img src="/img/file/accessory/3.jpg" class="accessory-img-modal" id="accessoryImg">
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

<script src="/js/public-page/show-detail-acces.js"></script>

<footer>
    <div class="text-center">
        <p>PetCity.vn - Hệ thống Siêu thị đồ thú cưng hàng đầu VN</p>
        <p>Re-developed by Thien Phuc - FPT University</p>
    </div>
</footer>
<script src="/js/public-page/show-snackbar.js"></script>
</body>

</html>
