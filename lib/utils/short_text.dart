class ShortText {
  static String getShortText(String? text, {int maxLength = 20}) {
    if (text == null) return '';
    return text.length > maxLength ? '${text.substring(0, maxLength)}...' : text;
  }
}