import 'package:flutter/material.dart';
import 'index.dart';
import '../styles/color.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/cinema.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            color: MyColors.black.withOpacity(0.5),
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/onyxLogo.png',
                    height: 160.0,
                  ),
                  const SizedBox(height: 20.0),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      filled: true,
                      fillColor: MyColors.white,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.primary),
                      ),
                      labelStyle: TextStyle(color: MyColors.primary),
                      prefixIcon: Icon(
                        Icons.person,
                        color: MyColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: MyColors.white,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.primary),
                      ),
                      labelStyle: TextStyle(color: MyColors.primary),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: MyColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: MyColors.primary),
                      ),
                      labelStyle: const TextStyle(color: MyColors.primary),
                      prefixIcon:
                          const Icon(Icons.lock, color: MyColors.primary),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: MyColors.primary,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => IndexPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.second,
                        foregroundColor: MyColors.black,
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'By signing up with Onyx, you agree to our Terms of Service and Privacy Policy.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: MyColors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: MyColors.second),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
