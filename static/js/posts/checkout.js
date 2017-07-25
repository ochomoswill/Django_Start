/**
 * Created by chomsky on 18/07/17.
 */



$(document).ready(function () {
    if (localStorage.getItem("cart_total") === null) {
        document.getElementById("cart_total").innerHTML = 0;
    } else {
        document.getElementById("cart_total").innerHTML = localStorage.getItem("cart_total");
    }


    /*if (localStorage.getItem("arr_item_name") != null) {
        arr_item_name = JSON.parse(localStorage.getItem("arr_item_name"));
        var product_name = document.getElementById("product_name").innerHTML;
        for (var i = 0; i < arr_item_name.length; i++) {
            if (product_name === arr_item_name[i]) {

                console.log("You exist in the cart");
                changeBtns();

                break;


            }
        }

    }*/
});

var loader = "" +
    "<div style='color:white' class='alert alert-info alert-dismissible fade show' role='alert'>" +
    "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
    "<span aria-hidden='true'>&times;</span>" +
    "</button>" +
    "<strong>KIndly wait as we process the data...</strong>" +
    "</div>";


function alert(message) {

    var alert_message = "" +
        "<div style='color:white' class='alert alert-success alert-dismissible fade show' role='alert'>" +
        "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
        "<span aria-hidden='true'>&times;</span>" +
        "</button>" +
        "<strong>" + message + "</strong>" +
        "</div>";

    return alert_message;

}


function changeBtns() {
    var elem = document.getElementById('add_to_cart_btn');
    if(elem!== null)
    {
        elem.parentNode.removeChild(elem);
    }


    document.getElementById("already_in_cart_btn").innerHTML = "<a href='#' class='add-cart item_add' id='already_in_cart_btn'" +
        "style='background:#274b37; text-transform: none'>ADDED TO CART</a>";
}

//For getting CSRF token
function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

function post(data, url) {


    var request = new XMLHttpRequest();

    request.open("POST", url, true);

    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    // Only send the token to relative URLs i.e. locally.
    request.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
    request.onreadystatechange = function () {
        console.log("request.readyState = " + request.readyState + "request.status = " + request.status);
        if (request.readyState == 4 && request.status == 200) {

            var obj = JSON.parse(request.responseText);

            //document.getElementById("message").innerHTML = "";
            //document.getElementById("update_message").innerHTML = alert(obj.data);
            console.log(obj.data);
            document.getElementById("cart_total").innerHTML = obj.data;

            localStorage.setItem("cart_total", obj.data);

            //document.getElementById("cart_total").innerHTML = "I am here";


            console.log("posted the data");
            changeBtns();
        }

    };

    request.send(data);
}

function setLoader() {
    document.getElementById("message").innerHTML = loader;
}

function resetLoader() {
    document.getElementById("message").innerHTML = "";
}

function post_add_to_chart_goods(product_id, product_type) {

    //setLoader();

    var url = "/checkout_goods/";


    var data = "&product_id=" + product_id +
        "&product_type=" + product_type;

    post(data, url);


    //setTimeout(function() {
    //    document.getElementById("update_message").innerHTML = "";
    //}, 3000);

    //reset form;
    //reset_post_job_form();
}




