function checkMatchConfirmPass(confirmID, passwordID) {
    var pass = document.getElementById(passwordID);
    var confirm = document.getElementById(confirmID);

    if (confirm.value != pass.value) {
        confirm.setCustomValidity('Confirm password must be matching!');
    } else {
        confirm.setCustomValidity('');
    }
}

function checkPhone(id) {
    var phone = document.getElementById(id);
    console.log(phone.value);
    if (phone.value.length > 10) {
        phone.setCustomValidity('Phone is maximum length 10 number');
    } else {
        phone.setCustomValidity('');
    }
}