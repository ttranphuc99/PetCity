window.onload = function() {
    var check = document.getElementById("snackbar").innerHTML == "";
    if (!check) showSnackbar();
}

function showSnackbar() {
  // Get the snackbar DIV
  var x = document.getElementById("snackbar");

  // Add the "show" class to DIV
  x.className = "show";

  // After 3 seconds, remove the show class from DIV
  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}


