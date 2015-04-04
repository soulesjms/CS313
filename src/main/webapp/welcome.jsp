<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="unified.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
var colCount = 0;
var colWidth = 0;
var margin = 20;
var windowWidth = 0;
var blocks = [];

$(function(){
	$(window).resize(setupBlocks);
});

function setupBlocks() {
	windowWidth = $(window).width();
	colWidth = $('.block').outerWidth();
	blocks = [];
	console.log(blocks);
	colCount = Math.floor(windowWidth/(colWidth+margin*2));
	for(var i=0;i<colCount;i++){
		blocks.push(margin);
	}
	positionBlocks();
}

function positionBlocks() {
	$('.block').each(function(){
		var min = Array.min(blocks);
		var index = $.inArray(min, blocks);
		var leftPos = margin+(index*(colWidth+margin));
		$(this).css({
			'left':leftPos+'px',
			'top':min+ 350 + 'px'
		});
		blocks[index] = min+$(this).outerHeight()+margin;
	});	
}

// Function to get the Min value in Array
Array.min = function(array) {
    return Math.min.apply(Math, array);
};
</script>
</head>
<body onload="setupBlocks();">
    <div id="top">
        <div id="welcome"><h1>Welcome to BarterSpace!<h1></div>
        <div id="login" style="float:right">
            <a href="createPost.html">Create a new post</a>
        </div>
    </div>
    <p id="recentSearches">
        <strong>Recent Searches:</strong>
        <div class="recent">
          <p>Motorcycle</p>
          <p><img src="Pictures/images.jpg" width="222" height="138" /></p>
        </div>
        <div class="recent">
          <p>Shoes</p>
          <p><img src="Pictures/index.jpg" width="213" height="141" /></p>
        </div>
        <div class="recent">
          <p>Phones</p>
          <p><img src="Pictures/dF6DITZNDVYNEGRh.jpg" width="192" height="144" /></p>
        </div>
        <div class="recent">
            Game Systems
            <img src="Pictures/ps4.jpg" width="282" height="179" />
        </div>
    </p>
    <div>
        <!-- this is where we want to place the posts to our user. 
        The above posts are the posts the host wants to show the user.-->
        <div class="block">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dui velit. Curabitur purus odio, adipiscing ut vehicula at, pulvinar eu justo. Suspendisse potenti. Suspendisse dictum massa non mi posuere ac convallis nisi pellentesque. Morbi posuere mauris elementum metus intlla faProin et malesuada arcu. Quisque sed nulla odio, at interdum diam. Proin mollis, dui eget tristique dictum, diam purus hendrerit urna, lacinia interdum sem justo sit amet justo. Morbi a neque ut velit tempus auctor. Sed condimentum dolor in est facilisis id malesuad</p>
        </div>

	<div class="block">
	    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dui velit. Curabitur purus odio, adipiscing ut vehicula at, pulvinar eu justo. Suspendisse potenti. Suspendisse dictum massa non mi posuere ac convallis nisi pellentesque. Morbi posuere mauris elementum metus interdum vestibulum. Vestibulum semper, lectus interdum aliquet pulvinar, quam libero commodo mi, a eleifend lectus nibh et tortor.</p>
	</div>

	<div class="block">
	    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dui velit. Curabitur purus odio, adipiscing ut vehicula at, pulvinar eu elementum metus interdum vestibulum. Vestibulum semper, lectus interdum aliquet pulvinar, quam libero commodo mi, a eleifend lectus nibh et tortor.</p>
	</div>

	<div class="block">
	    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dui velit. Curabitur purus odio, adipiscing ut vehicula at, pulvinar eu justo. ecenas fringilla faucibus adipiscing. In feugiat, ipsum non posuere aliquam, purus nisi feugiat metus, mattis dapibus ipsum justo at risus. Morbi leo mauris, tristique facilisis consequat quis, volutpat quis tellus. Quisque semper, urna nec egestas venenatis, urna sem pellentesque ante, quis vestibulum augue massa vel arcu. Suspendisse porttitor posuere viverra. Cras vel ligula nunc, vitae congue lorem. Etiam aliquet nisl et diam iaculis id vulputate urna lobornibh et tortor.</p>
	</div>

	<div class="block">
	    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dui velit. Curabitur purus odio, adipiscing ut vehicula at, pulvinar eu justo. Suspendisse potenti. Suspendisse dictum massa non mi posuere ac convallis nisi pellentesque. Morbi posuere mauris elementum metus interdum vestibulum. Vestibulum semper, lectus interdum aliquet pulvinar, quam libero commodo mi, a eleifend lectus nibh et tortor.</p>
	</div>

	<div class="block">
	    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dui velit. Curabitur purus odio, adipiscing ut vehicula at, pulvinar eu justo. Suspendisse potenti. Suspendisse dictum massa non mi posuere ac convallis nisi pellentesque. Morbi posuere mauris elementum metus intlla faProin et malesuada arcu. Quisque sed nulla odio, at interdum diam. Proin mollis, dui eget tristique dictum, diam purus hendrerit urna, lacinia interdum sem justo sit amet justo. Morbi a neque ut velit tempus auctor. Sed condimentum dolor in est facilisis id malesuad</p>
	</div>

	<div class="block">
	    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dui velit. Curabitur purus odio, adipiscing ut vehicula at, pulvinar eu justo. Suspendisse potenti. Suspendisse dictum massa non mi posuere ac convallis nisi pellentesque. Morbi posuere mauris elementum metus interdum vestibulum. Vestibulum semper, lectus interdum aliquet pulvinar, quam libero commodo mi, a eleifend lectus nibh et tortor.</p>
	</div>

	<div class="block">
	    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dui velit. Curabitur purus odio, adipiscing ut vehicula at, pulvinar eu elementum metus interdum vestibulum. Vestibulum semper, lectus interdum aliquet pulvinar, quam libero commodo mi, a eleifend lectus nibh et tortor.</p>
	</div>

	<div class="block">
	    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dui velit. Curabitur purus odio, adipiscing ut vehicula at, pulvinar eu justo. ecenas fringilla faucibus adipiscing. In feugiat, ipsum non posuere aliquam, purus nisi feugiat metus, mattis dapibus ipsum justo at risus. Morbi leo mauris, tristique facilisis consequat quis, volutpat quis tellus. Quisque semper, urna nec egestas venenatis, urna sem pellentesque ante, quis vestibulum augue massa vel arcu. Suspendisse porttitor posuere viverra. Cras vel ligula nunc, vitae congue lorem. Etiam aliquet nisl et diam iaculis id vulputate urna lobornibh et tortor.</p>
	</div>

	<div class="block">
	    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dui velit. Curabitur purus odio, adipiscing ut vehicula at, pulvinar eu justo. Suspendisse potenti. Suspendisse dictum massa non mi posuere ac convallis nisi pellentesque. Morbi posuere mauris elementum metus interdum vestibulum. Vestibulum semper, lectus interdum aliquet pulvinar, quam libero commodo mi, a eleifend lectus nibh et tortor.</p>
	</div>


	<div class="block">
	    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut in dui velit. Curabitur purus odio, adipiscing ut vehicula at, pulvinar eu justVestibulum id malesuada magna. Etiam vel nunc sapien, id consectetur lacus. Donec feugiat lacus non lorem varius accumsan hendrerit ligula luctus. Matis. In lobortis, urna et posuere sagittis, lectus lacus condimentum nulla, id euismod ipsum elit at nulla.ris elementum metus interdum vestibulum. Vestibulum semper, lectus interdum aliquet pulvinar, quam libero commodo mi, a eleifend lectus nibh et tortor.</p>
	</div>

	<div class="block">
	    <p>Lorem ipsum dolor sit amet, cto. Suspendisse potenti. Suspendisse dictum massa non mi posuere ac convallis nisi pellentesque. Morbi posuere mauris elementum metus is nibh et tortor.</p>
	</div>

	<div class="block">
	    <p>er lectus, at pellentesque tortor luctus eget. Phasellus cursus tellus sed velit mattis feugiat. Phasellus non metus felis, dictum auctor justo. Sed pharetra malesuada accumsan. Nunc eget nisi libero, quis egestas eros. Duis sit amet fermentum dui. Nulla ullamcorper massa sit amet magna pulvinar volutpat. Mauris dictum congue mi eu molestie.</p>
	</div>
    </div>
</body>
</html>
