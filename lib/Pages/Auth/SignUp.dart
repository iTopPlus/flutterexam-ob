import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Widgets/Input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.white,
      appBar: AppBar(
        backgroundColor: Pallete.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Pallete.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              Form(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const MyInput(placeholder: 'Enter your email'),
                      const SizedBox(height: 20),
                      MyInput(
                        placeholder: 'Password',
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible; // Step 2: Toggle visibility
                            });
                          },
                          child: Icon(
                            _isPasswordVisible
                                ? FontAwesomeIcons.eyeSlash
                                : FontAwesomeIcons.eye,
                            color: Pallete.grey,
                          ),
                        ),
                        obscureText: !_isPasswordVisible, // Step 3: Update obscureText
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/CreateProfile'),
                        child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Pallete.softGreen,
                          ),
                          width: double.infinity,
                          child: const Center(
                            child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Pallete.grey),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _signInButton('Sign up with Google', 'assets/images/icons/google.png', ontap: () => Navigator.pushNamed(context, '/CreateProfile')),
                    _signInButton('Sign up with Facebook', 'assets/images/icons/facebook.png', ontap: () => Navigator.pushNamed(context, '/CreateProfile')),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "Already have an account?",
                            ),
                            const TextSpan(text: " "),
                            TextSpan(
                              text: "Sign In",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Pallete.softGreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton(String label, String image, {VoidCallback? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Pallete.softgrey),
          color: Pallete.transparent,
        ),
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                image,
                height: 25,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
