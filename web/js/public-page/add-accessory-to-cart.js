var count = 0;

function addAccessory() {
    var xhttp = new XMLHttpRequest();
    var id = document.getElementById("accessoryDetailID").innerHTML;

    if (id != null && id != "") {

        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                responseAddAccessoryToCart(xhttp.responseText, true);
            }
        }

        var host = window.location.host;
        xhttp.open("GET", "https://" +host+ "/addAccessoryToCart?id=" + id, true);
        xhttp.send();
    }
}

function responseAddAccessoryToCart(json, isShow) {
    console.log(json);
    var obj = JSON.parse(json);

    var quantityCart = document.getElementById("quantityCart");
    quantityCart.innerHTML = obj.quantityInCart;

    if (isShow) {
        $("#exampleModalCenter").modal('hide');

        $('#noti').append('<div class="toast" id="toast_' +count+ '" data-delay="7000" role="alert" aria-live="assertive" aria-atomic="true"><div class="toast-header"><button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="toast-body">'+ obj.mess +'</div></div>');
        $('#toast_'+ count).toast('show');
        setTimeout(function () {
            $('#toast_'+ count).toast('dispose');
        }, 7000);
        count++;
    }
}