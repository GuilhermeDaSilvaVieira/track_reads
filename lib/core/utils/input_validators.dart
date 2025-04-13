class InputValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an email';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a password';
    }

    if (value.trim().length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.trim().isEmpty) {
      return 'Please confirm your password';
    }

    if (value.trim() != password.trim()) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a title';
    }

    return null;
  }

  static String? validateAuthor(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an author';
    }

    return null;
  }

  static String? validateOLID(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an OLID (Open Library ID)';
    }

    final olidRegex = RegExp(r'^OL[1-9]\d*[AMW]$');
    if (!olidRegex.hasMatch(value.trim())) {
      return 'Please enter a valid OLID (Open Library ID)';
    }

    return null;
  }
}
