var color = ["blue", "red", "purple", "pink"];
var horse_name = ["Ed", "Sea Biscuit", "Tom", "Mr. H"];

color.push("Orange");
horse_name.push("Sky");
var horses = {};
for (var i = 0; i <= color.length - 1; i++){
horses[horse_name[i]] = color[i];
}

console.log(horses);


// -----------------------------------------------


function Car(year, make, model) {
  console.log("Our new Car:", this);

  this.year = year;
  this.make = make;
  this.model = model;

  this.start = function() { console.log("Vroooomm Vroooom"); };

  console.log("CAR INITIALIZATION COMPLETE");
}

console.log("Let's buy a car ...");
var newcar1 = new Car(2016, "Lexus", "IS-F");
console.log(newcar1);
console.log("Drive pushes ignition button");
newcar1.start();
console.log("----");

var newcar2 = new Car(2017, "Tesla", "X");
console.log(newcar2);
console.log("Drive pushes ignition button");
newcar2.start();
console.log("----");