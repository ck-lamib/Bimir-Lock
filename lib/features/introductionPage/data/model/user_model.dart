import 'package:bimir_lock/features/introductionPage/domain/entities/user_entity.dart';

class UserDTO extends UserEntity {
  const UserDTO(
      {required super.id,
      required super.email,
      required super.firstName,
      required super.lastName,
      required super.occupation});

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        occupation: json["occupation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "occupation": occupation,
      };
}
