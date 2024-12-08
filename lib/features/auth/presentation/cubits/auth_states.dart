import 'package:projet1/features/auth/domain/entities/app_user.dart';


abstract class AuthState {}

// État initial de l'authentification, souvent utilisé au tout début de l'application.
class AuthInitial extends AuthState {}

// État représentant une opération en cours, comme une tentative de connexion ou d'inscription.
class AuthLoading extends AuthState {}

// État indiquant que l'utilisateur est authentifié avec succès.
class Authenticated extends AuthState {
  // Stocke les informations de l'utilisateur authentifié.
  final AppUser user;

  // Constructeur qui reçoit un utilisateur de type `AppUser`.
  Authenticated(this.user);
}

// État indiquant que l'utilisateur n'est pas authentifié (non connecté ou après une déconnexion).
class Unauthenticated extends AuthState {}

// État représentant une erreur survenue lors d'une opération d'authentification.
class AuthErrors extends AuthState {
  // Message décrivant l'erreur.
  final String message;

  // Constructeur qui reçoit le message d'erreur.
  AuthErrors(this.message);
}
