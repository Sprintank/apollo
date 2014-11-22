// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/*************************************
Toggle sidebar states
*************************************/

/*************************************
Toggle music selection tabs
*************************************/
(function($) {
  $.fn.musicTabs = function() {



  };
})(jQuery);
/*************************************
Fire everything off
*************************************/


jQuery(document).ready(function($) {

  //custom scrollbars on sidebar
  var settings = {
    verticalGutter: 0,
    contentWidth: 280,
    maintainPosition: false,
    stickToRight: true
  };
  var pane = $('#sidebar_content');
  pane.jScrollPane(settings);
  var api = pane.data('jsp');
  var i = 1;

  //toggle menu states
  $("#menu_sections button.menu_section_label").on('click', function(){

    if( $(this).parents('li').hasClass('active') ){
      //close it
      $(this).siblings('.menu_section').slideUp( 200, function(){
        api.reinitialise(); //reinitialize jscrollpane for resized sidebar
        $('select').trigger('render'); //re-render custom select fields
      });
      $(this).parents('li').removeClass('active');
    } else {
      $(this).siblings('.menu_section').slideDown( 200, function(){
        api.reinitialise(); //reinitialize jscrollpane for resized sidebar
        $('select').trigger('render'); //re-render custom select fields
      });
      $(this).parents('li').addClass('active');
    }

    //return false;

  });

  $(window).resize(function(){
    api.reinitialise();
  });

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