import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase_ui_auth;
import 'produits_list.dart';

class LoginEcran extends StatelessWidget {
  const LoginEcran({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Si l'utilisateur n'est pas connecté, afficher le formulaire de connexion
        if (!snapshot.hasData) {
          return firebase_ui_auth.SignInScreen(
            providers: [
              firebase_ui_auth.EmailAuthProvider(),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      size: 80,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Gestion des Produits',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }

        // Si l'utilisateur est connecté, afficher l'écran principal
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Mon Compte',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.white),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: Colors.blue[50],
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue,
                      child: Text(
                        snapshot.data!.email![0].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      snapshot.data!.email ?? 'Utilisateur',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: const ProduitsList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
