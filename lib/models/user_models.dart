class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.frmJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"] ?? "https://img.freepik.com/free-photo/moon-light-shine-through-window-into-islamic-mosque-interior_1217-2597.jpg?size=626&ext=jpg&ga=GA1.1.814108079.1681554926",
    );
  }
}
