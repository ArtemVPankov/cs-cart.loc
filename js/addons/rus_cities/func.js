(function (_, $) {
  $.ceEvent('on', 'ce.commoninit', function (context) {
    $("[name='user_data[b_city]']").autocomplete({
      source: function source(request, response) {
        var type = this.element.attr('name').substr(10, 1);
        getRusCities(type, request, response);
      }
    });
    $("[name='user_data[s_city]']").autocomplete({
      source: function source(request, response) {
        var type = this.element.attr('name').substr(10, 1);
        getRusCities(type, request, response);
      },
      open: function open() {
        $(this).autocomplete('widget').zIndex($.ceDialog('get_last').closest('.ui-dialog').css('z-index') + 1);
      }
    });

    function getRusCities(type, request, response) {
      var check_country = $("[name='user_data[" + type + "_country]']").length ? $("[name='user_data[" + type + "_country]']").val() : '';
      var check_state = $("[name='user_data[" + type + "_state]']").length ? $("[name='user_data[" + type + "_state]']").val() : '';
      $.ceAjax('request', fn_url('city.autocomplete_city?q=' + encodeURIComponent(request.term) + '&check_state=' + check_state + '&check_country=' + check_country), {
        callback: function callback(data) {
          response(data.autocomplete);
        }
      });
    }
  });
})(Tygh, Tygh.$);