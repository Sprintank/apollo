// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/*************************************
Toggle sidebar states
*************************************/
(function($) {
  $.fn.sidebarAccordion = function(speed, api) {

    $(this).find('button.menu_section_label').on('click', function(){

      if( $(this).parents('li').hasClass('active') ){
        //close it
        $(this).siblings('.menu_section').slideUp( speed, function(){
          api.reinitialise(); //reinitialize jscrollpane for resized sidebar
          $('select').trigger('render'); //re-render custom select fields
        });
        $(this).parents('li').removeClass('active');
      } else {
        $(this).siblings('.menu_section').slideDown( speed, function(){
          api.reinitialise(); //reinitialize jscrollpane for resized sidebar
          $('select').trigger('render'); //re-render custom select fields
        });
        $(this).parents('li').addClass('active');
      }

      //return false;

    });

  };
})(jQuery);


/*************************************
Toggle music selection tabs
*************************************/
(function($) {
  $.fn.musicTabs = function() {

    var container = $(this);
    var tabs = container.find(".tabs > li");
    var lists = container.find(".music_list");

    //Make sure everything is off by default
    $(lists).hide().removeClass('active');
    $(tabs).removeClass('active');

    //Set active state for first item
    $(tabs[0]).addClass('active');
    $(lists[0]).show().addClass('active');

    //Do stuff when clicking a tab
    $(tabs).on('click', function(){

      var curTab = $(this);
      var listID = $(curTab).find('button').data('list-id');

      //set all tabs to inactive
      $(tabs).removeClass('active');

      //hide and toggle all lists
      $(lists).hide().removeClass('active');

      //set new active tab
      $(curTab).addClass('active');

      //show correct list
      $(container).find('div[data-list-id="'+listID+'"]').show().addClass('active');

    });

  };
})(jQuery);

/*************************************
Choose background Image
*************************************/
(function($) {
  $.fn.backgroundImageSelect = function() {

      var imageContainer = $(this);

      $(imageContainer).find('li').on('click', function(){

        //get selected image ID
        var imageID = $(this).attr('id');
        imageID = imageID.replace('image-', '');

        //set value of new ID
        $('input[name="band[field_option_values][background_image]"]').val(imageID);

        //set current class
        $(imageContainer).find('li').removeClass('current');
        $(this).addClass('current');

      });

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
    maintainPosition: true,
    stickToRight: true
  };
  var pane = $('#sidebar_content');
  pane.jScrollPane(settings);
  var api = pane.data('jsp');
  var i = 1;

  $(window).resize(function(){
    api.reinitialise();
  });

  //toggle menu areas
  $('ul#menu_sections').sidebarAccordion(200, api);

  //toggle music list tabs
  $(".music_selector").musicTabs();

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

  //backgorund image selection
  $('.background_picker').backgroundImageSelect();

});