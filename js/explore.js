// Pseudocode
//
// Create an empty word called 'reversed word'
// For each character from the existing word:
//   Starting from the last character, take it and add it to the empty word
//   Move one character towards the beginning of the word and repeat
// Return the formerly empty word called 'reversed word'

function reverseString(str) {
  var reversedWord = "";

  for (i = (str.length - 1); i >= 0; i--) {
    reversedWord = reversedWord + str[i].toLowerCase();
  }
  // capitalizes the first letter of the word
  return reversedWord.charAt(0).toUpperCase() + reversedWord.slice(1);
}

var checkWord = reverseString("Goblin");
console.log(checkWord == "Nilbog");

if (checkWord == "Nilbog") {
  console.log(checkWord + " is goblin spelled backwards.");
} else {
  console.log(checkWord + " means nothing to me.");
}