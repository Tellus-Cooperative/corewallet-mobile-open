String replaceWhitespacesUsingRegex(String s, String replace) {
  // This pattern means "at least one space, or more"
  // \\s : space
  // +   : one or more
  final pattern = RegExp('\\s+');
  return s.replaceAll(pattern, replace);
}