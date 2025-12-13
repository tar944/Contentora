import 'package:contentora/utility/enums.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class PartDataModel {
  @Id()
  int id = 0;
  int from=0;
  int to=0;
  int sortNumber=-1;

  String unit=PartUnit.none.name;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt= DateTime.now();
  DateTime? doneAt;

  PartDataModel();

  PartDataModel.create({required this.id, required this.from, required this.to});
}