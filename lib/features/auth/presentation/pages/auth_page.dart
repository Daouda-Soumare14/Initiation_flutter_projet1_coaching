import 'package:flutter/material.dart'; 
import 'package:projet1/features/auth/presentation/pages/login_page.dart'; 
import 'package:projet1/features/auth/presentation/pages/register_page.dart'; 


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

// État associé à AuthPage, permettant de gérer le basculement entre les pages.
class _AuthPageState extends State<AuthPage> {
  // Variable pour déterminer quelle page afficher (true = LoginPage, false = RegisterPage).
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage; // Change la valeur de showLoginPage.
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        // Passe une fonction à LoginPage, qui sera appelée pour basculer sur RegisterPage.
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
