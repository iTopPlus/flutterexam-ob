import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_it/Components/Button.dart';
import 'package:project_it/Providers/InviteProvider.dart';
import 'package:project_it/Providers/RouterProvider.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/HexColor.dart';
import 'package:project_it/Widgets/CheckBox.dart';
import 'package:project_it/Widgets/CusorPointer.dart';
import 'package:project_it/Widgets/PushNavBar.dart';
import 'package:project_it/Providers/GroupProvider.dart';
import 'package:provider/provider.dart';

class GroupCreatePage extends StatefulWidget {
  const GroupCreatePage({super.key});

  @override
  State<GroupCreatePage> createState() => GroupCreatePageState();
}

class GroupCreatePageState extends State<GroupCreatePage> {
  List<Map<String, dynamic>> SelectedFriend = [];

  String groupName = 'Group Name';
  void _handleCreateGroup() async {
    if (groupName.isEmpty) {
      _showSnackBar("Please enter a group name");
      return;
    }

    final groupProvider = Provider.of<GroupProvider>(context, listen: false);
    final routerProvider = Provider.of<RouterProvider>(context, listen: false);

    groupProvider.createGroup(groupName, 0, 'assets/images/icons/group.png', context);
    routerProvider.changeRoute(newRoute: '/', canPop: false, showBBar: true);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _editGroupName() async {
    String? newName = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController(text: groupName);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Enter new group name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    groupName = controller.text;
                  });
                  Navigator.pop(context, controller.text);
                },
                child: const Text('ยืนยัน'),
              ),
            ],
          ),
        );
      },
    );
    if (newName != null && newName.isNotEmpty) {
      setState(() {
        groupName = newName;
      });
    }
  }

  void _handleInvite() {
    print("Invite friends tapped!");
  }

  @override
  Widget build(BuildContext context) {
    final inviteProvider = Provider.of<InviteProvider>(context, listen: true);
    final SelectedFriend = inviteProvider.getSelectedUsers();

    return Column(
      children: [
        const PushNavbar(label: "Create New Group"),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                _uploadContainer(),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            if (SelectedFriend.isEmpty) Text("Members", style: TextStyle(color: Pallete.softGreen, fontSize: 16)),
                            if (SelectedFriend.isNotEmpty) Text("Members: ${SelectedFriend.length}", style: TextStyle(color: Pallete.softGreen, fontSize: 16)),
                          ],
                        )),
                    _inviteFriend(onTap: () => _handleInvite),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, bottom: 50),
                              child: ListView.builder(
                                itemCount: SelectedFriend.length,
                                itemBuilder: (context, index) {
                                  final friend = SelectedFriend[index];
                                  return ProfileRow(
                                    imageUrl: friend['imageUrl'],
                                    name: friend['name'],
                                    checked: friend['checked'],
                                    showChecker: false,
                                    onChecked: (check_value) {},
                                  );
                                },
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: AppButton(
                                  label: 'Create',
                                  obTap: () => _handleCreateGroup(),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _inviteFriend({VoidCallback? onTap}) {
    return GestureDetector(
      onTap: () {
        var currentRoute = Provider.of<RouterProvider>(context, listen: false);
        currentRoute.changeRoute(
          newRoute: '/GroupInvite',
          backTo: '/GroupCreate',
          canPop: false,
          showBBar: false,
        );
      },
      child: CPointer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(border: Border.all(width: 1, color: Pallete.softgrey), shape: BoxShape.circle),
              child: const Center(child: Icon(FontAwesomeIcons.plus)),
            ),
            const SizedBox(width: 10),
            const Text("Invite friends", style: TextStyle(fontSize: 16))
          ],
        ),
      ),
    );
  }

  Widget _uploadContainer() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: HexColor('#9BD1CA'),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset('assets/images/icons/cloudUpload.png'),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _editGroupName,
              child: Row(
                children: [
                  Text(
                    groupName,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  const Icon(FontAwesomeIcons.edit),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool? checked;
  final bool showChecker;
  final void Function(bool?)? onChecked;

  const ProfileRow({
    super.key,
    required this.imageUrl,
    required this.name,
    this.checked = false,
    this.onChecked,
    this.showChecker = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          if (showChecker)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: MyCheckBox(
                value: checked!,
                checkedColor: Pallete.softGreen,
                borderColor: HexColor("#c4cdd4"),
                onChanged: onChecked!,
              ),
            ),
        ],
      ),
    );
  }
}
