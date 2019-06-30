function loadAccessory(id) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            showAccessory(xhttp.responseText);
        }
    }

    var host = window.location.host;
    xhttp.open("GET", "http://" +host+ "/PetCity/loadAccessoryDetail?id=" + id, true);
    xhttp.send();
}

function showAccessory(jsonData) {
    console.log(jsonData);
    var obj = JSON.parse(jsonData);
    
    var nameEle = document.getElementById("accessoryName");
    var brandEle = document.getElementById("accessoryBrand");
    var cateEle = document.getElementById("accessoryCategory");
    var typeEle = document.getElementById("accessoryType");
    var desEle = document.getElementById("accessoryDes");
    var priceEle = document.getElementById("accessoryPrice");
    var img = document.getElementById("accessoryImg");
    var id = document.getElementById("accessoryDetailID");

    nameEle.innerHTML = obj.name;
    brandEle.innerHTML = obj.brand;
    cateEle.innerHTML = obj.category;
    typeEle.innerHTML = obj.type;
    desEle.innerHTML = obj.description;
    priceEle.innerHTML = "$ " + obj.price;
    id.innerHTML = obj.id;

    img.src = "/PetCity/img/file/accessory/" + obj.image;
}