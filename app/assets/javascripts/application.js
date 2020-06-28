// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap

// Google_GeolocationAPI
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        alert("Geolocation is not supported by this browser.");
    }
}

function showPosition(position) {
    $.ajax({
        type: 'GET',
        url: `https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.coords.latitude},${position.coords.longitude}&sensor=true&key=AIzaSyDCf-kPe1Xxxn8dUeYWJ8i2BpTpHVwN1AM&language=ja`,
        }).then(function(response){
        // 以下の出力形式を変更
        console.log(response);
        })
}

// Html5_GeoLocationAPI
// user一覧ページで現在地周辺のユーザーを絞り込む機能に使用
function getLocationByHtml5() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPositionByHtml5, errorCallbackByHtml5, {enableHighAccuracy:true, timeout:6000, maximumAge:600000});
    } else { 
        alert("Geolocation is not supported by this browser.");
    }
}

function showPositionByHtml5(position) {
    alert(`${position.coords.latitude},${position.coords.longitude}`);
}

function errorCallbackByHtml5(error) {
    var err_msg = "";
    switch(error.code)
    {
      case 1:
        err_msg = "位置情報の利用が許可されていません";
        break;
      case 2:
        err_msg = "デバイスの位置が判定できません";
        break;
      case 3:
        err_msg = "タイムアウトしました";
        break;
    }

    alert(err_msg);

    // document.getElementById("show_result").innerHTML = err_msg;
    //デバッグ用→　document.getElementById("show_result").innerHTML = error.message;
}