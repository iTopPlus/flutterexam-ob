import 'package:flutter/material.dart';
import 'package:project_it/Widgets/PushNavBar.dart';

class ChatCreateBill extends StatefulWidget {
  const ChatCreateBill({super.key});

  @override
  State<ChatCreateBill> createState() => _ChatCreateBillState();
}

class _ChatCreateBillState extends State<ChatCreateBill> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          PushNavbar(label: "Create new Bill"),
        ],
      ),
    );
  }
}
