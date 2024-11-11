List<int> rotLeft(array, rotateTimes) {
  for (int i = 0; i < rotateTimes; i++) {
    int val = array[0];
    array.removeAt(0);
    array.add(val);
  }
  return array;
}
