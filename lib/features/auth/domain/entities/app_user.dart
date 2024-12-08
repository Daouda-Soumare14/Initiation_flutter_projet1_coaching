class AppUser {
  final String uid;  // Identifiant unique de l'utilisateur (généralement fourni par un service d'authentification)
  final String email;
  final String name;

  AppUser({required this.uid, required this.email, required this.name});

  // Méthode pour convertir un objet AppUser en Map<String, dynamic> (souvent utilisé pour stocker ou transmettre des données sous forme de JSON)
  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email, 'name': name};
  }

  // Méthode pour créer un objet AppUser à partir d'une Map<String, dynamic> (utilisé lors de la récupération de données depuis une source externe, comme une API ou une base de données)
  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(
        uid: jsonUser['uid'],
        email: jsonUser['email'],
        name: jsonUser['name'],
    );
  }
}
