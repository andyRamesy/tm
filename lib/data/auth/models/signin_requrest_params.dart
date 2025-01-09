class SigninRequrestParams {
  final String email;
  final String password;

  SigninRequrestParams({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  } 
}