import 'package:flutter/material.dart';
import 'package:sanitary_pad_vending_machine_locator_app/screens/searchpage.dart';
import 'package:sanitary_pad_vending_machine_locator_app/admin/admin_loginpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 250, 211, 223),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Image.asset(
                  'assets/lotus.png',
                  width: 100,
                  height: 80,
                ),
                const Text(
                  'सहारा',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/vending machine.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 50),
            const Text(
              'FIND MY VENDING MACHINE',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));

                // Add your navigation or functionality here
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero, // No padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Curved edges
                ),
                backgroundColor: Colors.pink,
              ),
              child: Container(
                width: 120, // Button width
                height: 50, // Button height
                alignment: Alignment.center,
                child: const Text(
                  'GO',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminLoginPage(),
                  ),
                );
              },
              child: const Align(
                alignment:
                    Alignment.center, // Align the text to the lower left corner
                child: Padding(
                  padding: EdgeInsets.all(
                      16.0), // Add padding for better touch interaction
                  child: Text(
                    'Enter as Admin>>> ',
                    style: TextStyle(
                      fontSize: 18,
                      color:
                          Colors.black, // You can choose the color you prefer
                      decoration: TextDecoration
                          .underline, // Add an underline to indicate it's a link
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
