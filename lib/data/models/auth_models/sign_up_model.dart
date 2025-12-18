class SignUpModel {
  final String username, firstName, lastName, email, phoneNumber, birthDate, password;

  SignUpModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      'email': email,
      "phoneNumber": phoneNumber,
      "birthDate": birthDate,
      "password": password,
    };
  }
}
