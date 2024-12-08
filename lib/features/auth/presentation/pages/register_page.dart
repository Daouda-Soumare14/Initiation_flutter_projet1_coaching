import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key}); // Le constructeur accepte une clé pour identifier le widget.

  @override
  State<RegisterPage> createState() => _RegisterPageState(); // Associe l'état `_RegisterPageState` à cette page.
}

// Classe représentant l'état de RegisterPage.
class _RegisterPageState extends State<RegisterPage> {
  // Contrôleurs pour gérer les entrées des champs de texte.
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController(); 
  final ConfirmPwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Méthode pour construire l'interface utilisateur.
    return Scaffold(
      body: SafeArea( // Permet de s'assurer que le contenu ne sera pas masqué par des zones sensibles comme les encoches ou la bare de statut.
        child: Center( // Centre tous les éléments enfants.
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0), // Ajoute un espacement horizontal autour du contenu.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centre les widgets verticalement.
              children: [
                // Icône en haut de la page.
                Icon(
                  Icons.lock_open_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary, // Utilise la couleur principale du thème.
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Let's create an account for you!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // Champ de saisie pour le nom.
                MyTextField(
                  controller: nameController, // Contrôleur pour gérer l'entrée utilisateur.
                  hintText: "Name", // Texte d'indication.
                  obscureText: false, // Le texte n'est pas masqué.
                ),
                const SizedBox(
                  height: 12, // Espacement vertical.
                ),
                // Champ de saisie pour l'email.
                MyTextField(
                  controller: emailController, 
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 12,
                ),
                // Champ de saisie pour le mot de passe.
                MyTextField(
                  controller: pwController,
                  hintText: "Password",
                  obscureText: true, // Le texte est masqué pour la confidentialité.
                ),
                const SizedBox(
                  height: 12,
                ),
                // Champ de saisie pour confirmer le mot de passe.
                MyTextField(
                  controller: ConfirmPwController,
                  hintText: "Confirm Password",
                  obscureText: true, // Le texte est masqué.
                ),
                const SizedBox(
                  height: 25,
                ),
                // Bouton pour enregistrer l'utilisateur.
                MyButton(
                  onTap: () {
                    // Action à exécuter lors du clic sur le bouton (vide pour l'instant).
                  },
                  text: "Register", // Texte affiché sur le bouton.
                ),
                const SizedBox(
                  height: 50,
                ),
                // Texte indiquant une alternative pour les utilisateurs déjà inscrits.
                Text(
                  "Already a member? Login now",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
