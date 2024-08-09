extension NameInitials on String? {
  String get initials {
    //   final name = this;
    //   if (name == null) return '';
    //   final split = name.trim().split(RegExp(r'\,s+'));
    //   final allInitials = split.map((s) => s[0]).toList().join();

    //   if (allInitials.length <= 3) return allInitials.toUpperCase();

    //   final initialsDual =
    //       allInitials[0] + allInitials[1] + allInitials[allInitials.length - 1];
    //   return initialsDual.toUpperCase();
    // }
    final name = this;
    if (name == null) return '';
    //final List<String> words = name.split(RegExp(r'\,s+'));
    final RegExp regExp = RegExp(r'[A-Z][a-z]*');
    final Iterable<Match> matches = regExp.allMatches(name);
    final List<String> words = matches.map((match) => match.group(0)!).toList();

    final List<String> initials = [];

    // Last name (first word)
    initials.add(words[0][0].toUpperCase());

    // First name (second word)
    if (words.length > 1) {
      initials.add(words[1][0].toUpperCase());
    }

    // Middle name (first letter of last word)
    if (words.length > 2) {
      initials.add(words.last[0].toUpperCase());
    }

    // Limit to 3 initials
    return initials.take(3).join('');
  }
}
