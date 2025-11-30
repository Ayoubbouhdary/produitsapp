import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'firebase_options.dart';
import 'models/produit.dart';
import 'login_ecran.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialiser Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Configurer les fournisseurs d'authentification
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);
  
  // Initialiser Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ProduitAdapter());
  await Hive.openBox<Produit>('produits');
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LoginEcran(),
    );
  }
}