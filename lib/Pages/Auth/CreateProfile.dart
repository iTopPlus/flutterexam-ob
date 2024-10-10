import 'package:flutter/material.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/HexColor.dart';
import 'package:project_it/Widgets/Input.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
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
      body: Container(
        color: Pallete.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: const Text(
                  "Create your Profile",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .5,
                decoration: BoxDecoration(
                  color: HexColor("#d9d9d9"),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                      "assets/images/icons/upload.png",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      color: HexColor('#a6b4bf'),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Column(
                        children: [
                          Row(children: [Text("Email", style: TextStyle(fontWeight: FontWeight.bold))]),
                          MyInput(placeholder: "example@email.com"),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Column(
                        children: [
                          Row(children: [Text("Firstname", style: TextStyle(fontWeight: FontWeight.bold))]),
                          MyInput(placeholder: "Enter your firstname"),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Column(
                        children: [
                          Row(children: [Text("Display name", style: TextStyle(fontWeight: FontWeight.bold))]),
                          MyInput(placeholder: "Enter your display name"),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Column(
                        children: [
                          Row(children: [Text("Phone number", style: TextStyle(fontWeight: FontWeight.bold))]),
                          MyInput(placeholder: "Phone number"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/Group', (Route<dynamic> route) => false),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Pallete.softGreen,
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(color: Pallete.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
