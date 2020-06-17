$('.simple_form').bootstrapValidator({
  feedbackIcons: {
      valid: 'glyphicon glyphicon-ok',
      invalid: 'glyphicon glyphicon-remove',
      validating: 'glyphicon glyphicon-refresh'
  },
  fields: {
    'user[login]': {
      validators: {
        stringLength: {
          min: 6,
          max: 30
        },
        notEmpty: true
      }
    },
    'user[password]': {
      validators: {
        notEmpty: true,
        stringLength: {
          min: 6,
          max: 30
        }

      }
    }
  }
});
