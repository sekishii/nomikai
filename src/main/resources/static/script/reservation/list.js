$(function(){

    initReservationList();
});


var initReservationList = function() {

    $.ajax({
        headers : {
            'Accept' : 'application/json',
            'Content-Type' : 'application/json'
        },
        url : '/reservation/list',
        type : 'GET',
        success : function(res) {

        }
    });
}