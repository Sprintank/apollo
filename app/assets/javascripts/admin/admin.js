// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
jQuery(document).ready(function($) {

  //toggle menu states
  $("#menu_sections button.menu_section_label").on('click', function(){

    if( $(this).parents('li').hasClass('active') ){
      //close it
      $(this).siblings('.menu_section').slideUp(200);
      $(this).parents('li').removeClass('active');
    } else {
      $(this).siblings('.menu_section').slideDown(200);
      $(this).parents('li').addClass('active');
    }

  });

  //load up custom select fields
  $('select').customSelect();

});