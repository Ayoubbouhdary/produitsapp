import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/produit.dart';
import 'produit_details.dart';
import 'add_produit_form.dart';
import 'produit_box.dart';

class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key});

  @override
  State<ProduitsList> createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  late Box<Produit> produitsBox;

  @override
  void initState() {
    super.initState();
    produitsBox = Hive.box<Produit>('produits');
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
      ),
      body: ValueListenableBuilder(
        valueListenable: produitsBox.listenable(),
        builder: (context, Box<Produit> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Aucun produit',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final produit = box.getAt(index)!;
              return ProduitBox(
                produit: produit,
                index: index,
                onTap: () => showProduitDetails(produit),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProduitForm(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}