import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blueGrey[300],
      iconTheme: IconThemeData(color: Colors.white),
      title: Text('Compose New Message', style: TextStyle(color: Colors.white)),
    );
  }
}
