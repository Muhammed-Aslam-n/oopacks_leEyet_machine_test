class RegistrationRequest {
  String emailOrPhoneNumber;
  String password;
  String firstName;
  String lastName;

  RegistrationRequest({
    required this.emailOrPhoneNumber,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() {
    return {
      "emailorphonenumber": emailOrPhoneNumber,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
    };
  }
}

class LoginRequest {
  String emailOrPhoneNumber;
  String password;

  LoginRequest({
    required this.emailOrPhoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "emailorphonenumber": emailOrPhoneNumber,
      "password": password,
    };
  }
}

class ForgotPasswordRequest {
  String emailOrPhoneNumber;
  String password;

  ForgotPasswordRequest({
    required this.emailOrPhoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "emailorphonenumber": emailOrPhoneNumber,
      "password": password,
    };
  }
}
