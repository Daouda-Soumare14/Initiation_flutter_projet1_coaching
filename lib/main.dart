import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet1/features/auth/presentation/pages/auth_page.dart';
import 'package:projet1/firebase_options.dart';
import 'package:projet1/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Assure que l'initialisation de Flutter est effectuée avant d'exécuter l'application

  // Initialisation de Firebase avec les options appropriées pour la plateforme cible (Android, iOS, etc.)
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme:lightMode,
      home:const AuthPage(),
    );
  }
}
