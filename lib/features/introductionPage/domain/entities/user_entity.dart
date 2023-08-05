import 'package:equatable/equatable.dart';

abstract class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.occupation,
  });

  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? occupation;

  @override
  List<Object?> get props => [id, email, firstName, lastName, occupation];
}
