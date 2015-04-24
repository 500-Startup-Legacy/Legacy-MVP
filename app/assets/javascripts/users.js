
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

		$('.content-div').remove();

		var $div = $('<div class="content-div"></div>');
		var $textArea = $('<div class="text-area"></div>');
		var $buttonsDiv = $('<div class="buttons-div"></div>');
		var $name = $('<h1 class="name">' + name + '</h1>');
		var $memory = $('<p id="paragraph">' + content + '</p>');

		var $gpsIcon = $('<i class="fa fa-map-marker fa-2x"></i>');
		var $videoIcon = $('<i class="fa fa-play-circle-o fa-2x"></i>');
		var $fileIcon = $('<i class="fa fa-paperclip fa-2x"></i>');
		var $soundIcon = $('<i class="fa fa-volume-up fa-2x"></i>');

		$memory = $memory.text().replace(/,/g, "<br>");
		$memory = $('<p id="paragraph">' + $memory + '</p>');

		$buttonsDiv.append($gpsIcon);
		$buttonsDiv.append($videoIcon);
		$buttonsDiv.append($fileIcon);
		$buttonsDiv.append($soundIcon);

		$textArea.append($name);
		$textArea.append($memory);


		$div.append($buttonsDiv);
		$div.append($textArea);
		// $div.append($name);
		// $div.append($memory);

		$('.container').append($div);

	};







};