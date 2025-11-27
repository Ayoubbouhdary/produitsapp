import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'add_produit.dart';

class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key});

  @override
  State<ProduitsList> createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  List<String> produits = ["Laptop", "Téléphone", "Tablet", "Montre"];
  List<bool> selected = [false, false, false, false];
  final TextEditingController _controller = TextEditingController();

  void changeSelection(bool? value, int index) {
    setState(() {
      selected[index] = value ?? false;
    });
  }

  void addProduit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddProduit(controller: _controller);
      },
    ).then((_) {
      if (_controller.text.isNotEmpty) {
        setState(() {
          produits.add(_controller.text);
          selected.add(false);
          _controller.clear();
        });
      }
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des produits"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: addProduit,
            child: Icon(Icons.add),
            heroTag: "add",
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: deleteSelected,
            child: Icon(Icons.delete_sweep),
            backgroundColor: Colors.red,
            heroTag: "delete",
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          return ProduitBox(
            nomProduit: produits[index],
            selProduit: selected[index],
            onChanged: (value) => changeSelection(value, index),
            delProduit: () => delProduit(index),
          );
        },
      ),
    );
  }
}