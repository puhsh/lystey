var App = window.App || {};

(function(window, $) {

  function setupSelectNavigation() {
    $(".js-navigation-button").on('click', function() {
      window.location = $(".js-select-navigation").val();
    });
  }

  $(function() {
    setupSelectNavigation();
  });

})(window, window.jQuery);
