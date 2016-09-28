$(document).ready(function(){

  var bigText = function(elem) {
    elem.css('color', 'black');
    elem.animate({fontSize: "25px"}, 1000)
    elem.css('opacity', "1");
  }

  var crossFade = function(elem1, elem2) {
    (elem).fadeOut("slow", function(){
      (elem2).fadeIn("slow");
    });
  }

  var fadeSlightly = function(elem) {
    elem.css("opacity", "0.5");
  }

  $("#start-button").click(function(){
    $("#poem").toggle(100);
  });

  $("#line-one").mouseenter(function(){
    bigText($(this));
  });

 $("#line-one").mouseleave(function(){
    fadeSlightly($(this));
  });

  $("#line-two").mouseenter(function(){
    bigText($(this));
  });

  $("#line-two").mouseleave(function(){
    fadeSlightly($(this));
  });

  $("#line-three").mouseenter(function(){
    bigText($(this));
  });

  $("#line-three").mouseleave(function(){
    fadeSlightly($(this));
  });

  $("#line-four").mouseenter(function(){
    bigText($(this));
  });

  $("#line-four").mouseleave(function(){
    fadeSlightly($(this));
  });

  $("h1").dblclick(function(){
    $(this).fadeOut("slow", function(){
      $("h2").fadeIn("slow");
    });
  });
 
 $("h2").dblclick(function(){
    $(this).fadeOut("slow", function(){
      $("h1").fadeIn("slow");
    });
  });


});