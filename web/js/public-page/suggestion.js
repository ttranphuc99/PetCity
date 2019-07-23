function searchAccessory() {
    $("#suggestion").empty();
    var search = $("#txtSearch-suggestion").val();

    if (search.trim().length > 1) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                renderSuggestion(xhttp.responseText);
            }
        }

        var host = window.location.host;
        xhttp.open("GET", "https://" +host+ "/searchNameAccessory?search=" + search, true);
        xhttp.send();
    }
}

function clearSuggestion() {
    setTimeout(function(){ $("#suggestion").empty(); }, 500);
}

function renderSuggestion(json) {
    $("#suggestion").empty();
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
                    '<a href="/searchNameAccessory?search=' +obj.search+ '&action=page" >View More...</a>' +
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
            '<img class="suggestion-img" src="/img/file/accessory/' +obj.image+ '"/>' +
        '</div>' +
        '<div class="col-4">' +obj.name+ '</div>' +
        '<div class="col-2 suggestion-price">$' +obj.price+ '</div>' +
        '<div class="col-3">' +
            '<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#exampleModalCenter"' + 
            'onclick="loadAccessory(' +obj.id+ ')">View detail</button>' +
        '</div>' +
    '</div>';

    $("#suggestion").append(ele);
}

function searchMore(search, page) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            process(xhttp.responseText, search, page);
        }
    }

    var host = window.location.host;
    xhttp.open("GET", "https://" +host+ "/searchNameAccessory?search=" + search + "&page=" + page, true);
    xhttp.send();
}

function process(json, search, page) {
    var obj = JSON.parse(json);

    var more = obj.page < obj.numOfPage;

    if (more) {
        document.getElementById("view-more").setAttribute("onclick", "searchMore('" +search+ "'," +(page+1)+ ")");
    } else {
        document.getElementById("view-more").style.display = "none";
    }

    for (var o in obj.result) {
        renderAccessory(obj.result[o]);
    }
}

function renderAccessory(obj) {

    var ele = 
    '<div class="wrap-accessories card justify-content-center mx-2">' +
        '<div class="wrap-accessory-img card-img-top">' +
            '<img src="/img/file/accessory/' +obj.image+ '" class="accessory-img">' +
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