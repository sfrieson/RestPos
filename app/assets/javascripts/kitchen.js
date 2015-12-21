// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
    var orders = $('.order')

        console.log("go")


    for(var i=0; i< orders.length; i++){
        order = orders.eq(i);
        var time = order.data('time');
        time = new Date(time);
        var elapsed = Date.now() - time.getTime();

        var min = 60 * 1000
        if (elapsed < (min/2)) {
            order.css('background-color', 'green')
        } else if (elapsed < min) {
            order.css('background-color', 'yellow')
        } else if (elapsed < min*2) {
            order.css('background-color', 'orange')
        } else if (elapsed > min*3) {
            order.css('background-color', 'red')
        }
    }


    //Every 10 seconds get new page (checking for new orders and updating colors)
    setTimeout(function(){ location.reload()}, 10000)




})
