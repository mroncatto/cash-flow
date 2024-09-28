import 'package:flutter/material.dart';

class EmptyResultState extends StatelessWidget {
  const EmptyResultState({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(msg),
    );
  }
}
