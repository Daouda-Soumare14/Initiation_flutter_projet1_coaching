import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet1/features/auth/domain/entities/app_user.dart';
import 'package:projet1/features/auth/domain/repos/auth_repo.dart';
import 'package:projet1/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo; // Dépôt pour gérer les actions d'authentification.
  AppUser? _currentUser; // Utilisateur actuellement connecté, s'il existe.

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  // Méthode pour vérifier si l'utilisateur est actuellement authentifié.
  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser(); // Récupère l'utilisateur actuellement connecté depuis le dépôt.

    if (user != null) {
      _currentUser = user; // Si un utilisateur est trouvé, on le stocke.
      emit(Authenticated(user)); // Émet un état Authenticated avec les informations de l'utilisateur.
    } else {
      emit(Unauthenticated()); // Si aucun utilisateur n'est trouvé, émet un état Unauthenticated.
    }
  }

  // Getter pour accéder à l'utilisateur actuellement authentifié.
  AppUser? get currentUser => _currentUser;

  // Méthode pour gérer la connexion avec un email et un mot de passe.
  Future<void> login(String email, String pw) async {
    try {
      emit(AuthLoading()); // Émet un état de chargement pendant que l'authentification est en cours.
      final user = await authRepo.loginWithEmailPassword(email, pw); // Tente de se connecter avec l'email et le mot de passe fournis.

      if (user != null) {
        _currentUser = user; // Si la connexion réussit, on met à jour l'utilisateur.
        emit(Authenticated(user)); // Émet un état Authenticated avec les informations de l'utilisateur.
      } else {
        emit(Unauthenticated()); // Si la connexion échoue, émet un état Unauthenticated.
      }
    } catch (e) {
      emit(AuthErrors(e.toString())); // En cas d'erreur, émet un état AuthErrors avec le message d'erreur.
      emit(Unauthenticated()); // Puis émet un état Unauthenticated.
    }
  }

  Future<void> register(String name, String email, String pw) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.registerWithEmailPassword(name, email, pw);

      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthErrors(e.toString()));
      emit(Unauthenticated());
    }
  }

  // Méthode pour gérer la déconnexion de l'utilisateur.
  Future<void> logout() async {
    authRepo.logout(); // Appelle la méthode de déconnexion du dépôt.
    emit(Unauthenticated()); // Émet un état Unauthenticated après la déconnexion.
  }
}
