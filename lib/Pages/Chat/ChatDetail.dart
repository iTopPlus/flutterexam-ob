import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_it/Pages/Group/GroupCreatePage.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Widgets/CusorPointer.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:project_it/Providers/GroupProvider.dart'; // Update the path as needed

class ChatDetail extends StatefulWidget {
  final Map? Data;
  const ChatDetail({super.key, this.Data});

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.white,
      body: Column(
        children: [
          _header(),
          _body(),
        ],
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Row(
          children: [
            CPointer(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.chevron_left, size: 35),
            )
          ],
        ),
        _chat_profile(),
      ],
    );
  }

  Widget _body() {
    return Consumer<GroupProvider>(
      builder: (context, groupProvider, child) {
        final group = groupProvider.groupList.firstWhere(
          (group) => group['id'] == widget.Data!['id'],
          orElse: () => {},
        );

        final groupMembers = group['Group_members'] as List? ?? [];
        return Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Members${(groupMembers.isNotEmpty) ? ": ${groupMembers.length}" : ""}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Pallete.softGreen,
                      ),
                    ),
                  ],
                ),
                CPointer(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Pallete.softgrey),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(child: Icon(FontAwesomeIcons.plus)),
                      ),
                      const SizedBox(width: 10),
                      const Text("Invite friends", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    itemCount: groupMembers.length,
                    itemBuilder: (context, index) {
                      final member = groupMembers[index];
                      return ProfileRow(name: member['name'], imageUrl: member['imageUrl'], showChecker: false);
                    },
                  ),
                ))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _chat_profile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          ClipOval(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Image.asset(widget.Data!['Group_img'], fit: BoxFit.cover),
            ),
          ),
          Text(
            widget.Data!['Group_name'],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
