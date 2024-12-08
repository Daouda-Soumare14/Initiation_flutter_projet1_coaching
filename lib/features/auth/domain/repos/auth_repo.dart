import 'package:projet1/features/auth/domain/entities/app_user.dart';

// Classe abstraite représentant le dépôt pour l'authentification
abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  
  Future<AppUser?> registerWithEmailPassword(String name, String email, String password);
  
  Future<void> logout();
  
  // Méthode pour obtenir l'utilisateur actuel (s'il est connecté)
  Future<AppUser?> getCurrentUser();
}
