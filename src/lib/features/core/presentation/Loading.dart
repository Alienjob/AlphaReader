import 'package:flutter/material.dart';

class LoadingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoadingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
