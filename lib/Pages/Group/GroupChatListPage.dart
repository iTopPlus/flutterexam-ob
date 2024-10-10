import 'package:flutter/material.dart';
import 'package:project_it/Providers/RouterProvider.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Widgets/Appbar.dart';
import 'package:project_it/Widgets/CusorPointer.dart';
import 'package:project_it/Widgets/Group/noGroup.dart';
import 'package:project_it/Widgets/SearchField.dart';
import 'package:project_it/Providers/GroupProvider.dart';
import 'package:provider/provider.dart';

class GroupChatListPage extends StatelessWidget {
  const GroupChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupProvider>(
      builder: (context, groupProvider, child) {
        final groupList = groupProvider.groupList;
        if (groupList.isEmpty) return const NoGroupWidget();
        final routerProvider = Provider.of<RouterProvider>(context, listen: false);

        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Pallete.white,
          child: Column(
            children: [
              const AppNavBar(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      const SearchField(),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: ListView.builder(
                            itemCount: groupList.length,
                            itemBuilder: (context, index) {
                              final group = groupList[index];

                              return GestureDetector(
                                onTap: () => routerProvider.changeRoute(newRoute: '/ChatPage', canPop: false, showBBar: false, data: group),
                                child: CPointer(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        group['Group_img'],
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(group['Group_name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                                              const Text('Six: message here'),
                                              const Text('You owe: ฿50.00', style: TextStyle(color: Colors.red)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('14:00'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
