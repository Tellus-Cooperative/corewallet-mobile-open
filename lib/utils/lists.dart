import 'dart:math';

List listShuffle(List original) {
  List array = List.from(original);
  var random = Random(); //import 'dart:math';

  // Go through all elementsof list
  for (var i = array.length - 1; i > 0; i--) {
    // Pick a random number according to the length of list
    var n = random.nextInt(i + 1);
    var temp = array[i];
    array[i] = array[n];
    array[n] = temp;
  }
  return array;
}