import 'package:flutter/material.dart';
import 'package:project_it/Pages/Friend/FindFriendForm.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Widgets/CusorPointer.dart';
import 'package:project_it/Widgets/PushNavBar.dart';

class Addfriend extends StatefulWidget {
  const Addfriend({super.key});

  @override
  State<Addfriend> createState() => _AddfriendState();
}

class _AddfriendState extends State<Addfriend> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PushNavbar(label: "Add Friends"),
        Expanded(
          child: Container(
            color: Pallete.white,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              children: [
                AddFriendOption(
                  label: "Add By Username",
                  leadingIcon: 'assets/images/icons/add_icon.png',
                  trailingIcon: 'assets/images/icons/chevron_right.png',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFriendType(findType: 'username'))),
                ),
                AddFriendOption(
                  label: "Add By Phone number",
                  leadingIcon: 'assets/images/icons/phone.png',
                  trailingIcon: 'assets/images/icons/chevron_right.png',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFriendType(findType: 'phonenumber',))),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class AddFriendOption extends StatelessWidget {
  final String label;
  final String leadingIcon;
  final String trailingIcon;
  final VoidCallback onTap;

  const AddFriendOption({
    super.key,
    required this.label,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CPointer(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 1, color: Pallete.softgrey.withOpacity(0.5)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(leadingIcon, height: 23),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      label,
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Image.asset(trailingIcon, height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
