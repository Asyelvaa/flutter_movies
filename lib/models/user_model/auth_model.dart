class UserLoginModel {
  final String userId;
  final String userEmail;

  UserLoginModel ({ 
    required this.userId, 
    required this.userEmail
    });
}

class UserModel {
  final String userId;
  final String username;
  final String email;
  final String password;
  final String phone;
  final String address;
  final String profileImageUrl;

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.profileImageUrl,
  });
}