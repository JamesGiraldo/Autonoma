// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//


//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require jquery/jquery-3.1.1.min.js
//= require popper
//= require toastr/toastr.min.js
//= require bootstrap
//= require bootstrapvalidator/bootstrapValidator.js
//= require bootstrapvalidator/language/es_ES.js
//= require pace/pace.min.js
//= require peity/jquery.peity.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require metisMenu/jquery.metisMenu.js
//= require inspinia.js
//= require chartkick
//= require Chart.bundle
//= require apexcharts
//= require trix
//= require_tree .
$('#datepicker').datepicker();

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
  $('#ir-arriba').click(function(e){
    e.preventDefault();
    $('body, html').animate({
        scrollTop: '0px'
      }, 300);
    });
    $(window).scroll(function(){
      if( $(this).scrollTop() > 0 ){
          $('#ir-arriba').slideDown(300);
      } else {
        $('#ir-arriba').slideUp(300);
      }
    });

   $('.signupForm').validate({
      rules: {
         nombre: {
            required: true,
         },
         comments: {
            required: true
         },
         password: {
            required: true,
            minlength: 6
         },
         confirm_password: {
            required: true,
            minlength: 6,
            equalTo: "#password"
         },
         email: {
            required: true,
            email: true
         },
         agree: "required"
      },
      messages: {
         nombre: {
            required: "Por favor ingresa tu nombre completo"
         },
         comments: "Por favor ingresa un comentario",
         password: {
            required: "Por favor ingresa una contraseña",
            minlength: "Tu contraseña debe ser de no menos de 5 caracteres de longitud"
         },
         confirm_password: {
            required: "Ingresa un password",
            minlength: "Tu contraseña debe ser de no menos de 5 caracteres de longitud",
            equalTo: "Por favor ingresa la misma contraseña de arriba"
         },
         email: "Por favor ingresa un correo válido",
         agree: "Por favor acepta nuestra política",
         luckynumber: {
            required: "Por favor"
         }
      },
      highlight: function ( element, errorClass, validClass ) {
         $( element ).parents( ".col-sm-10" ).addClass( "has-error" ).removeClass( "has-success" );
      },
      unhighlight: function (element, errorClass, validClass) {
         $( element ).parents( ".col-sm-10" ).addClass( "has-success" ).removeClass( "has-error" );
      }
   });
});
