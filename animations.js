(function($) {

  /**
   * Copyright 2012, Digital Fusion
   * Licensed under the MIT license.
   * http://teamdf.com/jquery-plugins/license/
   *
   * @author Sam Sehnert
   * @desc A small plugin that checks whether elements are within
   *     the user visible viewport of a web browser.
   *     only accounts for vertical position, not horizontal.
   */

  $.fn.visible = function(partial) {

      var $t            = $(this),
          $w            = $(window),
          viewTop       = $w.scrollTop(),
          viewBottom    = viewTop + $w.height() - 140,
          _top          = $t.offset().top,
          _bottom       = _top + $t.height(),
          compareTop    = partial === true ? _bottom : _top,
          compareBottom = partial === true ? _top : _bottom;

    return ((compareBottom <= viewBottom));

  };

})(jQuery);

function setVisible(el) {
  var el = $(el);
  if (el.visible(true)) {
    el.addClass('visible');
  }
}

function setAnimation() {
  $('.animate').each(function(i, el) {
    setVisible(el);
  });
}

window.onload = setAnimation;

$(window).scroll(function(event) {
  //Animate the tiles moving in
  $(".animate").each(function(i, el) {
    var el = $(el);
    if (el.visible(true) && !el.hasClass('visible')) {
      el.addClass("slide-up");
    }
  });

});
