function deleteAccessory(id, name) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to delete accessory ID: " + id + ", Name: " + name;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/deleteAccessory?id=" + id;
}

function deleteUser(username, name, role) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to delete Username: " + username + ", Name: " + name;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/banUser?id=" + username + "&role=" +role;
}

function deleteStaff(id, name) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to delete staff ID: " + id + ", Name: " + name;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/deleteStaff?id=" + id;
}

function deleteService(id, name) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to delete service ID: " + id + ", Name: " + name;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/deleteService?id=" + id;
}

function deletePet(id, name) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to delete Pet's name: " + name;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/deletePet?id=" + id;
}

function cancelInvoice(id) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to cancel Invoice ID: " + id;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/cancelInvoiceService?id=" + id;
}