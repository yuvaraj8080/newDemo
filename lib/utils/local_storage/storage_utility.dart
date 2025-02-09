import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  late final GetStorage _storage;

  /// SINGLETON INSTANCE
  static TLocalStorage? _instance;

  TLocalStorage._internal() {
    _storage = GetStorage(); // Ensure storage is initialized
  }

  factory TLocalStorage.instance() {
    _instance ??= TLocalStorage._internal();
    return _instance!;
  }

  /// INITIALIZE STORAGE BEFORE USE
  static Future<void> init() async {
    await GetStorage.init(); // Ensure GetStorage is initialized globally
    _instance = TLocalStorage._internal();
  }

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
