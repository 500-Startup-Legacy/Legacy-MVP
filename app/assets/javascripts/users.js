
console.log('linked');

window.onload = function() {


	$('.circle').each(function() {

		var $each =  $(this);
		var id = $(this).attr('id');


		if ($(".dead:contains(" + id + ")").length) {
			$(this).css('backgroundColor', 'none');
			$(this).css('border-width', '2px');
			$(this).css('border-color', 'white');
			$(this).css('border-style', 'solid');
		};
	});

	
	$('.circle').hover(function(event) {

		// $('html').find('*').removeClass('text-number');
		$('.image-area').css('background-image', 'none');
		$('html').find('*').removeClass('position-video');
		$('html').find('*').removeClass('view-public-button');
		$('html').find('*').removeClass('create-video-button');


		var $userId = event.target.id;

		var $content = $('ul').find('.' + $userId).map(function(i, el){
			return $(el).text();
		}).get();

		$name = $('.full-name .' + $userId).html();

		$('#view-public-' + $userId).addClass('view-public-button');
		$('#video-link-' + $userId).addClass('create-video-button');
		// $('#phone-number-' + $userId).addClass('text-number');

		appendContentToVideoArea($name, $content, $userId);
	});

	function appendContentToVideoArea(name, content, id) {

		$('.content-div').remove();

		var $div = $('<div class="content-div"></div>');
		var $textArea = $('<div class="text-area"></div>');
		var $buttonsDiv = $('<div class="buttons-div"></div>');
		var $name = $('<h1 class="name">' + name + '</h1>');
		var $memory = $('<p id="paragraph">' + content + '</p>');

		var $videoIcon = $('<i id="video" class="fa fa-play-circle-o fa-2x"></i>');
		var $fileIcon = $('<i id="image" class="fa fa-paperclip fa-2x"></i>');
		var $soundIcon = $('<i class="fa fa-volume-up fa-2x"></i>');
		var $circleNav = $('<div id="circle-nav"></div>');

		$memory = $memory.text().replace(/,/g, "<br>");
		$memory = $('<p id="paragraph">' + $memory + '</p>');

		$buttonsDiv.append($circleNav);
		$buttonsDiv.append($videoIcon);
		$buttonsDiv.append($fileIcon);
		$buttonsDiv.append($soundIcon);

		$textArea.append($name);
		$textArea.append($memory);

		$div.append($buttonsDiv);
		$div.append($textArea);

		$('.container').append($div);

		var $videoButton = $('#video');
		var $picButton = $('#image');

		$videoButton.hover(function() {

			var $id = id;
			$videoData = $('#video-' + $id);
			$videoData.addClass('position-video');
			
		});

		$picButton.hover(function() {

			$('html').find('*').removeClass('position-video');
			var $id = id;
			$imageData = $('#image-' + $id).html();
			console.log($imageData);
			$('.image-area').css('background-image', 'url(' + $imageData + ')');
			
		});

		$('.circle').hover(function() {

			var color = '';

		    var x = $(this).css('backgroundColor');
		    hexc(x);

		    console.log(color);
		
			 $('.buttons-div').css('color', color);
			 $('#circle-nav').css('backgroundColor', color);

		function hexc(colorval) {
		    var parts = colorval.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
		    delete(parts[0]);
		    for (var i = 1; i <= 3; ++i) {
		        parts[i] = parseInt(parts[i]).toString(16);
		        if (parts[i].length == 1) parts[i] = '0' + parts[i];
		    };
		    color = '#' + parts.join('');
		};

		});

	};





};


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
