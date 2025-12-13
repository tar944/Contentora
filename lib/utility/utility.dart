import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';

deleteFile(String filePath) async {
  var path = File(filePath);
  print(filePath);
  if (path.existsSync()) {
    path.deleteSync(recursive: true);
  }
}

/// Create an instance of ObjectBox to use throughout the app.
Future<String> copyImg(Uint8List bytes, String fileName) async {
  var dir = await getApplicationDocumentsDirectory();

  final imgsDir = Directory('${dir.path}/images');

  if (!await imgsDir.exists()) {
    await imgsDir.create(recursive: true);
  }

  final File file = File('${imgsDir.path}/$fileName');
  await file.writeAsBytes(bytes);
  return file.path;
}