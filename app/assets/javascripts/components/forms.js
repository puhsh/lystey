var App = window.App || {};

(function(window, $) {

  function setupDuplicateForms() {
    var checkBoxChecked = Bacon.$.checkBoxValue($(".js-duplicate-form"));
    var duplicateForm = ".row#" + $(".js-duplicate-form").data("form-duplicate");

    checkBoxChecked.assign($(duplicateForm), "css", "display: none");
    checkBoxChecked.assign($(duplicateForm + " select"), "attr", "disabled");
  }

  function setupColorPicker() {
    $(".js-color-picker").spectrum({
      replacerClassName: 'color-preview',
      showButtons: false,
      preferredFormat: 'hex',
    }).show();

    $(".js-color-picker").on("focusout", _.debounce(function(e) {
      $(e.target).spectrum("set", $(e.target).val());
      updateAdminThemePreviewColors($(e.target));
    }, 100));

    $(".js-color-picker").on("change.spectrum", function(e) {
      updateAdminThemePreviewColors($(e.target));
    });
  }

  function updateAdminThemePreviewColors($target) {
    var key, attr;
    var cssProp = {};
    var targetProp = $target.data("target");
    switch (targetProp) {
      case "admin-background":
        key = "background-color";
        attr = "#admin-theme-preview.js-preview-update";
        attr
        break;
      case "admin-font-color":
        key = "color";
        attr = "#admin-theme-preview.js-preview-update h1";
        break;
      case "admin-button-color":
        key = "background-color";
        attr = "#admin-theme-preview.js-preview-update button";
        break;
      case "admin-button-text-color":
        key = "color";
        attr = "#admin-theme-preview.js-preview-update button";
        break;
      default:
        return;
    }

    cssProp[key] = $target.val();

    $(attr).css(cssProp);
  }

  $(function() {
    setupDuplicateForms();
    setupColorPicker();
  });

})(window, window.jQuery);
