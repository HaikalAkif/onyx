import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onyx/screens/index.dart';
import 'package:onyx/screens/login_page.dart';
import '../styles/color.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({
    super.key,
  });

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isPasswordVisible = false;
  bool isLoading = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  void registerUser() async {
    if (_usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields!'),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Update user data for username
      await userCredential.user!.updateDisplayName(
        _usernameController.text,
      );

      if (userCredential.user != null) {
        const SnackBar snackBar = SnackBar(
          content: Text('Sign up successful! You may now log in.'),
        );
        showSnackBar(snackBar);
        _usernameController.clear();
        _emailController.clear();
        _passwordController.clear();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        const SnackBar snackBar =
            SnackBar(content: Text('The password provided is too weak.'));
        showSnackBar(snackBar);
      } else if (e.code == 'email-already-in-use') {
        const SnackBar snackBar = SnackBar(
            content: Text('The account already exists for that email.'));
        showSnackBar(snackBar);
      } else {
        SnackBar snackBar = SnackBar(
          content: Text(e.message!),
        );
        showSnackBar(snackBar);
      }
    } catch (e) {
      print(e);
      showSnackBar(
        const SnackBar(
          content: Text('Sign up failed!'),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
          Positioned.fill(
            child: Center(
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/onyxLogo.png',
                        height: 160.0,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Sign Up to Onyx',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
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
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
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
                        controller: _passwordController,
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
                          onPressed: !isLoading
                              ? () {
                                  registerUser();
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.second,
                            foregroundColor: MyColors.black,
                            disabledBackgroundColor: MyColors.grey,
                          ),
                          child: Text(
                            !isLoading ? 'Sign Up' : 'Please wait...',
                          ),
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            child: const Text(
                              'Log In',
                              style: TextStyle(color: MyColors.second),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
