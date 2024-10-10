import 'package:flutter/material.dart';
import 'package:project_it/Pages/Auth/SignInPage.dart';
import 'package:project_it/Pages/Auth/SignUp.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/HexColor.dart';

class FirstTimePage extends StatefulWidget {
  const FirstTimePage({super.key});

  @override
  State<FirstTimePage> createState() => _FirstTimePageState();
}

class _FirstTimePageState extends State<FirstTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              double imageHeight = MediaQuery.of(context).size.width * 0.3;
                              return Stack(
                                children: [
                                  Image.asset(
                                    'assets/images/icons/bill.png',
                                    fit: BoxFit.cover,
                                    height: imageHeight,
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 20,
                                    bottom: 0,
                                    right: 0,
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/icons/Dollar.png',
                                        height: imageHeight / 2,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "BuddyBills",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    _btn(
                      "Sign In",
                      bgColor: Pallete.softGreen,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInPage()),
                        );
                      },
                    ),
                    _btn(
                      "Sign Up",
                      bgColor: Pallete.black,
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "BuddyBills",
                      style: TextStyle(color: HexColor("#5A6E7C")),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Terms of Service ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "and ",
                            style: TextStyle(fontWeight: FontWeight.normal, color: HexColor("#5A6E7C")),
                          ),
                          const TextSpan(
                            text: "Privacy policy",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _btn(String label, {VoidCallback? ontap, Color? bgColor}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 46,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Pallete.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
