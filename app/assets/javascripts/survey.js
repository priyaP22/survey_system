(function() {
  $(document).on('turbolinks:load', function() {
    var modal_options, new_user;
    new_user = $('#user-info').data('new-user');
    modal_options = new_user ? {
      backdrop: 'static'
    } : {
      show: false
    };
    $('#user-info').modal(modal_options);
    return $('#user-info').on('shown.bs.modal', function() {
      //return $('.user-form').enableClientSideValidations();
    })

  });

}).call(this);
