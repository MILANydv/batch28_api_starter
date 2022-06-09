class LoginRespone{
 
  String? token;
  bool? success;

  LoginRespone({
    this.token,
    this.success,
  });

  factory LoginRespone.fromJson(Map<String, dynamic> json) => LoginRespone(
    token: json['token'],
    success: json['success'],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "success": success,
  };

}