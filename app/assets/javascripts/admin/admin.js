// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function($) {

  //toggle menu states
  /*$("#menu_sections button.menu_section_label").on('click', function(){

    if( $(this).parents('li').hasClass('active') ){
      //close it
      $(this).siblings('.menu_section').slideUp(200);
      $(this).parents('li').removeClass('active');
    } else {
      $(this).siblings('.menu_section').slideDown(200);
      $(this).parents('li').addClass('active');
    }

    //return false;

  });*/

  //load up custom select fields
  $('select').customSelect();

  //color pickers!
  $('input.colorPicker').minicolors({
    position: 'bottom right'
  });

  //UI Slider
  $('#background_opacity_slider .sliderbar').slider({
    range: "min",
    value: 37,
    min: 0,
    max: 100,
    step: 1,
    slide: function( event, ui ) {
      $( "#background_opacity_slider .slider_value" ).text( ui.value ); //sets vaule on slide
    }
  });
  //set initial value on load
  $( "#background_opacity_slider .slider_value" ).text( $( "#background_opacity_slider .sliderbar" ).slider( "value" ) );


});