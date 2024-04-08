import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../../config/config.dart';



class OfflineUserState extends StatelessWidget {
  const OfflineUserState(
      {Key? key, required this.onPressed, required this.mainAxisAlignment})
      : super(key: key);

  final VoidCallback onPressed;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          SizedBox(
            height: size.height * 0.04,
          ),
          Lottie.asset(
            'assets/lottie/1.json',
            height: size.height * 0.15,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(AppConstantsStrings.internetConnectionProblem1,
              textAlign: TextAlign.center, style: theme.textTheme.headlineSmall),
          const SizedBox(
            height: 6,
          ),
          TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              side: MaterialStateProperty.all(
                BorderSide(
                  width: 1.5,
                  color: theme.primaryColor,
                ),
              ),
            ),
            child: Text("Atualizar", style: theme.textTheme.displayMedium),
          ),
        ],
      ),
    );
  }
}
