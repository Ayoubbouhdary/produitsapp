import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/produit.dart';
import 'produits_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
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
      home: const ProduitsList(),
    );
  }
}