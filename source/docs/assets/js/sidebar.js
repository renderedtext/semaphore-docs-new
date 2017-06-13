const current_category_class = "link-reset db black-80 pv1 pl4"
const current_article_class  = "link-reset db normal green b pv1"

$(document).ready(function() {
  const title = $(".article-title").text();

  if (title === "") {
    $(".docs-nav-home a").attr('class', current_category_class)
  } else {
    $(".article-key").each(function() {
      if ($(this).text() === title) {
        $(this).next().attr('class', current_article_class);

        const parent = $(this).parent();

        parent.prev().attr('class', current_category_class);
        parent.addClass('current-category').slideToggle();
      };
    });
  }

  $(".category-key").click(function(event) {
    event.preventDefault();

    const key = $(this).text();

    $(".category-div").not(".current-category").each(function() {
      if ($(this).prev().text() !== key) {
        $(this).hide();
      } else {
        $(this).slideToggle();
      }
    });
  });
});
