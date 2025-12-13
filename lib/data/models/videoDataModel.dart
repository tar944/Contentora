import 'package:contentora/data/models/creatorDataModel.dart';
import 'package:contentora/data/models/categoryDataModel.dart';
import 'package:contentora/data/models/tagDataModel.dart';
import 'package:contentora/utility/enums.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class VideoDataModel {
  @Id()
  int id = 0;

  String name = 'notSet';
  String description = 'notSet';
  String imgPath = 'notSet';
  String srcLink = '';
  String reviewLink = '';

  String state = ContentState.newAdded.name;
  String kind = VideoKind.movie.name;

  int myStarCount = 0;
  int starCount = 3;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  // Relations — must be late final + initialized
  final seasons = ToMany<VideoDataModel>();
  final episodes = ToMany<VideoDataModel>();
  final author = ToOne<CreatorDataModel>();
  final category = ToOne<CategoryDataModel>();
  final tag = ToOne<TagDataModel>();

  // Required empty constructor
  VideoDataModel();

  // Optional clean constructor
  VideoDataModel.create({
    required this.name,
    required this.description,
    required this.imgPath,
  });
}
