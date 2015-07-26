// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require turbolinks
//= require_tree .

$(document).ready(ready);
$(document).on('page:load', ready);
function ready() {
    $( function () {
        $( 'body' ).on( 'click', '.show_event', function ( evt ) {
            evt.preventDefault();
            console.log( "click" )
            $.get( this.href, function ( code ) {
                var divs = $( code ).filter( function () {
                    return $( this ).is( 'div#event' )
                } );
                divs.each( function () {
                    $( '.event-text' ).replaceWith( '<div class="event-text">' + $( this ).html() + '</div>' );
                } );
            } );
        } );
    } );
}