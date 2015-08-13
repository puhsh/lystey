var Lystey = window.Lystey || {};
Lystey.UI = window.Lystey.UI || {};

Lystey.UI.MenuNavigation = (function() {
  function MenuNavigation() {
  };

  return MenuNavigation
})();


Lystey.UI.SelectNavigation = (function() {
  function SelectNavigation(selectElement, navigationButton) {
    this.selectElement = selectElement;
    this.navigationButton = navigationButton;
  }

  return SelectNavigation
})();

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
