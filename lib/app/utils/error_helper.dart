/// Error helper class for Supabase Auth error codes
/// Provides meaningful user-friendly messages for error codes
class ErrorHelper {
  /// Map of error codes to their user-friendly messages
  static const Map<String, String> _errorMessages = {
    // Anonymous & Authentication
    'anonymous_provider_disabled': 'Anonymous sign-ins are currently disabled.',
    'bad_code_verifier': 'Authentication failed. Please try signing in again.',
    'bad_json': 'Invalid request format. Please try again.',
    'bad_jwt': 'Your session has expired. Please sign in again.',
    'bad_oauth_callback':
        'Authentication failed. Please try a different sign-in method.',
    'bad_oauth_state': 'Authentication failed. Please try signing in again.',

    // CAPTCHA & Security
    'captcha_failed':
        'CAPTCHA verification failed. Please complete the CAPTCHA and try again.',
    'conflict': 'A conflict occurred. Please wait a moment and try again.',

    // Email Related
    'email_address_invalid':
        'Please use a valid email address. Test domains are not supported.',
    'email_address_not_authorized':
        'This email address is not authorized. Please contact support.',
    'email_conflict_identity_not_deletable':
        'Cannot unlink this identity. Please contact support.',
    'email_exists': 'An account with this email address already exists.',
    'email_not_confirmed':
        'Please verify your email address before signing in.',
    'email_provider_disabled':
        'Email sign-ups are currently disabled. Please use a different sign-in method.',

    // Flow & State
    'flow_state_expired':
        'Your sign-in session has expired. Please start over.',
    'flow_state_not_found': 'Sign-in session not found. Please try again.',

    // Hooks
    'hook_payload_invalid_content_type':
        'Invalid authentication payload. Please try again.',
    'hook_payload_over_size_limit':
        'Authentication data too large. Please try again.',
    'hook_timeout': 'Authentication timed out. Please try again.',
    'hook_timeout_after_retry':
        'Authentication failed after multiple attempts. Please try again later.',

    // Identity
    'identity_already_exists':
        'This identity is already linked to another account.',
    'identity_not_found': 'Identity not found. Please try again.',
    'insufficient_aal':
        'Additional verification required. Please complete multi-factor authentication.',

    // Credentials & Login
    'invalid_credentials': 'Invalid email or password. Please try again.',
    'invite_not_found': 'Invitation expired or already used.',
    'manual_linking_disabled':
        'Manual account linking is not available at this time.',

    // MFA (Multi-Factor Authentication)
    'mfa_challenge_expired':
        'Verification code expired. Please request a new one.',
    'mfa_factor_name_conflict':
        'An authentication factor with this name already exists.',
    'mfa_factor_not_found': 'Authentication factor not found.',
    'mfa_ip_address_mismatch':
        'IP address mismatch. Please complete the process from the same network.',
    'mfa_phone_enroll_not_enabled':
        'Phone verification is currently not available.',
    'mfa_phone_verify_not_enabled':
        'Phone verification is currently not available.',
    'mfa_totp_enroll_not_enabled':
        'Authenticator app setup is currently not available.',
    'mfa_totp_verify_not_enabled':
        'Authenticator app verification is currently not available.',
    'mfa_verification_failed': 'Incorrect verification code. Please try again.',
    'mfa_verification_rejected': 'Verification was rejected. Please try again.',
    'mfa_verified_factor_exists':
        'A verified phone number already exists. Please remove it first.',
    'mfa_web_authn_enroll_not_enabled':
        'WebAuthn setup is currently not available.',
    'mfa_web_authn_verify_not_enabled':
        'WebAuthn verification is currently not available.',

    // Authorization & Admin
    'no_authorization': 'Authorization required. Please sign in.',
    'not_admin': 'You do not have permission to perform this action.',

    // OAuth
    'oauth_provider_not_supported':
        'This sign-in method is not available. Please use a different method.',
    'provider_disabled':
        'This sign-in method is currently disabled. Please use a different method.',
    'provider_email_needs_verification':
        'Please verify your email address to complete sign-in.',

    // OTP
    'otp_disabled':
        'One-time password sign-in is currently disabled. Please use a different method.',
    'otp_expired': 'Verification code expired. Please request a new one.',

    // Rate Limiting
    'over_email_send_rate_limit':
        'Too many emails sent. Please wait a few minutes and try again.',
    'over_request_rate_limit':
        'Too many attempts. Please wait a few minutes and try again.',
    'over_sms_send_rate_limit':
        'Too many SMS messages sent. Please wait a few minutes and try again.',

    // Phone
    'phone_exists': 'An account with this phone number already exists.',
    'phone_not_confirmed': 'Please verify your phone number before signing in.',
    'phone_provider_disabled':
        'Phone sign-ups are currently disabled. Please use a different sign-in method.',

    // Password & Reauthentication
    'reauthentication_needed':
        'Please verify your identity to change your password.',
    'reauthentication_not_valid':
        'Verification failed. Please enter the correct code.',
    'same_password':
        'New password must be different from your current password.',
    'weak_password':
        'Password is too weak. Please use a stronger password with a mix of letters, numbers, and symbols.',

    // Refresh Token & Session
    'refresh_token_already_used': 'Session expired. Please sign in again.',
    'refresh_token_not_found': 'Session not found. Please sign in again.',
    'session_expired': 'Your session has expired. Please sign in again.',
    'session_not_found': 'Session not found. Please sign in again.',

    // Request
    'request_timeout': 'Request timed out. Please try again.',

    // SAML & SSO
    'saml_assertion_no_email':
        'Email address not provided by your organization. Please contact your administrator.',
    'saml_assertion_no_user_id':
        'User ID not provided by your organization. Please contact your administrator.',
    'saml_entity_id_mismatch':
        'SSO configuration mismatch. Please contact support.',
    'saml_idp_already_exists':
        'SSO provider already exists. Please contact support.',
    'saml_idp_not_found':
        'SSO provider not found. Please contact your administrator.',
    'saml_metadata_fetch_failed':
        'Failed to fetch SSO configuration. Please contact support.',
    'saml_provider_disabled':
        'Enterprise SSO is not enabled. Please use a different sign-in method.',
    'saml_relay_state_expired': 'SSO session expired. Please try again.',
    'saml_relay_state_not_found': 'SSO session not found. Please try again.',
    'sso_domain_already_exists':
        'SSO domain already registered. Please contact support.',
    'sso_provider_not_found': 'SSO provider not found. Please check your link.',

    // Sign-up
    'signup_disabled':
        'New account creation is currently disabled. Please contact support.',

    // Identity Management
    'single_identity_not_deletable':
        'Cannot remove your only sign-in method. Please add another method first.',

    // SMS
    'sms_send_failed': 'Failed to send SMS. Please try again later.',

    // MFA Limits
    'too_many_enrolled_mfa_factors':
        'Maximum number of verification methods reached. Please remove one first.',

    // Miscellaneous
    'unexpected_audience':
        'Invalid authentication token. Please sign in again.',
    'unexpected_failure':
        'An unexpected error occurred. Please try again later.',

    // User Management
    'user_already_exists': 'An account with this email address already exists',
    'user_banned':
        'Your account has been temporarily suspended. Please contact support.',
    'user_not_found': 'User account not found.',
    'user_sso_managed':
        'This account is managed by your organization. Please contact your administrator to make changes.',

    // Validation
    'validation_failed':
        'The information provided is invalid. Please check and try again.',
  };

  /// Get a user-friendly error message for a given error code
  ///
  /// If the error code is not found, returns a generic error message
  ///
  /// Example:
  /// ```dart
  /// String message = ErrorHelper.getErrorMessage('email_exists');
  /// // Returns: "An account with this email address already exists."
  /// ```
  static String getErrorMessage(String? errorCode) {
    if (errorCode == null || errorCode.isEmpty) {
      return 'An error occurred. Please try again.';
    }

    return _errorMessages[errorCode] ??
        'An error occurred. Please try again later.';
  }

  /// Check if an error code exists in the error messages map
  ///
  /// Example:
  /// ```dart
  /// bool exists = ErrorHelper.hasErrorCode('email_exists');
  /// // Returns: true
  /// ```
  static bool hasErrorCode(String errorCode) {
    return _errorMessages.containsKey(errorCode);
  }

  /// Get all available error codes
  static List<String> getAllErrorCodes() {
    return _errorMessages.keys.toList();
  }

  /// Get error message with additional context
  ///
  /// Example:
  /// ```dart
  /// String message = ErrorHelper.getErrorMessageWithContext(
  ///   'email_exists',
  ///   'user@example.com'
  /// );
  /// // Returns: "An account with this email address already exists. (user@example.com)"
  /// ```
  static String getErrorMessageWithContext(String? errorCode, String? context) {
    final message = getErrorMessage(errorCode);
    if (context != null && context.isNotEmpty) {
      return '$message ($context)';
    }
    return message;
  }
}
