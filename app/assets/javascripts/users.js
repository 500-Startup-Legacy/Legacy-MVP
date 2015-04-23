
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
		
		var $userId = event.target.id;

		var $content = $('ul').find('.' + $userId).map(function(i, el){
			return $(el).text();
		}).get();

		$name = $('.full-name .' + $userId).html();

		appendContentToVideoArea($name, $content);
		// var $content = $('ul').find('.' + $userId).html();
	});

	function appendContentToVideoArea(name, content) {

		$('.content-video').empty();

		var $div = $('<div class="content-div"></div>');
		var $name = $('<h1>' + name + '</h1>');
		var $memory = $('<p>' + content + '</p>');

		$memory = $memory.text().replace(/,/g, "<br>");

		$div.append($name);
		$div.append($memory);

		$('.content-video').append($div);

	};







};