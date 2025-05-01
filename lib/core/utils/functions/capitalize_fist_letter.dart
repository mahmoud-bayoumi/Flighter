List capitalizeFirstLetterOfEach(List<dynamic> textList) {
  return textList.map((text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }).toList();
}
