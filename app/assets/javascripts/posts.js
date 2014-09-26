function insertPost(data) {
	$('#new_post')[0].reset();
	$('.post-list').prepend(data)
}

function postError(data) {
	console.log(data)
}

$(document).ready(function () {

	$.ajaxSetup({
	headers: {
			'X-CSRF-Token':$('meta[name="csrf-token"]').attr('content')
		}
	})

  $(".new-post").on('click', function(e) {
      e.preventDefault();
      $(this).next().slideToggle('fast');
  })

  $("body").on('submit', '#new_post', function(e){
  	e.preventDefault();

  	var url = $(this).attr("action");

  	$.ajax({
  		url: url,
  		type: 'post',
  		data: $(this).serialize()
  	}).done(insertPost).fail(postError);
  })

});