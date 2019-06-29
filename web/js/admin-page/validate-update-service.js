function validate() {
    var check;
    var staffEle = document.getElementById("staff");
    var statusEle = document.getElementById("status");
    var staff = staffEle.value;
    var status = statusEle.value;

    if (status == -1 && staff != -1) {
        staffEle.setCustomValidity('Must let staff blank to cancel invoice');
        check = false;
    } else if (status == 0 && staff != -1) {
        staffEle.setCustomValidity('Must left staff blank to set invoice to waiting');
        check = false;
    } else if (staff == -1 && status == 1) {
        staffEle.setCustomValidity('Must set staff to confirm invoice');
        check = false;
    } else {
        staffEle.setCustomValidity('');
        check = true;
    }
    return check;
}