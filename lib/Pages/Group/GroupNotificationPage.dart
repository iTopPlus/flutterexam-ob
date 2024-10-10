import 'package:flutter/material.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/HexColor.dart';

class GroupNotificationPage extends StatefulWidget {
  const GroupNotificationPage({super.key});

  @override
  State<GroupNotificationPage> createState() => _GroupNotificationPageState();
}

class _GroupNotificationPageState extends State<GroupNotificationPage> {
  List<Map<String, dynamic>> Notics = [
    {'name': "Thanan", "imageUrl": "assets/images/icons/profile.png", 'msg': "mentioned you in ‘Group name’ to", "timeAgo": '21 mins', 'action': "Pay new bill: ฿ 50.00", 'readed': false},
    {'name': "Chanit", "imageUrl": "assets/images/icons/profile2.png", 'msg': "‘Bill name’ with a total of ฿ 150.00", "timeAgo": '5 hrs', 'action': "in ‘Group name’", 'readed': true},
    {
      'name': "Everyone mentioned in",
      "imageUrl": "assets/images/icons/profile3.png",
      'msg': "‘Bill name’ with a total of ฿ 150.00",
      "timeAgo": '5 hrs',
      'action': "has paid successfully",
      'readed': true
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Pallete.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Pallete.softgrey.withOpacity(0.3))), color: Pallete.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Notification",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Pallete.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: Notics.length,
                itemBuilder: (context, index) {
                  return _notiRow(
                    name: Notics[index]['name'],
                    imaegUrl: Notics[index]['imageUrl'],
                    msg: Notics[index]['msg'],
                    timeAgo: Notics[index]['timeAgo'],
                    action: Notics[index]['action'],
                    readed: Notics[index]['readed'],
                  );
                }),
          ))
        ],
      ),
    );
  }

  Widget _notiRow({
    required String name,
    required String imaegUrl,
    required String msg,
    required String timeAgo,
    required String action,
    required bool readed,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: readed == true ? Pallete.transparent : HexColor("#f0fbfa"),
      ),
      height: 86,
      child: Row(
        children: [
          ClipOval(
            child: Container(
              height: 62,
              width: 62,
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Image.asset(imaegUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    Text(timeAgo, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                  ],
                ),
                Text(
                  msg,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  action,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: HexColor('#F75961')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
