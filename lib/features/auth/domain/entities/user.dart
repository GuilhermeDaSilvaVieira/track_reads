import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;

  const User({
    required this.uid,
    required this.email,
  });

  @override
  List<Object?> get props => [uid, email];
}
