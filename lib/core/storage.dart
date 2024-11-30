import 'package:hive/hive.dart';

class HiveService {
  static Box? _box;
  static HiveService? _instance;
  static Future<HiveService> getInstance() async {
    try {
      _box ??= await Hive.openBox("STORAGE_BOX_1");
    } catch (err) {
      print(err);
      Hive.deleteBoxFromDisk("STORAGE_BOX_1");
      _box ??= await Hive.openBox("STORAGE_BOX_1");
    }
    _instance ??= HiveService();

    return _instance!;
  }

  void closeBox() {
    _box?.close();
  }

  void storeValue<T>(String key, T value) async {
    await _box?.put(key, value);
  }

  T? getValue<T>(String key) {
    return _box?.get(key);
  }

  void deleteValue(String key) {
    _box?.delete(key);
  }

  Future<void> clearStorageBox() async {
    await _box?.clear();
  }
}
