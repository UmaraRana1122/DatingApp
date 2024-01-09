import 'package:get_storage/get_storage.dart';

class LocalServices {
  final GetStorage _myBox = GetStorage();

  read(key) {
    return _myBox.read(key);
  }

  write(key, value) async {
    await _myBox.write(key, value);
  }

  cleanKey(key) async {
    await _myBox.remove(key);
  }

  Future<bool> clear() async {
    await _myBox.erase();
    return false;
  }
}
