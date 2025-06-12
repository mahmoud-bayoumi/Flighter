import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  const SecureStorageService();
  // Create an instance of FlutterSecureStorage
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Save a token securely
  Future<void> saveToken(String key, String token) async {
    try {
      await _storage.write(key: key, value: token);
      // ignore: empty_catches
    } catch (e) {}
  }

  // Read a token securely
  Future<String?> getWithKey(String key) async {
    try {
      String? token = await _storage.read(key: key);
      return token;
    } catch (e) {
      return null;
    }
  }

  // Delete a token securely
  Future<void> deleteToken(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {}
  }
}
