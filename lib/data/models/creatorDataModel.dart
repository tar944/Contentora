import 'package:contentora/utility/enums.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CreatorDataModel {
  @Id()
  int id = 0;

  String name='notSet';
  String description='notSet';
  String imgPath='notSet';
  String instaLink='';
  String xLink='';
  String wikiLink='';

  String isFor = ContentType.none.name;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt= DateTime.now();

  CreatorDataModel();

  CreatorDataModel.create({required this.id, required this.name, required this.description, required this.imgPath});
}