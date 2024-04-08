// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DecimalRounder {
  static String removePriceDecimals(price) {
    String finalPrice;
    if (price! < 0.000001) {
      finalPrice = price.toStringAsFixed(8);
    } else if (price! < 1) {
      finalPrice = price.toStringAsFixed(6);
    } else if (price < 10) {
      finalPrice = price.toStringAsFixed(5);
    } else if (price < 100) {
      finalPrice = price.toStringAsFixed(4);
    } else {
      finalPrice = price.toStringAsFixed(2);
    }
    return finalPrice;
  }

  static String removeChartPriceDecimals(price) {
    String finalPrice;
    if (price! < 1) {
      finalPrice = price.toStringAsFixed(4);
    } else if (price < 10) {
      finalPrice = price.toStringAsFixed(4);
    } else if (price < 100) {
      finalPrice = price.toStringAsFixed(2);
    } else {
      finalPrice = price.toStringAsFixed(0);
    }
    return finalPrice;
  }

  static String removePercentDecimals(percent24) {
    String percentChange;
    if (percent24! > 10000) {
      percentChange = percent24.toStringAsFixed(0);
    } else {
      percentChange = percent24.toStringAsFixed(2);
    }
    return percentChange;
  }

  static MaterialColor setColorFilter(percent24) {
    MaterialColor filterColor;
    if (percent24 >= 0.0) {
      filterColor = Colors.green;
    } else {
      filterColor = Colors.red;
    }
    return filterColor;
  }

  static Color setPercentChangesColor(percent24) {
    Color percentColor;
    if (percent24 < 0) {
      percentColor = Colors.red;
    } else if (percent24 > 0) {
      percentColor = Colors.green;
    } else {
      percentColor = Colors.white12;
    }
    return percentColor;
  }

  static Icon setPercentChangesIcon(percent24) {
    Icon percentIcon;

    if (percent24 < 0) {
      percentIcon = const Icon(
        Icons.arrow_drop_down,
        color: Colors.red,
      );
    } else if (percent24 > 0) {
      percentIcon = const Icon(
        Icons.arrow_drop_up,
        color: Colors.green,
      );
    } else {
      percentIcon = const Icon(
        Icons.minimize,
        color: Colors.grey,
      );
    }

    return percentIcon;
  }

  static Color setBgColorOfDetailsViewItem(percent24) {
    Color percentColor;
    if (percent24 < 0) {
      percentColor = const Color.fromARGB(255, 255, 215, 212);
    } else if (percent24 > 0) {
      percentColor = const Color.fromARGB(255, 224, 254, 223);
    } else {
      percentColor = Colors.white12;
    }
    return percentColor;
  }

  static Icon setPercentChangesIconForDetailsView(percent24) {
    Icon percentIcon;

    if (percent24 < 0) {
      percentIcon = const Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
      );
    } else if (percent24 > 0) {
      percentIcon = const Icon(
        Icons.arrow_drop_up,
        color: Colors.white,
      );
    } else {
      percentIcon = const Icon(
        Icons.minimize,
        color: Colors.white,
      );
    }

    return percentIcon;
  }

  static String setPrefixForRanking(rank) {
    String prefix;

    if (rank == 1 ||
        rank == 2 ||
        rank == 3 ||
        rank == 4 ||
        rank == 5 ||
        rank == 6 ||
        rank == 7 ||
        rank == 8 ||
        rank == 9 ||
        rank == 10) {
      return prefix = "🔥$rank";
    }
    return prefix = rank.toString();
  }

  static String setVolume(maxSupply) {
    String finalVolume;
    var formatter = NumberFormat.decimalPattern('en_us');

    if (maxSupply != null) {
      finalVolume = formatter.format(maxSupply);
      return finalVolume = "\$$finalVolume";
    }
    return finalVolume = "😴";
  }

  static String setMarketCap(marketCap) {
    String finalMarketCap;
    var formatter = NumberFormat.decimalPattern('en_us');
    if (marketCap != null) {
      finalMarketCap = formatter.format(marketCap);
      return finalMarketCap = "\$$finalMarketCap";
    }
    return finalMarketCap = "😴";
  }
}

