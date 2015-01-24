// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/*************************************
Toggle sidebar states
*************************************/
(function($) {
  $.fn.sidebarAccordion = function(speed, api) {

    var menu = $(this);

    var cookie = $.cookie("panelState");
    var expanded = cookie ? cookie.split("|").getUnique() : [];
    var cookieExpires = 7;

    $.each( expanded, function(){
      $('#' + this).children('.menu_section').show(function(){
        api.reinitialise(); //reinitialize jscrollpane for resized sidebar
        $('select').trigger('render'); //re-render custom select fields
      }).addClass('visible');
      $('#' + this).addClass('active');
    });

    $(this).find('button.menu_section_label').on('click', function(){

      if( $(this).parents('li').hasClass('active') ){
        //close it
        $(this).siblings('.menu_section').slideUp( speed, function(){
          api.reinitialise(); //reinitialize jscrollpane for resized sidebar
          $('select').trigger('render'); //re-render custom select fields
        }).toggleClass('visible');
        $(this).parents('li').removeClass('active');
      } else {
        $(this).siblings('.menu_section').slideDown( speed, function(){
          api.reinitialise(); //reinitialize jscrollpane for resized sidebar
          $('select').trigger('render'); //re-render custom select fields
        }).toggleClass('visible');
        $(this).parents('li').addClass('active');
      }

      updateCookie( $(this).parents('li') );

      return false;

    });

    // Update the Cookie
    function updateCookie(el){

      var id = el.attr('id');
      var tmp = expanded.getUnique();

      if ( el.find('.menu_section').hasClass('visible') ) {
        // add id of header to expanded list
        tmp.push(id);
      } else {
        // remove element id from the list
        tmp.splice( tmp.indexOf( id ) , 1);
      }

      expanded = tmp.getUnique();
      $.cookie("panelState", expanded.join('|'), { expires: cookieExpires } );
    }

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
Load Tracks from soundcloud
*************************************/
(function($) {
  $.fn.loadTracks = function() {

      var trackContainer = $(this);
      $.get( "http://api.soundcloud.com/users/" + sound_cloud_user_id + "/tracks.json?client_id=" + sound_cloud_client_id, function( data ) {
        //$( ".result" ).html( data );
        console.log(data);

      });
  };
})(jQuery);

/*************************************
Save toggle on form change
*************************************/
(function($) {
  $.fn.saveStateToggle = function() {

    var form = $(this);
    var saveButton = $('#formSubmit');

    form.on('keyup change', function(){
      if( saveButton.attr('disabled', true)){
        console.log('changed!');
        saveButton.attr('disabled', false);
      }
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

  // toggle save button state
  $('#band_admin_form').saveStateToggle();

  //toggle menu areas
  $('ul#menu_sections').sidebarAccordion(200, api);

  //toggle music list tabs
  $(".music_selector").musicTabs();
  $(".music_selector").loadTracks();

  //load up custom select fields
  $('select').customSelect();

  //color pickers!
  $('input.colorPicker').minicolors({
    position: 'bottom right'
  });

  //UI Slider
  var initialSliderVal = $('input[name="band[field_option_values][background_overlay_opacity]"]').val();
  $('#background_opacity_slider .sliderbar').slider({
    range: "min",
    value: initialSliderVal,
    min: 0,
    max: 100,
    step: 1,
    slide: function( event, ui ) {
      $( "#background_opacity_slider .slider_value" ).text( ui.value ); //sets value on slide
      $('input[name="band[field_option_values][background_overlay_opacity]"]').val( ui.value ); //sets value inside hidden input
    }
  });
  //set initial value on load
  $( "#background_opacity_slider .slider_value" ).text( $( "#background_opacity_slider .sliderbar" ).slider( "value" ) );

  //background image selection
  $('.background_picker').backgroundImageSelect();

});

// Return a unique array - used with panelState
Array.prototype.getUnique = function(sort){
  var u = {}, a = [], i, l = this.length;
  for(i = 0; i < l; ++i){
    if(this[i] in u) { continue; }
    a.push(this[i]);
    u[this[i]] = 1;
  }
  return (sort) ? a.sort() : a;
}