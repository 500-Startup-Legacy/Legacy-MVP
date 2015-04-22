
console.log('linked');

window.onload = function() {

	// var counter = 0;

	// $('.circle').each(function(each){
	// 	var left = $(this).offset().left;
	// 	var top = $(this).offset().top;

	// 	counter = counter + 50;

	// 	var newLeft = left + counter;
	// 	var newTop = top + counter;

	// 	$(this).css('top', newTop);
	// 	$(this).css('left', newLeft);

	// });

	$('.circle').click(function(event) {
		
		$userId = event.target.id;
		$content = $('ul').find('.' + $userId).html();
		$name = $('.full-name .' + $userId).html();

		appendContentToVideoArea($name, $content);
	});

	function appendContentToVideoArea(name, memory) {

		$('.content-video').empty();

		var $div = $('<div class="content-div"></div>');
		var $name = $('<h1>' + name + '</h1>');
		var $memory = $('<p>' + memory + '</p>');

		$div.append($name);
		$div.append($memory);

		$('.content-video').append($div);

	};







};