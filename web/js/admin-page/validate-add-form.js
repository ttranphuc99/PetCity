function validate() {
    var check = true;
    var description = document.getElementById("description");
    var mess = "";

    var file = document.getElementById("image");
    if (file != null) {
        var filename = file.value;
        var extension = filename.split('.').pop().toLowerCase();
        if (file.files[0] != null) {
            var size = file.files[0].size;
            if (extension != "jpg" && extension != "jpeg" && extension != "png") {
                mess = "Error extension of image. Must be jpg, jpeg or png.";
                check = false;
            } else if (size >= 2102840) {
                mess = "Image is too big for our server.";
                check = false;
            }
        }
    }

    if (description != null) {
        var regex = "^[^`~@#<>]*$";
        if (description.value.match(regex) == null) {
            mess += "Description cannot contains special characters.";
            check = false;
        }
    }

    if (!check) {
        document.getElementById("snackbar").innerHTML = mess;
        showSnackbar();
    }
    console.log("Do");
    return check;
}