function turnToBlue(event) {
  console.log("Turning the word to blue");
  console.log(event);
  event.target.style.color = "blue";
}

var text = document.getElementById("wonderful");
text.addEventListener("click", turnToBlue);

function surroundInRed(event) {
  console.log("Surrounding it in Red");
  console.log(event);
  event.target.style.border = "6px solid red";
}

var title = document.getElementById("hello");
title.addEventListener("click", surroundInRed);

function redText(event) {
  console.log("Changing text to red");
  event.target.style.color = "red"
}

var nextText = document.getElementById("red-text");
nextText.addEventListener("mouseover", redText);