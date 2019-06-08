function deleteAccessory(id, name) {
    var modal = document.getElementsByClassName("modal-body")[0];
    modal.innerHTML = "Do you want to delete accessory ID: " + id + ", Name: " + name;

    var actionBtn = document.getElementById("deleteBtnAction");
    actionBtn.href = "/PetCity/deleteAccessory?id=" + id;
}