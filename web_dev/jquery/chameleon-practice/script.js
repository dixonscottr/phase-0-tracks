console.log("The script is running!");

function addPinkBorder(event) {
  console.log("click happened! here's the click event:");
  console.log(event);
  event.target.style.border = "2px solid pink";
}

var photo = document.getElementById("lizard-photo");
photo.addEventListener("click", addPinkBorder);

$(document).ready(function(){

    $("#fade-out").click(function(){
      $("#lizard-photo").fadeOut(3000);
    });

    $("#fade-in").click(function(){
      $("#lizard-photo").fadeIn(3000);
    });

    $("#lizard-photo").mouseenter(function(){
      $("#lizard-photo").css("border", "10px solid pink");
    });

    $("#lizard-photo").mouseleave(function(){
      $("#lizard-photo").css("border", "10px solid black");
    });

});