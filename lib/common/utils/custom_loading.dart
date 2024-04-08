import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoading {
  CustomLoading._();

  static Widget showLoading(BuildContext context) =>
      LoadingAnimationWidget.threeArchedCircle(
        size: 20,
        color: Theme.of(context).primaryColor,
      );
}
