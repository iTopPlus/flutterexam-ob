import 'package:flutter/material.dart';
import 'package:project_it/Pages/Chat/ChatDetail.dart';
import 'package:project_it/Providers/RouterProvider.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/HexColor.dart';
import 'package:project_it/Widgets/CusorPointer.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final String? chatName;
  final String? chatImage;

  const ChatPage({super.key, this.chatName, this.chatImage});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<RouterProvider>(
          builder: (context, routerProvider, child) {
            final pageData = routerProvider.currentRoute?['data'];
            return Container(
              height: 60,
              color: Pallete.white,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => routerProvider.changeRoute(newRoute: '/', canPop: false, showBBar: true),
                    child: const CPointer(child: Icon(Icons.chevron_left, size: 40)),
                  ),
                  ClipOval(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                      ),
                      child: pageData != null
                          ? Image.asset(
                              pageData['Group_img'],
                              fit: BoxFit.cover,
                            )
                          : Container(), // Show a placeholder or empty container
                    ),
                  ),
                  Expanded(
                    child: Text(
                      pageData?['Group_name'] ?? "Default Chat Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: HexColor('#3E4850'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: CPointer(
                      onTap: () {
                        if (pageData != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatDetail(Data: pageData),
                            ),
                          );
                        }
                      },
                      child: Image.asset(
                        'assets/images/icons/history.png',
                        width: 27,
                        height: 27,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Expanded(
          child: Container(
            color: HexColor("#f4f4f4"),
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Consumer<RouterProvider>(
                  builder: (context, routerProvider, child) {
                    final pageData = routerProvider.currentRoute?['data'];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CPointer(
                                  onTap: () {
                                    if (pageData != null) {
                                      routerProvider.changeRoute(
                                        newRoute: '/ChatCreateBill',
                                        canPop: false,
                                        showBBar: false,
                                        backTo: '/ChatPage',
                                        data: pageData,
                                      );
                                    }
                                  },
                                  child: Image.asset('assets/images/icons/addPaper.png', width: 22),
                                ),
                                Image.asset('assets/images/icons/camera.png', width: 22),
                                Image.asset('assets/images/icons/img.png', width: 22),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(child: Image.asset('assets/images/icons/send.png', width: 35)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
