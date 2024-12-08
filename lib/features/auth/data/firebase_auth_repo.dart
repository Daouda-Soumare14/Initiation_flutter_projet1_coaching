import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet1/features/auth/domain/entities/app_user.dart';
import 'package:projet1/features/auth/domain/repos/auth_repo.dart';

// Classe qui implémente le dépôt d'authentification en utilisant Firebase
class FirebaseAuthRepo implements AuthRepo {
  // Instance de FirebaseAuth pour gérer l'authentification avec Firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Méthode pour connecter un utilisateur avec un email et un mot de passe
  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      // Tentative de connexion avec l'email et le mot de passe fournis
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      // Création d'un objet AppUser à partir des informations retournées par Firebase
      AppUser user =
          AppUser(uid: userCredential.user!.uid, email: email, name: '');

      // Retour de l'objet AppUser, représentant l'utilisateur authentifié
      return user;
    } catch (e) {
      // Si une erreur survient pendant la connexion, on la lance sous forme d'exception
      throw Exception('login failed: $e');
    }
  }

  // Méthode pour enregistrer un nouvel utilisateur avec un nom, un email et un mot de passe
  @override
  Future<AppUser?> registerWithEmailPassword(
      String name, String email, String password) async {
    try {
      // Tentative de création d'un nouvel utilisateur avec l'email et le mot de passe fournis
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Création d'un objet AppUser à partir des informations retournées par Firebase
      AppUser user =
          AppUser(uid: userCredential.user!.uid, email: email, name: name);

      // Retour de l'objet AppUser, représentant l'utilisateur nouvellement inscrit
      return user;
    } catch (e) {
      // Si une erreur survient pendant l'enregistrement, on la lance sous forme d'exception
      throw Exception('login failed: $e');
    }
  }

  // Méthode pour déconnecter l'utilisateur
  @override
  Future<void> logout() async {
    // Déconnexion de Firebase
    await firebaseAuth.signOut();
    throw UnimplementedError();
  }

  // Méthode pour obtenir l'utilisateur actuellement connecté
  @override
  Future<AppUser?> getCurrentUser() async {
    // Récupération de l'utilisateur actuellement connecté
    final firebaseUser = firebaseAuth.currentUser;

    // Si aucun utilisateur n'est connecté, retourner null
    if (firebaseUser == null) {
      return null;
    }

    // Sinon, retourner un objet AppUser représentant l'utilisateur connecté
    return AppUser(
        uid: firebaseUser.uid,
        email: firebaseUser.email!,
        name: '');                    
  }
}
