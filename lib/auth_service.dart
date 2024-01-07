import 'dart:typed_data';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class AuthService {
  Future<Map<String, dynamic>?> loginUser(
      String username, String password) async {
    final db = await mongo.Db.create(
        'mongodb+srv://root:admin@teste.8apltkb.mongodb.net/test');
    await db.open();

    final user = await db.collection('users').findOne({
      'username': username,
      'password': password,
    });

    await db.close();

    return user;
  }

  Future<void> registerUser(String username, String email, String password,
      Uint8List? avatarBytes) async {
    // Validation
    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        avatarBytes == null) {
      throw Exception('Invalid registration data');
    }

    final db = await mongo.Db.create(
        'mongodb+srv://root:admin@teste.8apltkb.mongodb.net/test');
    await db.open();

    try {
      await db.collection('users').insert({
        'username': username,
        'email': email,
        'password': password,
        'avatar': avatarBytes,
      });
    } catch (e) {
      throw Exception('Registration failed: $e');
    } finally {
      await db.close();
    }
  }
}
