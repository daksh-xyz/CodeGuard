import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:plagiarism_detect/recruiter_page.dart';
//import 'package:plagiarism_detect/student_page.dart';
import 'user_selection.dart'; // Import the user selection page

void main() {
  runApp(const CodeGuardApp());
}

class CodeGuardApp extends StatelessWidget {
  const CodeGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CodeGuard: Plagiarism Protector',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.white,
        scaffoldBackgroundColor: Colors.grey.shade300,
        fontFamily: "Moderustic",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/school.png",
                  scale: 2,
                ),
                const Text(
                  'Welcome to CodeGuard',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Secure Your Code Integrity',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const UserSelectionPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.black,
                      elevation: 0),
                  child: const Text(
                    'Start Detection',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
