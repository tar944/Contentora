import 'package:objectbox/objectbox.dart';

@Entity()
class PersonDataModel {
  @Id()
  int id = 0;
  String name='notSet';
  String imgPath='notSet';
  String contactInfo='';
  String phoneNumber='';
  String telegramId='';
  String whatsAppId='';

  DateTime createdAt = DateTime.now();
  DateTime updatedAt= DateTime.now();

  PersonDataModel(this.id,this.name,this.imgPath);
}