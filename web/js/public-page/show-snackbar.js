window.onload = function () {
    if ($("#snackbar").text().trim()) {
        showSnackbar();
    }

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            responseAddAccessoryToCart(xhttp.responseText, false);
        }
    }

    var host = window.location.host;
    xhttp.open("GET", "http://" +host+ "/addAccessoryToCart?id=-1", true);
    xhttp.send();
}

function showSnackbar() {
    // Get the snackbar DIV
    var x = document.getElementById("snackbar");

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    setTimeout(function () {
        x.className = x.className.replace("show", "");
    }, 3000);
}


