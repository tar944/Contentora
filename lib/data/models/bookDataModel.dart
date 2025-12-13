import 'package:contentora/data/models/creatorDataModel.dart';
import 'package:contentora/data/models/categoryDataModel.dart';
import 'package:contentora/data/models/partDataModel.dart';
import 'package:contentora/data/models/personDataModel.dart';
import 'package:contentora/data/models/tagDataModel.dart';
import 'package:contentora/utility/enums.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class BookDataModel {
  @Id()
  int id = 0;

  String name = 'notSet';
  String description = 'notSet';
  String srcLink = 'notSet';
  String reviewLink = '';
  String imgPath = 'notSet';

  String state = ContentState.newAdded.name;
  String kind = BookKind.fiction.name;

  int myStarCount = 0;
  int starCount = 3;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  // Relations — MUST be late final and initialized for ObjectBox
   final series = ToMany<BookDataModel>();
   final allParts = ToMany<PartDataModel>();
   final author = ToOne<CreatorDataModel>();
   final lender = ToOne<PersonDataModel>();
   final borrower = ToOne<PersonDataModel>();
   final category = ToOne<CategoryDataModel>();
   final tag = ToOne<TagDataModel>();

  // Empty constructor required by ObjectBox
  BookDataModel();

  // Optional named constructor to create new items cleanly
  BookDataModel.create({
    required this.name,
    required this.description,
    required this.srcLink,
    required this.imgPath,
  });
}
