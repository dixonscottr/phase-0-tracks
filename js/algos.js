// Pseudo code
// 
// Instructions: write a function that takes an array of words or phrases and returns the longest word or phrase in the array
//
// Accept a list of words/phrases as input
// Sort the items by length:
//     Start at the first item and second item
//     Compare the number of letters
//     Create a value to track whether or not words have been switched and set it to false
//     Create a counter to track the first word to compare
//     IF the first word has more letters than the second:
//       Switch the first and second words around
//       Change the words switched value to true
//     Increase the counter by one, moving to the next pair of items in the list
//     Repeat until the end of the list
//   Repeat until no words need to be switched
// Return the last item in the sorted list



