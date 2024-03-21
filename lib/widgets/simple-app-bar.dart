// // ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  final PreferredSizeWidget? bottom;

  SimpleAppBar({super.key, this.bottom, this.title});

  @override
  Size get preferredSize => bottom == null
      ? Size(60, AppBar().preferredSize.height)
      : Size(60, 80 + AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      flexibleSpace: Container(
        color: const Color.fromARGB(255, 60, 116, 164),
      ),
      centerTitle: true,
      title: Text(
        title!,
        style: const TextStyle(
          fontSize: 45.0,
          letterSpacing: 3,
          color: Colors.white,
          fontFamily: "Signatra",
        ),
      ),
    );
  }
}
