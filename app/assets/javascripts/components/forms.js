var Lystey = window.Lystey || {};
Lystey.UI = window.Lystey.UI || {};


Lystey.UI.Forms = {
  x: 1
};


(function(window, $) {

  function setupDuplicateForms() {
    var checkBoxChecked = Bacon.$.checkBoxValue($(".js-duplicate-form"));
    var duplicateForm = ".row#" + $(".js-duplicate-form").data("form-duplicate");

    checkBoxChecked.not().assign($(duplicateForm), "toggle");
  }

  function setupHiddenForms() {
    var checkBoxChecked = Bacon.$.checkBoxValue($(".js-hidden-form-toggle"));
    var formToHide = "div" + $(".js-hidden-form-toggle").data("form-id");

    _.each($(formToHide), function(el) {
      checkBoxChecked.assign($(el), "toggle");
    });
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

  function updateAdminThemePreviewFont(target) {
    var cssProp = {};
    var val;
    var attr = "#admin-theme-preview";
    var targetValue = $(target).val();

    switch (targetValue) {
      case 'impact':
        val = "Impact, Haettenschweiler, 'Franklin Gothic Bold', Charcoal, 'Helvetica Inserat', 'Bitstream Vera Sans Bold', 'Arial Black', 'sans serif'";
        break;
      case 'tahoma':
        val = "Tahoma, Verdana, Segoe, sans-serif";
        break;
      case 'verdana':
        val = "Verdana, Geneva, sans-serif";
        break;
      case 'georgia':
        val = "Georgia, Times, 'Times New Roman', serif";
        break;
      case 'palatino':
        val = "Palatino, 'Palatino Linotype', 'Palatino LT STD', 'Book Antiqua', Georgia, serif";
        break;
      case 'times':
        val = "Times";
        break;
      case 'courier':
        val = "Courier";
        break;
      case 'lucida':
        val = "'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', Geneva, Verdana, sans-serif";
        break;
      case 'helvetica':
        val = "'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif";
        break;
      default:
        return;
    }

    cssProp["font-family"] = val;
    $(attr).css(cssProp);
  }

  function setupSelectFontChanger() {
    $(".js-font-changer").on('change', function(e) {
      updateAdminThemePreviewFont($(e.target));
    });
  }

  $(function() {
    setupDuplicateForms();
    setupHiddenForms();
    setupColorPicker();
    setupSelectFontChanger();
  });

})(window, window.jQuery);
