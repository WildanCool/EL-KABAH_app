import 'package:el_kabah_app_backup/database/database_helper.dart';
import 'package:el_kabah_app_backup/models/amalan_model.dart';

class AmalanService {

  static Future<void> insertAmalan(
    AmalanModel amalan,
  ) async {

    final db =
        await DatabaseHelper.database;

    await db.insert(
      "amalan",
      amalan.toMap(),
    );
  }

  static Future<List<AmalanModel>>
      getAmalan() async {

    final db =
        await DatabaseHelper.database;

    final List<Map<String, dynamic>>
        maps = await db.query("amalan");

    return List.generate(
      maps.length,
      (index) {
        return AmalanModel.fromMap(
          maps[index],
        );
      },
    );
  }
}