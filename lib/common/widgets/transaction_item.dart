import 'package:cashflow/common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/utils/custom_image_display.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.number,
    required this.tokenId,
    required this.model,
    required this.filterColor,
    required this.finalPrice,
    required this.percentIcon,
    required this.percentChange,
    required this.percentColor,
    required this.index,
  });

  final int number;
  final int? tokenId;
  final List<TransactionData>? model;
  final MaterialColor filterColor;
  final String finalPrice;
  final Icon percentIcon;
  final String percentChange;
  final Color percentColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: theme.cardColor),
      margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
      height: size.height * 0.090,
      width: size.width,
      child: Row(
        children: [
          /// number
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              number.toString(),
              style: theme.textTheme.displaySmall
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ),

          /// logo
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 15),
            child: CustomImageDisplay.customCachedImage(
              imageUrl:
              "https://s2.coinmarketcap.com/static/img/coins/32x32/$tokenId.png",
              size: 32,
            ),
          ),

          /// name and abbreviation
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model![index].name!,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: theme.textTheme.displaySmall?.copyWith(fontSize: 17),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(model![index].symbol!,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: theme.textTheme.titleSmall),
              ],
            ),
          ),

          /// Chart
          Flexible(
            fit: FlexFit.tight,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(filterColor, BlendMode.srcATop),
              child: CustomImageDisplay.customSvgImage(
                imageUrl:
                'https://s3.coinmarketcap.com/generated/sparklines/web/7d/2781/$tokenId.svg',
                placeholder: const Center(
                  child: Text(
                    "Loading...",
                  ),
                ),
              ),
            ),
          ),

          /// prices
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$$finalPrice",
                    maxLines: 1,
                    style: theme.textTheme.displaySmall
                        ?.copyWith(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Wrap(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      percentIcon,
                      Text(
                        "$percentChange%",
                        overflow: TextOverflow.fade,
                        style: GoogleFonts.ubuntu(
                            color: percentColor, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
