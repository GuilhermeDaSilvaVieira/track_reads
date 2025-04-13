enum DetailsMenuOption {
  edit,
  delete,
}

/// Convert enum to readable String e.g. edit becomes Edit
extension BookStatusExtension on DetailsMenuOption {
  String get readable {
    // Convert the enum to a string and extract the name
    final name = toString().split('.').last;

    // Insert spaces before uppercase letters and capitalize the first letter
    final formatted = name.replaceAllMapped(
      RegExp(r'(?<!^)(?=[A-Z])'),
      (Match match) => ' ',
    );

    // Capitalize the first letter of the resulting string
    return formatted[0].toUpperCase() + formatted.substring(1);
  }
}
