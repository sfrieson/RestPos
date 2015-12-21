// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var closeBtn = '<i class="fa fa-times-circle close-btn fa-3x"></i>'
var modalBg = $('<div>').addClass('modal-bg')

var receipts = $('.receipt')
receipts.on('click', function(e) {
    e.preventDefault()

    var modal = $('<div>')

    modalBg.append(closeBtn);
    modalBg.on('click', function(){modal.remove()});
    $(closeBtn).on('click', function(){modal.remove()});
    var a = $(e.currentTarget);
    var path = a.attr('href');
    var iframe = $('<iframe>').attr('src', path).addClass('modal');
    modalBg.append(iframe);
    modal.append(modalBg);
    $('body').append(modal);
});
