import 'package:contentora/data/models/creatorDataModel.dart';
import 'package:contentora/data/models/categoryDataModel.dart';
import 'package:contentora/data/models/partDataModel.dart';
import 'package:contentora/data/models/tagDataModel.dart';
import 'package:contentora/utility/enums.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class AudioDataModel {
  @Id()
  int id = 0;

  String name = 'notSet';
  String description = 'notSet';
  String srcLink = 'notSet';
  String imgPath = 'notSet';

  String state = ContentState.newAdded.name;

  int myStarCount = 0;
  int starCount = 3;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  // Relations — MUST be late final and initialized
   final  episodes = ToMany<AudioDataModel>();
   final  allParts = ToMany<PartDataModel>();
   final  host = ToOne<CreatorDataModel>();
   final  category = ToOne<CategoryDataModel>();
   final  tag = ToOne<TagDataModel>();

  // Empty constructor required by ObjectBox
  AudioDataModel();

  // Optional clean constructor
  AudioDataModel.create({
    required this.name,
    required this.description,
    required this.srcLink,
    required this.imgPath,
  });
}
