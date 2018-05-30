$(document).ready(function(){
	$("button[name=submit]").click(function(){
		location.href="../user/memChange.com";
		
		var form = document.createElement('form');

		var objs;

		objs = document.createElement('input');

		objs.setAttribute('type', 'hidden');

		objs.setAttribute('name', 'id');

		objs.setAttribute('value', $('label[name="id"]').text());
		
		form.appendChild(objs);

		form.setAttribute('method', 'post');

		form.setAttribute('action', "../user/memChange.com");

		document.body.appendChild(form);

		form.submit();
				});
	$("button[name=back]").click(function(){
			window.history.back();
	});
	
});