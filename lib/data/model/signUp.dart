class SignUpUserModel {
   String? fullName;
   String? phoneNumber;
  final String email;
  final String password;

  SignUpUserModel({
     this.fullName,
     this.phoneNumber,
    required this.email,
    required this.password,
  });

  // Factory method to create a User instance from JSON
  factory SignUpUserModel.fromJson(Map<String, dynamic> json) {
    return SignUpUserModel(
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
    );
  }

  // Method to convert a User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    };
  }
}
