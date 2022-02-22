import 'package:flutter/material.dart';

class AndroidAppBar extends StatelessWidget {
  const AndroidAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.transparent,
      title: Text("Prayer Requests"),
      pinned: true,
    );
  }
}
