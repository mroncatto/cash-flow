import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, required this.title, this.action, this.isForDetails = false});

  final String title;
  final List<Widget>? action;
  final bool isForDetails;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: isForDetails
          ? IconButton(
              highlightColor: theme.canvasColor,
              splashColor: theme.primaryColor,
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
              color: theme.hintColor,
            )
          : null,
      title: Hero(
        tag: "H2S",
        child: Text(
          title,
          style: theme.textTheme.displayLarge?.copyWith(fontSize: 20),
        ),
      ),
      actions: action,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.07);
}
