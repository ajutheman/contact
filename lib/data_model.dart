import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 0)
class DataModel extends HiveObject {
  @HiveField(0)
  final String? firstName;
  @HiveField(1)
  final String? lastName;
  @HiveField(2)
  final String? phoneNumber;
  @HiveField(3)
  bool isFavorite; // New field to indicate if the contact is a fav

  DataModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.isFavorite = false,
  });
}
