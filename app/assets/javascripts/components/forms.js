var App = window.App;

(function(window, $){

  function setupCopyForms() {
    var checkBoxChecked = Bacon.$.checkBoxValue($(".js-copy-form"));
    var toForm = ".row#" + $(".js-copy-form").data("to-form");
    var toFormInputs = $(toForm + " input");
    var toFormSelects = $(toForm + " select");

    checkBoxChecked.assign($(toFormInputs), "attr", "disabled");
    checkBoxChecked.assign($(toFormSelects), "attr", "disabled");
    
  }

  $(function() {
    setupCopyForms();
  });

})(window, window.jQuery);
