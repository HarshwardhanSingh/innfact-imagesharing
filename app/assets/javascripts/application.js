//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.remotipart
//= require_tree .

jQuery.ajaxSetup({
   'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
 });

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip(); 

  $('.post-comments-dash').css('display','none');
});



// $(document).ready(function(){
// 	$('form#new_post').submit(function() {  
//     var valuesToSubmit = $(this).serialize();
//     $.ajax({
//         type: "POST",
//         url: $(this).attr('action'), //sumbits it to the given url of the form
//         data: valuesToSubmit // you want a difference between normal and ajax-calls, and json is standard
//     }).success(function(){
//         alert(valuesToSubmit);
//     });
// 	    return false; // prevents normal behaviour
// 	});
// });


