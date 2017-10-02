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
//= require jquery
//= require jquery_ujs
//= require rails-timeago
// require rails-ujs
//= require turbolinks
//= require twitter/bootstrap
//= require bootstrap-toggle
//= require moment
//= require bootstrap-datetimepicker
//= require md_simple_editor
//= require moment
//= require fullcalendar
//= require_tree .

$(document).on('ready page:change', function() {
    $('input[type="checkbox"].toggle').bootstrapToggle(); // assumes the checkboxes have the class "toggle"
});

function eventCalendar() {
    return $('#calendar').fullCalendar({
        events: '/series/feed.json'
    });
};
function clearCalendar() {
    $('#calendar').fullCalendar('delete'); // In case delete doesn't work.
    $('#calendar').html('');
};
$(document).on('turbolinks:load', eventCalendar);
$(document).on('turbolinks:before-cache', clearCalendar)
