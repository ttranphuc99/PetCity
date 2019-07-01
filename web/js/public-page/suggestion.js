function searchAccessory() {
    $("#suggestion").empty();
    var search = $("#txtSearch-suggestion").val();

    if (search.trim().length > 2) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                renderSuggestion(xhttp.responseText);
            }
        }

        var host = window.location.host;
        xhttp.open("GET", "http://" +host+ "/PetCity/searchNameAccessory?search=" + search, true);
        xhttp.send();
    }
}

function clearSuggestion() {
    setTimeout(function(){ $("#suggestion").empty(); }, 500);
}

function renderSuggestion(json) {
    
    console.log(json);

    var obj = JSON.parse(json);

    if (obj.result.length != 0) {
        for (var o in obj.result) {
            buildElementSuggestion(obj.result[o]);
        }

        if (obj.page < obj.numOfPage) {
            var ele = 
            '<div class="row align-items-center">' +
                '<div class="col-12">' +
                    '<a href="/PetCity/searchNameAccessory?search=' +obj.search+ '&action=page" >View More...</a>' +
                '</div>' +
            '</div>';

            $("#suggestion").append(ele);
        }
    }
}

function buildElementSuggestion(obj) {
    var ele = 
    '<div class="row align-items-center">' +
        '<div class="col-3">' +
            '<img class="suggestion-img" src="/PetCity/img/file/accessory/' +obj.image+ '"/>' +
        '</div>' +
        '<div class="col-4">' +obj.name+ '</div>' +
        '<div class="col-2 suggestion-price">' +obj.price+ '</div>' +
        '<div class="col-3">' +
            '<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#exampleModalCenter"' + 
            'onclick="loadAccessory(' +obj.id+ ')">View detail</button>' +
        '</div>' +
    '</div>';

    $("#suggestion").append(ele);
}