import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  const SecureStorageService();
  // Create an instance of FlutterSecureStorage
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Save a token securely
  Future<void> saveToken(String key, String token) async {
    try {
      await _storage.write(key: key, value: token);
      log("Token saved securely.");
    } catch (e) {
      log("Error saving token: $e");
    }
  }

  // Read a token securely
  Future<String?> getToken(String key) async {
    try {
      String? token = await _storage.read(key: key);
      return token;
    } catch (e) {
      log("Error reading token: $e");
      return null;
    }
  }

  // Delete a token securely
  Future<void> deleteToken(String key) async {
    try {
      await _storage.delete(key: key);
      log("Token deleted securely.");
    } catch (e) {
      log("Error deleting token: $e");
    }
  }
}
/*
// save user name if we want it 
 Future<void> saveUserName(String key, String userName) async {
    try {
      await _storage.write(key: key, value: userName);
      log("User Name saved securely.");
    } catch (e) {
      log("Error saving token: $e");
    }
  }
 // get user nmae if we want it 
  Future<String> getUserName(String key) async {
    try {
      String? userName = await _storage.read(key: key);
      log("User Name read securely.");
      return userName ?? '';
    } catch (e) {
      log("Error user read: $e");
    }
    return '';
  }
   */
