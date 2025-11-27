import 'package:flutter/material.dart';

class AddProduit extends StatelessWidget {
  final TextEditingController controller;

  const AddProduit({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Ajouter un produit"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Nom du produit",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Annuler"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Ajouter"),
        ),
      ],
    );
  }
}