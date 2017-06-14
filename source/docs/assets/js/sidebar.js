function Sidebar() {
  this.categories = $(".category-div")

  this.current_category_class = "link-reset db black-80 pv1 pl4"
  this.current_article_class  = "link-reset db normal green b pv1"

  $(".category-key").on("click", this.click_handler.bind(this));
}

Sidebar.prototype.activate = function() {
  this.highlight_sidebar_link_for_current_page();

  $(".contents").show();
}

Sidebar.prototype.highlight_sidebar_link_for_current_page = function() {
  const sidebar_link = this.categories.find("a[href='" + location.pathname + "']");

  if(sidebar_link.lenght === 0) {
    $(".docs-nav-home a").attr('class', this.current_category_class)
  } else {
    // highlight element
    sidebar_link.attr("class", this.current_article_class);

    // expand the category
    const parent = sidebar_link.parent();

    parent.prev().attr('class', this.current_category_class);
    parent.addClass('current-category').show();
  }
}

Sidebar.prototype.click_handler = function(event) {
  event.preventDefault();

  const key = $(event.currentTarget).text();
  console.log(key);

  $(".category-div").not(".current-category").each(function() {
    if ($(this).prev().text() !== key) {
      $(this).hide();
    } else {
      $(this).toggle();
    }
  });
}

$(document).ready(function() {
  sidebar = new Sidebar();

  sidebar.activate();
});
