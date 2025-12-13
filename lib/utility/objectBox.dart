
import 'dart:io';

import 'package:contentora/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    var dir = await getApplicationDocumentsDirectory();

    final dbDir = Directory('${dir.path}/dataBase');

    if (!await dbDir.exists()) {
      await dbDir.create(recursive: true);
    }
    final store = await openStore(directory: dbDir.path);
    return ObjectBox._create(store);
  }
}