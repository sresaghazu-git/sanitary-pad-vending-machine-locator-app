import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

final logger = Logger();

Future<void> createAdminUser(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Set custom claims to mark this user as an admin (optional)
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.updateDisplayName("Admin"); // Update the display name
      await user.reload();
    }
  } catch (e) {
    // Use the logger to log errors
    logger.e("Error creating admin user: $e");
  }
}
