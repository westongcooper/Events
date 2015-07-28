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
            console.log(this.href);
            $.get( this.href, function ( code ) {
                var divs = $( code ).filter( function () {
                    return $( this ).is( 'div#event' )
                } );
                console.log(divs);
                divs.each( function () {
                    $( '.event-text' ).replaceWith( '<div class="event-text">' + $( this ).html() + '</div>' );
                } );
            } );
        } );
    } );
};
$(document).ready(ready2);
$(document).on('page:load', ready2);
function ready2() {
    $( function () {
        $( 'body' ).on( 'click', '.next_page', function ( evt ) {
            evt.preventDefault();
            console.log(this.href);
            $.get( this.href, function ( code ) {
                var next_page = $(code).filter('#page_content');
                $( '.page' ).replaceWith( next_page);
            } );
        } );
    } );
};
$(document).ready(ready3);
$(document).on('page:load', ready3);
function ready3() {
    $( function () {
        $( 'body' ).on( 'click', '.prev_page', function ( evt ) {
            evt.preventDefault();
            console.log(this.href);
            $.get( this.href, function ( code ) {
                var next_page = $(code).filter('#page_content');
                $( '.page' ).replaceWith( next_page);
            } );
        } );
    } );
}


    $( function () {
        $( 'body' ).on( 'click', '.attend', function ( evt ) {
            evt.preventDefault();
            var event = $.urlParam('id',this.href);
            $.get( this.href, function ( code ) {
                //var next_page = $(code).filter('#page_content');
                $( '.attend_'+ event ).replaceWith("<a class='unattend' href='/unattend_event?id=" + event + "'>unattend</a>");
            } );
        } );
    } );



    $( function () {
        $( 'body' ).on( 'click', '.unattend', function ( evt ) {
            evt.preventDefault();
            var event = $.urlParam('id',this.href);
            $.get( this.href, function ( code ) {
                //var next_page = $(code).filter('#page_content');
                $( '.unattend_'+ event ).replaceWith("<a class='attend' href='/attend_event?id=" + event + "'>attend</a>");
            } );
        } );
    } );

$.urlParam = function(name,url){
    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(url);
    return results[1] || 0;
}