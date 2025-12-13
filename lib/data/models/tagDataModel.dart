import 'package:objectbox/objectbox.dart';

@Entity()
class TagDataModel {
  @Id()
  int id = 0;

  String name='notSet';
  String emoji='notSet';
  String color='white';

  DateTime createdAt = DateTime.now();
  DateTime updatedAt= DateTime.now();

  TagDataModel();

  TagDataModel.create({required this.id, required this.name, required this.emoji});
}