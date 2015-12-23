// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

    var managerField = $('.manager'),
    select = $('select');
    if (select.val() == "Manager" || select.val() == "Asst. Manager"){
        managerField.removeAttr('readonly');
    }
select.on('change', function(e) {
    if (e.currentTarget.value == "Manager" || e.currentTarget.value == "Asst. Manager"){
        managerField.removeAttr('readonly');
    } else {
        managerField[1].value = "";
        managerField[3].value = "";
        managerField.attr('readonly', 'readonly');
    }
    readonly = $('[readonly]')
})
