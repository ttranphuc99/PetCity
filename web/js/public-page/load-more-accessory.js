function loadMore(type, category, page) {
    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var responese = xhttp.responseText;
            console.log(responese);
            process(responese, type, category, page);
        }
    }

    var host = window.location.host;
    xhttp.open("GET", "http://" +host+ "/PetCity/ajaxLoadMoreAccessory?forType=" +type+ "&categoryID=" +category+ "&page=" +page, true);
    xhttp.send();
}

function process(json, type, category, page) {
    var result = JSON.parse(json);

    var more = result.more;

    if (more) {
        document.getElementById("view-more").setAttribute("onclick", "loadMore(" +type+ "," +category+ "," +(page+1)+ ")");
    } else {
        document.getElementById("view-more").style.display = "none";
    }

    for (var o in result.list) {
        renderAccessory(result.list[o]);
    }
}

function renderAccessory(obj) {

    var ele = 
    '<div class="wrap-accessories card justify-content-center mx-2">' +
        '<div class="wrap-accessory-img card-img-top">' +
            '<img src="/PetCity/img/file/accessory/' +obj.image+ '" class="accessory-img">' +
        '</div>' +
        '<div class="card-body">' +
            '<div class="card-text accessory-name text-center">' +obj.name+ '</div>' +
            '<div class="card-title accessory-price text-center">$' +obj.price+ '</div>' +
            '<div class="wrap-btn-view-accessory text-center">' +
                '<button class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" onclick="loadAccessory(' +obj.id+ ')">View detail</button>' +
            '</div>' +
        '</div>' +
    '</div>';

    $("#wrap-accessory-list").append(ele);
}