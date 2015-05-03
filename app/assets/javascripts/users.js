
console.log('linked');

window.onload = function() {

    var currentUserID = window.location.href.split('/').slice(-1)[0];
    var counter = 1;
    var $circleSectionDiv = $(".pic-circles-section");
    var subjectsUrlBase = '/api/users/'+currentUserID+'/subjects/';

    $.get(subjectsUrlBase + 'family', function(data){ 
        data.forEach(function (subject){
            $newCircleDiv = $("<div id="+subject.id+" class='circle circle-"+counter+"'></div");
            counter += 1;
            $circleSectionDiv.append($newCircleDiv);
        });
        if(counter<5){ counter = 5;}
    })
    .done(function(){

        $.get(subjectsUrlBase + 'friends', function(data){ 
            data.forEach(function (subject){
                $newCircleDiv = $("<div id="+subject.id+" class='circle circle-"+counter+"'></div");
                counter += 1;
                $circleSectionDiv.append($newCircleDiv);
            });
            if(counter<10){ counter = 10;}
        })
        .done(function (){
        
            $.get(subjectsUrlBase + 'coworkers', function(data){ 
                data.forEach(function (subject){
                    $newCircleDiv = $("<div id="+subject.id+" class='circle circle-"+counter+"'></div");
                    counter += 1;
                    $circleSectionDiv.append($newCircleDiv);
                });
            })
            .done(function (){

//all this stuff happens after the circle divs are created using json API





	$('.circle').hover(function(event) {

		$('.image-area').css('background-image', 'none');
		$('html').find('*').removeClass('position-video');
		$('html').find('*').removeClass('view-public-button');
		$('html').find('*').removeClass('create-video-button');


		var $subjectID = event.target.id;//subject id
		var $content = $('ul').find('.' + $subjectID).map(function(i, el){
			return $(el).text();
		}).get();

		$name = $('.full-name .' + $subjectID).html();

		$('#view-public-' + $subjectID).addClass('view-public-button');
		$('#video-link-' + $subjectID).addClass('create-video-button');

		appendContentToVideoArea($name, $content, $subjectID);
	});//end circle hover event function


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

	}//end appendContentToVideoArea function



            });//end done with coworkers
        });//end done with friends
    });//end done with family




};//end script
