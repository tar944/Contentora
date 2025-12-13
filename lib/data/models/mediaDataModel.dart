import 'package:contentora/data/models/creatorDataModel.dart';
import 'package:contentora/data/models/categoryDataModel.dart';
import 'package:contentora/data/models/tagDataModel.dart';
import 'package:contentora/utility/enums.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class MediaDataModel {
  @Id()
  int id = 0;

  String name = 'notSet';
  String description = 'notSet';
  String imgPath = 'notSet';
  String srcLink = '';
  String reviewLink = '';

  String state = ContentState.newAdded.name;
  String kind = MediaKind.movie.name;

  int myStarCount = 0;
  int starCount = 3;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  DateTime? doneAt;

  // Relations — must be late final + initialized
  final seasons = ToMany<MediaDataModel>();
  final episodes = ToMany<MediaDataModel>();
  final author = ToOne<CreatorDataModel>();
  final category = ToOne<CategoryDataModel>();
  final tag = ToOne<TagDataModel>();

  // Required empty constructor
  MediaDataModel();

  // Optional clean constructor
  MediaDataModel.create({
    required this.name,
    required this.description,
    required this.imgPath,
  });
}
