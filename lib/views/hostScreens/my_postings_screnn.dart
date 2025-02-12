import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locazen/views/hostScreens/creat_posting_screen.dart';
import 'package:locazen/views/widgets/posting_list_tile.dart';

class MyPostingsScrenn extends StatefulWidget {
  const MyPostingsScrenn({super.key});

  @override
  State<MyPostingsScrenn> createState() => _MyPostingsScrennState();
}

class _MyPostingsScrennState extends State<MyPostingsScrenn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Padding(
        padding: EdgeInsets.fromLTRB(26, 0, 26, 26),
        child: InkResponse(
          onTap: () {
            Get.to(CreatPostingScreen());
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey,
              width: 1.2,
            )),
            child: PostingListTile(),
          ),
        ),
      ),
    );
  }
}
