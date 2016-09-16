// Pseudo code
// 
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

var words = ["abracadabra", "noshebetterdont", "greatness", "magical", "boat", "garden", "beach", "a", "marlin", "log", "beaver"];
console.log(findLongestWord(words));
var wordsWithSpaces = ["hello", "hi there", "hi i am bob", "t t t t t t t", "a"]; //should be 'hi i am bob'
console.log(findLongestWord(wordsWithSpaces));

//write a function that takes two objects and checks to see if the objects share at least one key-value pair.
//
//
// Accept an object as input
//   Create a value to track if there is a match and set it to false
// For each pair in the object: 
//   Create a counter
//   For each pair in the object:
//       Start at the beginning of the object
//       IF the first key matches and its value matches
//         Add one to the counter
//   IF the counter is more than 1 (since it will count itself):
//     Set the tracking value to true
// Return the tracking value