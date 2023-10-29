import 'package:equatable/equatable.dart';

/// User Model
class User extends Equatable {
  final String id;
  final String email;

  const User({
    required this.id,
    required this.email,
  });

  @override
  List<Object?> get props => [id, email];
}
