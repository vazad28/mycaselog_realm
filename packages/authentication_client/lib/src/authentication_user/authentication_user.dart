import 'package:equatable/equatable.dart';

/// {@template authentication_user}
/// User model
///
/// [AuthenticationUser.anonymous] represents an unauthenticated user.
/// {@endtemplate}
class AuthenticationUser extends Equatable {
  /// {@macro authentication_user}
  const AuthenticationUser({
    required this.id,
    //this.passcode,
    this.email,
    this.emailVerified,
    this.name,
    this.photo,
    this.isNewUser = true,
  });

  /// The current user's email address.
  final String? email;

  final bool? emailVerified;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Passcode of current user
  //final String? passcode;

  /// Whether the current user is a first time user.
  final bool isNewUser;

  /// Whether the current user is anonymous.
  bool get isAnonymous => this == anonymous;

  /// is user email verifier
  bool get isEmailVerified => emailVerified ?? false;

  /// Anonymous user which represents an unauthenticated user.
  static const anonymous = AuthenticationUser(id: '');

  AuthenticationUser copyWith({
    String? id,
    String? passcode,
    String? email,
    bool? emailVerified,
    String? name,
    String? photo,
    bool? isNewUser,
  }) {
    return AuthenticationUser(
      id: id ?? this.id,
      //passcode: passcode ?? this.passcode,
      emailVerified: emailVerified ?? this.emailVerified,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      isNewUser: isNewUser ?? this.isNewUser,
    );
  }

  @override
  List<Object?> get props => [email, id, name, photo, isNewUser];
}
