class User {
  String? email;
  String? phone;
  String? address;
  String? username;
  String? password;
  String? country;

  User({
    this.email,
    this.phone,
    this.address,
    this.username,
    this.password,
    this.country,
  });

  // convert a User object into a Map object
  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        username: json['username'],
        password: json['password'],
        country: json['country'],
      );

// converting the class to json
  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "address": address,
        "username": username,
        "password": password,
        "country": country,
      };
}
