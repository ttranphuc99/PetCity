$(window).on('load', function() {
    checkTime();
});

function checkTime() {
    console.log("in");
    var time = document.getElementById("time").value;

    var curTime = new Date();
    var curHour = curTime.getHours();
    var curMinutes = curTime.getMinutes();
    curHour += curMinutes / 60;

    var weekday = new Array(7);
    weekday[0] = "Sunday";
    weekday[1] = "Monday";
    weekday[2] = "Tuesday";
    weekday[3] = "Wednesday";
    weekday[4] = "Thursday";
    weekday[5] = "Friday";
    weekday[6] = "Saturday";

    var day = document.getElementById("date");
    if (time >= curHour+1) {
        day.innerHTML = weekday[curTime.getDay()] + " - " + curTime.getDate() + "/" + (curTime.getMonth() + 1) + "/" + curTime.getFullYear();
    } else {
        curTime = new Date(curTime.getFullYear(), curTime.getMonth(), curTime.getDate() + 1);
        day.innerHTML = weekday[curTime.getDay()] + " - " + curTime.getDate() + "/" + (curTime.getMonth() + 1) + "/" + curTime.getFullYear();
    }
}