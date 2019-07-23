<%-- 
    Document   : home
    Created on : Jun 2, 2019, 7:25:34 PM
    Author     : Thien Phuc
--%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="sider.jsp" %>
<link rel="stylesheet" href="/css/admin-page/dashboard.css">
<div class="title mb-2">Dashboard</div>

<!-- Service -->
<div class="row mb-5">
    <div class="col-12 wrap-row">
        <div class="row box-title">Services:</div>

        <div class="row">
            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fab fa-canadian-maple-leaf service-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Available Services</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{totalService}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fab fa-itch-io service-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Total Invoices</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{totalServiceInvoice}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-check-circle service-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Confirm Invoices</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{confirmServiceInvoice}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent">
                                <s:number name="%{confirmServiceInvoice*1.0 / totalServiceInvoice}" minimumFractionDigits="2" type="percent"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-ban service-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Canceled Invoices</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{cancelServiceInvoice}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent">
                                <s:number name="%{cancelServiceInvoice*1.0 / totalServiceInvoice}" minimumFractionDigits="2" type="percent"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Accessory -->
<div class="row my-5">
    <div class="col-12 wrap-row">
        <div class="row box-title">Accessories:</div>

        <div class="row">
            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-asterisk accessory-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Available Accessories</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{totalAccessory}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-archive accessory-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Total Invoices</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{totalAccessoryInvoice}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-check-circle accessory-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Confirm Invoices</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{confirmAccessoryInvoice}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent">
                                <s:number name="%{confirmAccessoryInvoice*1.0 / totalAccessoryInvoice}" minimumFractionDigits="2" type="percent"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-ban accessory-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Canceled Invoices</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{cancelAccessoryInvoice}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent">
                                <s:number name="%{cancelAccessoryInvoice*1.0 / totalAccessoryInvoice}" minimumFractionDigits="2" type="percent"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Pet -->
<div class="row my-5">
    <div class="col-12 wrap-row">
        <div class="row box-title">Pet:</div>

        <div class="row">
            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fab fa-affiliatetheme pet-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Total Pet</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{totalPet}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-dog pet-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Total Dogs</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{totalDog}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent">
                                <s:number name="%{totalDog*1.0 / totalPet}" minimumFractionDigits="2" type="percent"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-cat pet-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Total Cats</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{totalCat}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent">
                                <s:number name="%{totalCat*1.0 / totalPet}" minimumFractionDigits="2" type="percent"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-paw accessory-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Total Hamsters</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{totalHamster}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent">
                                <s:number name="%{totalHamster*1.0 / totalPet}" minimumFractionDigits="2" type="percent"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row my-5">
    <!-- User -->
    <div class="col-6 wrap-row">
        <div class="row box-title">User:</div>

        <div class="row">
            <div class="col-6">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-user-circle member-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Total Members</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{totalMem}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-headset member-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Total Admin:</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{totalAd}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Staff -->
    <div class="col-6 wrap-row">
        <div class="row box-title">Staff:</div>

        <div class="row">
            <div class="col-6">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-splotch staff-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Total Staff</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{totalStaff}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6">
                <div class="row box align-items-center">
                    <div class="col-3">
                        <i class="fas fa-stamp staff-icon"></i>
                    </div>

                    <div class="col-9">
                        <div class="row">
                            <div class="col-12 box-label">Available Staff</div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-info"><s:property value="%{availableStaff}"/></div>
                        </div>

                        <div class="row">
                            <div class="col-12 box-percent">
                                <s:number name="%{availableStaff*1.0 / totalStaff}" minimumFractionDigits="2" type="percent"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://kit.fontawesome.com/37932e4a19.js"></script>
<%@include file="end-sider.jsp" %>