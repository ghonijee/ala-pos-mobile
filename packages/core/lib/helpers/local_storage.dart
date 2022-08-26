import 'package:hive/hive.dart';

class LocalStorage {
  // final storage = const FlutterSecureStorage();

  void setValue(key, value) async {
    var storage = await Hive.openBox(key);

    await storage.put(key, value);
  }

  Future getValue(key) async {
    var storage = await Hive.openBox(key);

    return storage.get(key);
  }

  Future<Map<String, dynamic>> getValueJson(key) async {
    Box box = await Hive.openBox(key);
    var value = box.get(key);
    if (value != null) {
      Map<String, dynamic> jsonData = Map<String, dynamic>.from(value);
      // final Map<String, dynamic> jsonData = await jsonDecode(value);
      return jsonData;
    }
    return <String, dynamic>{};
  }

  clearAll(key) async {
    var storage = await Hive.openBox(key);

    storage.clear();
  }

  /// Store list to local storeage
  /// each data must have primary key with properties [key]
  storeList<T>(String boxName, List<T> data) async {
    var box = await Hive.openBox<T>(boxName);
    for (T item in data) {
      box.put(item.key, value);
    }
  }

  /// Find spesific data by Key on BoxList
  /// return [T] data if exist and [null]
  /// when data not exist.
  findByKey<T>(String boxName, id) async {
    var box = await Hive.openBox<T>(boxName);
    return box.get(id);
  }

  store<T>(String boxName, T data) async {
    var box = await Hive.openBox<T>(boxName);
    return box.put(boxName, data);
  }

  show<T>(String boxName) async {
    var box = await Hive.openBox<T>(boxName);
    return box.get(boxName);
  }
}
