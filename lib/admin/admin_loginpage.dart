import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:sanitary_pad_vending_machine_locator_app/admin/admin_homepage.dart';

final logger = Logger();

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Admin Panel'),
      ),
      body: AdminLoginForm(),
    );
  }
}

class AdminLoginForm extends StatefulWidget {
  AdminLoginForm({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  // ignore: library_private_types_in_public_api
  _AdminLoginFormState createState() => _AdminLoginFormState();
}

class _AdminLoginFormState extends State<AdminLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loginError = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _login() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final User? user = userCredential.user;

      if (user?.email == 'sresaghazu@gmail.com') {
        // User is recognized as an admin
        setState(() {
          _loginError = false;
        });
        widget._navigatorKey.currentState!.pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AdminHomePage(),
          ),
        );
      } else {
        // Handle non-admin users
        setState(() {
          _loginError = true;
        });
      }
    } catch (e) {
      logger.e('Authentication error: $e');

      setState(() {
        _loginError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _login,
          child: const Text('Login'),
        ),
        if (_loginError)
          const Text(
            'Incorrect Username or Password',
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
