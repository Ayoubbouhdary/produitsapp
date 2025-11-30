import 'package:hive/hive.dart';

part 'produit.g.dart';

@HiveType(typeId: 0)
class Produit extends HiveObject {
  @HiveField(0)
  late String libelle;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late double prix;

  @HiveField(3)
  late String photo;

  Produit({
    required this.libelle,
    required this.description,
    required this.prix,
    required this.photo,
  });
}
