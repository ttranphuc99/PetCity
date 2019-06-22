function deleteAccessory(id, name) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to delete accessory ID: " + id + ", Name: " + name;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/PetCity/deleteAccessory?id=" + id;
}

function deleteUser(username, name, role) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to delete Username: " + username + ", Name: " + name;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/PetCity/banUser?id=" + username + "&role=" +role;
}

function deleteStaff(id, name) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to delete staff ID: " + id + ", Name: " + name;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/PetCity/deleteStaff?id=" + id;
}

function deleteService(id, name) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to delete service ID: " + id + ", Name: " + name;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/PetCity/deleteService?id=" + id;
}

function deletePet(id, name) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to delete Pet's name: " + name;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/PetCity/deletePet?id=" + id;
}