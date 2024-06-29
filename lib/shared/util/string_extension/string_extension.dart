extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toClassName() {
    var words = split(RegExp(r'[_\s]'));
    var result = '';
    for (var word in words) {
      result += '${word[0].toUpperCase()}${word.substring(1)}';
    }
    return result;
  }

  String toCamelCase() {
    var words = split(RegExp(r'[_\s]'));
    var result = words.first.toLowerCase();
    for (var i = 1; i < words.length; i++) {
      result += words[i][0].toUpperCase() + words[i].substring(1);
    }
    return result;
  }

  String toFileName() {
    return toLowerCase().replaceAll(' ', '_');
  }

  String toWordCase() {
    var words = split(RegExp(r'[_\s]'));
    var result = '';
    for (var word in words) {
      result += '${word[0].toUpperCase()}${word.substring(1)} ';
    }
    return result.trim();
  }
}
