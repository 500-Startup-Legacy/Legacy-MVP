
console.log('linked');

window.onload = function() {

	$('.circle').click(function(event) {
		console.log(event.target.id);
	});

};