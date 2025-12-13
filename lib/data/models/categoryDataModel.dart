import 'package:contentora/utility/enums.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryDataModel {
  @Id()
  int id = 0;

  String name='notSet';
  String description='notSet';
  String imgPath='notSet';

  String isFor= ContentType.none.name;

  bool isActive= true;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt= DateTime.now();

  CategoryDataModel();

  CategoryDataModel.create({required this.id,required this.name,required this.description, required this.imgPath});
}