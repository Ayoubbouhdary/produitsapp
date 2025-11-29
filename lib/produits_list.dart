import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'add_produit_form.dart';
import 'produit_details.dart';
import 'model/produit.dart';

class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key});

  @override
  State<ProduitsList> createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  List<Produit> produits = [];
  List<bool> selected = [];

  void changeSelection(bool? value, int index) {
    setState(() {
      selected[index] = value ?? false;
    });
  }

  void saveProduit(Produit produit) {
    setState(() {
      produits.add(produit);
      selected.add(false);
    });
  }

  void addProduit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProduitForm(onSave: saveProduit),
      ),
    );
  }

  void delProduit(int index) {
    setState(() {
      produits.removeAt(index);
      selected.removeAt(index);
    });
  }

  void deleteSelected() {
    setState(() {
      for (int i = produits.length - 1; i >= 0; i--) {
        if (selected[i]) {
          produits.removeAt(i);
          selected.removeAt(i);
        }
      }
    });
  }

  void showProduitDetails(Produit produit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProduitDetails(produit: produit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liste des produits',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: addProduit,
            heroTag: "add",
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(height: 10),
          if (produits.isNotEmpty)
            FloatingActionButton(
              onPressed: deleteSelected,
              heroTag: "delete",
              backgroundColor: Colors.red,
              child: const Icon(Icons.delete_sweep, color: Colors.white),
            ),
        ],
      ),
      body: produits.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 100,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Aucun produit',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Appuyez sur + pour ajouter un produit',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: produits.length,
              itemBuilder: (context, index) {
                return ProduitBox(
                  produit: produits[index],
                  selProduit: selected[index],
                  onChanged: (value) => changeSelection(value, index),
                  delProduit: () => delProduit(index),
                  onTap: () => showProduitDetails(produits[index]),
                );
              },
            ),
    );
  }
}