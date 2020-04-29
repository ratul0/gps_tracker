import 'dart:convert';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:gps/models/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class ShareService {
  static Future<void> share(String jsonString) async {
    Directory dir = await getApplicationDocumentsDirectory();
    File testFile = new File("${dir.path}/location.json");
    if (!await testFile.exists()) {
      await testFile.create(recursive: true);
    }
    testFile.writeAsStringSync(jsonString);
    ShareExtend.share(testFile.path, "file");
  }

  static String jsonEncodePosition(List<Position> positions) {
    return json.encode(positions.map<Point>(Point.fromPosition).toList());
  }
}
