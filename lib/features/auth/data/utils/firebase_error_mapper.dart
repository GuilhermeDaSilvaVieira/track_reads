String mapFirebaseAuthError(String code) {
  const errorMessages = {
    // Indicates an improperly formatted email address.
    'invalid-email': 'The email address is not valid.',
    // Indicates the user corresponding to the given email has been disabled.
    'user-disabled': 'This user account has been disabled.',
    // Indicates there is no user record corresponding to the provided identifier.
    'user-not-found': 'No user found for that email.',
    // Indicates the password is invalid for the given email, or the account corresponding to the email does not have a password set.
    'wrong-password': 'The password is incorrect.',
    // Indicates that an account already exists with the given email address.
    'email-already-in-use': 'An account already exists for that email.',
    // Indicates that the given email address is already in use by another account.
    'account-exists-with-different-credential':
        'An account already exists with a different credential.',
    // Indicates that the operation is not allowed. You may need to enable it in the Firebase console.
    'operation-not-allowed': 'This operation is not allowed.',
    // Indicates that the password provided is too weak.
    'weak-password': 'The password is too weak.',
    // Additional common errors
    'invalid-credential': 'The supplied credentials are invalid.',
    'invalid-verification-code': 'The verification code is invalid.',
    'invalid-verification-id': 'The verification ID is invalid.',
  };

  return errorMessages[code] ??
      'Authentication failed. Please try again later.';
}
