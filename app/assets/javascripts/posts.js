$(document).ready(function(){
  $('a.like').hover(function(){
    $(this).removeClass('btn-default').addClass('btn-danger');
  },function(){
    $(this).removeClass('btn-danger').addClass('btn-default');
  });

  $('a.attach-image-trigger').click(function(){
    $('#post_image').trigger('click');
  });

  function readURL(input) {

	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	        	$('img#blah').css('display','block');
	            $('img#blah').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#post_image").change(function(){
	    readURL(this);
	});

});


function likePost(data,event)
{
  jQuery.ajax({
  url: "http://localhost:3000/posts/"+data+"/like",
  type: "GET",
  dataType: "script"
  });  
  event.preventDefault();
  
  return false;
}

function unlikePost(data,event)
{
  jQuery.ajax({
  url: "http://localhost:3000/posts/"+data+"/unlike",
  type: "GET",
  dataType: "script"
  });
  event.preventDefault();
  return false;

}
