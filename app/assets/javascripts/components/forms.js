var App = window.App;

(function(window, $){

  function setupDuplicateForms() {
    var checkBoxChecked = Bacon.$.checkBoxValue($(".js-duplicate-form"));
    var duplicateForm = ".row#" + $(".js-duplicate-form").data("form-duplicate");

    checkBoxChecked.assign($(duplicateForm + " input"), "attr", "disabled");
    checkBoxChecked.assign($(duplicateForm + " select"), "attr", "disabled");

  }

  $(function() {
    setupDuplicateForms();
  });

})(window, window.jQuery);
