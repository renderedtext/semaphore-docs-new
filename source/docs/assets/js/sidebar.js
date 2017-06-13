$(document).ready(function() {
  var title = $(".article-title").text();

  $(".article-key").each(function() {
    if ($(this).text() === title) {
      $(this).next().attr('class', 'link-reset db normal green b pv1');
      $(this).parent().addClass('current-category').slideToggle();
    };
  });

  $(".category-key").click(function(event) {
    event.preventDefault();

    var key = $(this).text();

    $(".category-div").not(".current-category").each(function() {
      if ($(this).prev().text() !== key) {
        $(this).hide();
      } else {
        $(this).slideToggle();
      }
    });
  });
});
