class AuthValidators {
  // ─────────────────────────────────────────────────────────────
  // Username
  // ─────────────────────────────────────────────────────────────

  static bool validateUsername(
      String username,
      ) {
    return username.trim().isNotEmpty;
  }

  // ─────────────────────────────────────────────────────────────
  // Email
  // ─────────────────────────────────────────────────────────────

  static bool validateEmail(
      String email,
      ) {
    return RegExp(
      r'^[\w\.-]+@[\w\.-]+\.\w+$',
    ).hasMatch(
      email.trim(),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Password
  // ─────────────────────────────────────────────────────────────

  static bool _isStrongPassword(
      String password,
      ) {
    if (password.length < 6) {
      return false;
    }

    // Al menos una letra
    if (!password.contains(
      RegExp(r'[a-zA-Z]'),
    )) {
      return false;
    }

    // Al menos un número
    if (!password.contains(
      RegExp(r'[0-9]'),
    )) {
      return false;
    }

    return true;
  }

  static bool validatePassword(
      String password,
      ) {
    return _isStrongPassword(
      password,
    );
  }

  // ─────────────────────────────────────────────────────────────
  // Confirm password
  // ─────────────────────────────────────────────────────────────

  static bool validateConfirmPassword({
    required String password,
    required String confirmPassword,
  }) {
    return password == confirmPassword;
  }
}