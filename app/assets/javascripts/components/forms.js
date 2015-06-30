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
      preferredFormat: 'hex'
    });

    $(".js-color-picker").show();

    $(".js-color-picker").on("focusout", _.debounce(function(e) {
      $(e.target).spectrum("set", $(e.target).val());
    }, 100));
  }

  $(function() {
    setupDuplicateForms();
    setupColorPicker();
  });

})(window, window.jQuery);
