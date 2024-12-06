// capitalize first char in word input yasser --> Yasser
String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

// capitalize first char in each word input yasser osama --> Yasser Osama
String capitalizeEachWord(String text) {
  if (text.isEmpty) return text;
  return text
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');
}
