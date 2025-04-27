String capitalizeFirstThreeLetters(String input) {
  if (input.length < 3) {
    return input.toUpperCase();
  }
  String firstThree = input.substring(0, 3).toUpperCase();

  return firstThree;
}
