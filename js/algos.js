// 1. function that finds the longest word in an array

function findLongestWord(array) {
  
  var switched = true;

  //continue checking until no numbers have been switched
  while (switched === true) {
    //change switched to false in case no numbers need to be switched
    switched = false;
    for (i = 0; i < (array.length - 1); i++) {
      //check words with spaces removed
      if (array[i].replace(/ /g, "").length > array[i + 1].replace(/ /g, "").length) {
        var temp = array[i];
        array[i] = array[i + 1];
        array[i + 1] = temp;
        // console.log(array);
        // change switched back to true if numbers have been switched
        switched = true;
      }
    }
  }

  return array[array.length - 1];

}

// 2. function that finds out if 2 objects have a matching key-pair value

function hasMatchingPair(object_a, object_b) {

  var hasMatch = false;
  // loops through all of the keys in object_a, checks if object_b has it
  for (var key in object_a) {
    if (object_b.hasOwnProperty(key)) {
        // if the objects have the same key, check if they have the same value there
        if (object_a[key] == object_b[key]) {
          // change the hasMatch value to true only is they have the same k/v pair
          hasMatch = true;
        }
    }
}

  return hasMatch;

}

// function to generate a certain number of random words

function randomWords(number) {
  var counter = number;
  var alphabet = "abcdefghijklmnopqrstuvwxyz";
  var listOfRandomWords = [];

  while (counter > 0) {
    num_letters = (Math.floor(Math.random() * 10) + 1)
    word = "";
    for (i = 0; i <= num_letters; i++) {
      alpha_idx = Math.floor(Math.random() * 26);
      word += (alphabet[alpha_idx]);
    }
    listOfRandomWords.push(word);
    counter --;
  }
  return listOfRandomWords;
}

// --------------------
// Driver Code
// --------------------

var words = ["abracadabra", "noshebetterdont", "greatness", "magical", "boat", "garden", "beach", "a", "marlin", "log", "beaver"];
console.log(findLongestWord(words));
var wordsWithSpaces = ["hello", "hi there", "hi i am bob", "t t t t t t t", "a"]; //should be 'hi i am bob'
console.log(findLongestWord(wordsWithSpaces));


var dogs_a = {fido: 'red', spot: 'blue'};
var dogs_b = {fido: 'pink', fred: 'purple', jerry: 'green'};
var cats_a = {fuzzy: 'pink', janet: 'green', jack: 'teal', biggles: 'green'};
var cats_b = {fuzzy: 'purple', jack: 'blue', janet: 'green'};
var person_a = {name: "Steven", age: 54};
var person_b = {name: "Tamir", age: 54};
console.log(hasMatchingPair(dogs_a, dogs_b));
console.log(hasMatchingPair(cats_a, cats_b));
console.log(hasMatchingPair(person_a, person_b));

console.log(randomWords(3));
console.log(randomWords(1));
console.log(randomWords(10));

// --------------------
// Pseudo code
// --------------------
// Instructions: write a function that takes an array of words or phrases and returns the longest word or phrase in the array
//
// Accept a list of words/phrases as input
// Sort the items by length:
//     Start at the first item and second item
//     Compare the number of letters
//     Create a value to track whether or not words have been switched and set it to true
//     IF the first word has more letters than the second:
//       Switch the first and second words around
//       Change the words switched value to true
//     Increase the counter by one, moving to the next pair of items in the list
//     Repeat until the end of the list
//   Repeat until no words need to be switched
// Return the last item in the sorted list

//Instructions: write a function that takes two objects and checks to see if the objects share at least one key-value pair.
//
// Accept two objects as input
// Create a value to track if there is a match and set it to false
// For each key in the first object:
//   Check if there is a key in the second object with the same name
//   IF there is:
//     Check if its value is the same
//     IF it is:
//       Change the match value to true
//     IF it isn't:
//       Do nothing
//   IF there isn't:
//     Do nothing 
// Return the match value

// Instructions: Write a function that takes an integer for length, and builds and returns an array of strings of the given length
//
// Accept a number x (for the number of words)
// Store the number as the counter
// Store the alphabet in a list
// Create an empty list to hold the words
// While the counter is more than 0:
//   Generate and store a random number from 1 - 10 to be the length of the word
//   Create an empty word to hold the letters
//   While that counter is more than 0:
//     Generate and store a random number from 1 - 26
//     Use the 1-26 number to access the respective letter in the alphabet
//     Add that letter to the word
//     Decrease the counter by 1
//   Add that word to the list
//   Decrease the overall counter by 1
// Return a list with x number of words