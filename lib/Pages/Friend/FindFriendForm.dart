import 'package:flutter/material.dart';
import 'package:project_it/Components/Button.dart';
import 'package:project_it/Models/User.dart';
import 'package:project_it/Providers/FriendProvider.dart';
import 'package:project_it/Providers/RouterProvider.dart';
import 'package:project_it/Providers/UserProvider.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/HexColor.dart';
import 'package:project_it/Widgets/Input.dart';
import 'package:project_it/Widgets/PushNavBar.dart';
import 'package:provider/provider.dart';

class AddFriendType extends StatefulWidget {
  final String? findType;
  const AddFriendType({super.key, this.findType});

  @override
  State<AddFriendType> createState() => _AddFriendTypeState();
}

class _AddFriendTypeState extends State<AddFriendType> {
  final TextEditingController _userIdentifyText = TextEditingController();
  final String _titleLabel = "Add by";
  String SecondTitle = "Username";
  bool userFound = false;
  User? foundUser;

  @override
  void initState() {
    super.initState();
    _updateTitle();
  }

  void _updateTitle() {
    if (widget.findType == "username") {
      setState(() => SecondTitle = "Username");
    } else if (widget.findType == "phonenumber") {
      setState(() => SecondTitle = "Phone number");
    }
  }

  void _handleSearchUser() {
    final input = _userIdentifyText.text.toString().trim();
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    final user = userProvider.usersList.firstWhere(
      (user) {
        if (widget.findType == "username") {
          return user.name.toLowerCase() == input.toLowerCase();
        } else if (widget.findType == "phonenumber") {
          final numericInput = input.replaceAll(RegExp(r'[^0-9]'), '');
          return user.phone == numericInput;
        }
        return false;
      },
      orElse: () => User(id: -1, name: 'Not Found', imageUrl: '', phone: ''),
    );

    if (user.id != -1) {
      setState(() {
        userFound = true;
        foundUser = user;
      });
    } else {
      setState(() {
        userFound = false;
        foundUser = null;
      });
    }
  }

  void _handleAddUser() {
    final friendProvider = Provider.of<FriendProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final routerProvider = Provider.of<RouterProvider>(context, listen: false);
    final user = userProvider.usersList.firstWhere((user) => user.id == foundUser!.id);
    friendProvider.addFriend(user.toMap());
    Navigator.pop(context);
    routerProvider.changeRoute(newRoute: '/FriendList', canPop: true, showBBar: true, backTo: '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PushNavbar(label: "$_titleLabel $SecondTitle", doPop: true),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Pallete.white,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Friend’s ${widget.findType == "username" ? "Username" : "Phone number"}",
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                          ),
                        ],
                      ),
                      MyInput(
                        placeholder: "Enter a $SecondTitle",
                        margin: const EdgeInsets.only(top: 5),
                        inputController: _userIdentifyText,
                        suffixIcon: Icon(Icons.search, color: Pallete.softgrey),
                        onTabSuffix: () {
                          _handleSearchUser();
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (userFound) ...[
                            Container(
                              height: MediaQuery.of(context).size.width * 0.25,
                              width: MediaQuery.of(context).size.width * 0.25,
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[100],
                                image: DecorationImage(
                                  image: AssetImage(foundUser!.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              foundUser!.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ] else
                            ...[],
                        ],
                      ),
                    ),
                  ),
                  AppButton(
                    bgColor: (userFound) ? Pallete.softGreen : HexColor("#eaedf0"),
                    textColor: (userFound) ? Pallete.white : HexColor("#a6b4bf"),
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      left: 10,
                      right: 10,
                    ),
                    label: "Add Friend",
                    obTap: () {
                      if (userFound) _handleAddUser();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AddFriendTypeOption extends StatelessWidget {
  final String label;
  final String leadingIcon;
  final String trailingIcon;

  const AddFriendTypeOption({
    super.key,
    required this.label,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
