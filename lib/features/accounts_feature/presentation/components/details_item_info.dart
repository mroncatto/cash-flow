import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class DetailsLittleItem extends StatelessWidget {
  const DetailsLittleItem({
    Key? key,
    required this.theme,
    required this.size,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final ThemeData theme;
  final Size size;

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(9)),
        color: Color.fromARGB(255, 102, 91, 226),
      ),
      width: size.width * 0.26,
      height: size.height * 0.062,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.ubuntu(
                color: const Color.fromARGB(175, 255, 255, 255),
                fontSize: 13,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: size.height * 0.001,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Text(
              subtitle,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
