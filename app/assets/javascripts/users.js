window.onload = function() {

var currentUserID = window.location.href.split('/').slice(-1)[0];
var $circleSectionDiv = $(".pic-circles-section");
var subjectsUrlBase = '/api/users/'+currentUserID+'/subjects/';
var friends = [], family = [], coworkers = [], allSubjects = [];

$.get(subjectsUrlBase, function(data){ 
    var familyCounter = 1, friendCounter = 6, coworkerCounter = 11;

    data.forEach(function (subject){
        if(subject.group_tag==='friend'){ friends.push(subject);}
        if(subject.group_tag==='family'){ family.push(subject);}
        if(subject.group_tag==='coworker'){ coworkers.push(subject);}
    });

    family.forEach(function (subject) {
        $circleSectionDiv.append("<div id="+subject.id+" class='circle circle-"+familyCounter+"'></div");
        familyCounter += 1;
        });

    friends.forEach(function (subject){
        $circleSectionDiv.append("<div id="+subject.id+" class='circle circle-"+friendCounter+"'></div");
        friendCounter += 1;
    });

    coworkers.forEach(function (subject){
        $circleSectionDiv.append("<div id="+subject.id+" class='circle circle-"+coworkerCounter+"'></div");
        coworkerCounter += 1;
    });

    allSubjects = [].concat(friends, family, coworkers);

}).done(function (){

        $('.circle').hover(function(event) {

            wipeVideoDiv();

            var subjectID = event.target.id;
            var fullName = allSubjects.filter(function (subject){ return subject.id == subjectID; })[0].name;
            var memoriesAPI_URL = subjectsUrlBase+subjectID+'/memories';

            $.get(memoriesAPI_URL, function(memories){ 
                $('#view-public-' + subjectID).addClass('view-public-button');
                $('#video-link-' + subjectID).addClass('create-video-button');

                var textMemoryArray  = notZiggeo(memories).map( function (memory){ return memory.content; });
                var imageMemoryArray  = memories.map( function (memory){ return memory.image_url; }).filter(function(item){return item !== null;});
                var videoMemoryArray  = memories.filter(function(memory){return memory.content.indexOf('ziggeo') > -1;});

                appendContentToVideoArea(fullName, textMemoryArray, imageMemoryArray, videoMemoryArray, subjectID, currentUserID);
            });

        });//end circle hover event function

});//end done with subjects

};//end window.onload


function appendContentToVideoArea(name, textMemoryArray, imageMemoryArray, videoMemoryArray, subjectID, userID) {

    var $mediaStashUl = $('#media-stash');
    var $contentDiv  = $('<div class="content-div"></div>');
    var $textAreaDiv = $('<div class="text-area"></div>');
    var $buttonsDiv  = $('<div class="buttons-div"></div>');
    var $nameH1      = $('<h1 class="name">' + name + '</h1>');
    // var $vidLink   = $("<p><a href='/users/" + userID + "/subjects/"+subjectID+"/memories/new' class='create-video-button'>Create Video</a></p>");
    var $memoryParagraph = $('<p id="paragraph">' + textMemoryArray.join('<br>') + '</p>');

    var $circleNav = $('<div id="circle-nav"></div>');
    var $videoIcon = $('<i id="video" class="fa fa-play-circle-o fa-2x"></i>');
    var $fileIcon  = $('<i id="image" class="fa fa-paperclip fa-2x"></i>');
    var $soundIcon = $('<i class="fa fa-volume-up fa-2x"></i>');

    $('.content-div').remove();
    $buttonsDiv.append($circleNav, $videoIcon, $fileIcon, $soundIcon);
    $textAreaDiv.append($nameH1, $memoryParagraph);
    $contentDiv.append($buttonsDiv, $textAreaDiv);

    $('.container').append($contentDiv);

    if(videoMemoryArray.length > 0){
        $videoIcon.hover(function() {
            var videoData = videoMemoryArray[0].content.replace(/ziggeo/,'');
            $videoData = $("<div id=video-"+subjectID+" class='video-data position-video'><ziggeo ziggeo-video="+videoData+" ziggeo-width=320 ziggeo-height=240></ziggeo></div>");
            $mediaStashUl.append($videoData);
        });
    }//end if

    if(imageMemoryArray.length > 0){
        var imageCounter = 0;
        $fileIcon.click(function() {
            $('html').find('*').removeClass('position-video');
            $('.image-area').css('background-image', 'url(' + imageMemoryArray[imageCounter] + ')');
            imageCounter = (1 + imageCounter) % imageMemoryArray.length;  //endlessly loop through imageMemoryArray
        });
    }//end if

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
        }
        color = '#' + parts.join('');
    }

    });

}//end appendContentToVideoArea function





function notZiggeo(memories){
    return memories.filter( function (memory){ return memory.content.indexOf('ziggeo') === -1; });
}

function wipeVideoDiv(){
    $('.image-area').css('background-image', 'none');
    $('html').find('*').removeClass('position-video');
    $('html').find('*').removeClass('view-public-button');
    $('html').find('*').removeClass('create-video-button');

}
