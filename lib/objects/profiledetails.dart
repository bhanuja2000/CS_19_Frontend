class User {
  final String name;
  final String email;
  final int mobile_Number;

  User({
    required this.name,
    required this.email,
    required this.mobile_Number,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      mobile_Number: json['mobile_Number'],
    );
  }
}
