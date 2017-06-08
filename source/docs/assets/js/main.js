function autoGrow (oField) {
  if (oField.scrollHeight > oField.clientHeight) {
    oField.style.height = oField.scrollHeight + "px";
  }
}

$(document).ready(function() {

  $('.search-form').submit(function() {
    $('.drawer').toggleClass('active');
    return false;
  });

  $('.close-drawer').click(function() {
    $('.drawer').toggleClass('active');
    return false;
  });

  // fix scrolling

  $( '.drawer-body' ).bind( 'mousewheel DOMMouseScroll', function ( e ) {
    var e0 = e.originalEvent,
      delta = e0.wheelDelta || -e0.detail;
    this.scrollTop += ( delta < 0 ? 1 : -1 ) * 30;
    e.preventDefault();
  });

  // Styling comment textarea to default height after comment is posted
  $('.comment-form input').click(function() {
    $('.comment-form textarea').removeAttr('style');
  });

});


// Search
$(".search-form").click(function(event){
	$(this).closest('.navigation').toggleClass('search-form-active');
	$(this).closest('.navigation-group').toggleClass('navigation-group-fluid');
});
