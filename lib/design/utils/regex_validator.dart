/// Regex Validator
class RegVal {
  /// Returns whether the pattern has a match in the string [input].
  static bool hasMatch(String? str, String pattern) =>
      str == null ? false : RegExp(pattern).hasMatch(str);

  static bool matchEveryCharacter(String? str, String pattern) => str == null
      ? false
      : RegExp(pattern).allMatches(str).map((e) => e.group(0)).join().length ==
          str.length;
}
