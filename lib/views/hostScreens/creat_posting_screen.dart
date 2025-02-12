import 'package:flutter/material.dart';
import 'package:locazen/app_decoration.dart';

class CreatPostingScreen extends StatefulWidget {
  const CreatPostingScreen({super.key});

  @override
  State<CreatPostingScreen> createState() => _CreatPostingScreenState();
}

class _CreatPostingScreenState extends State<CreatPostingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: AppDecoration.gradientBoxDecoration,
        ),
        title: Text(
          "Creat and update poste",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.upload),
          )
        ],
      ),
    );
  }
}
