// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var receipts = $('.receipt')
receipts.on('click', function(e) {
    e.preventDefault()
    var modal_bg = $('<div>').addClass('modal-bg')
    modal_bg.on('click', function(){modal_bg.remove()})
    var a = $(e.currentTarget)
    var path = a.attr('href')
    var iframe = $('<iframe>').attr('src', path).addClass('modal')
    modal_bg.append(iframe);
    $('body').append(modal_bg);
});
