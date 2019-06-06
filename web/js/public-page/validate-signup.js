function checkMatchConfirmPass(confirmID, passwordID) {
    var pass = document.getElementById(passwordID);
    var confirm = document.getElementById(confirmID);

    if (confirm.value != pass.value) {
        confirm.setCustomValidity('Confirm password must be matching!');
    } else {
        confirm.setCustomValidity('');
    }
}