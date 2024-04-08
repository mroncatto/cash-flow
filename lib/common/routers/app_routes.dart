// ignore_for_file: constant_identifier_names

import 'package:cashflow/features/accounts_feature/presentation/screen/new_account.dart';
import 'package:cashflow/features/base_features/mainwrapper_feature/main_wrapper_locator.dart';
import 'package:cashflow/features/base_features/mainwrapper_feature/presentation/screens/main_wrapper.dart';
import 'package:cashflow/features/base_features/presentation/screens/introduction_view.dart';
import 'package:cashflow/features/base_features/splash_feature/presentation/screens/splash_view.dart';
import 'package:get/get.dart';

import 'routes_name.dart';
// import '../../../../../features/search_feature/presentation/screen/search_view.dart';
// import '../../../../../features/search_feature/presentation/search_locator.dart';
// import '../../features/crypto_details_feature/presentation/crypto_details_locator.dart';
// import '../../features/news_details_feature/presentation/news_details_locator.dart';
// import '../../features/base_features/mainwrapper_feature/main_wrapper_locator.dart';
// import '../../features/base_features/introduction_feature/presentation/screen/introduction_view.dart';
// import '../../features/base_features/mainwrapper_feature/presentation/screen/main_wrapper.dart';
// import '../../features/base_features/splash_feature/presentation/screen/splash_view.dart';
// import '../../features/home_features/presentation/screen/developer/developer_profile_view.dart';
// import '../../features/crypto_details_feature/presentation/screen/crypto_detail_view.dart';
// import '../../features/news_details_feature/presentation/screen/news_details_view.dart';

class AppRoutes {
  AppRoutes._();

  /// ... INITIAL ROUTE
  static const String INITIAL = RoutesName.splashScreen;
  static const Transition transition = Transition.fadeIn;

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => const SplashView(),
      transition: transition,
    ),
    GetPage(
      name: RoutesName.introductionScreen,
      page: () => const IntroDuctionView(),
      transition: transition,
    ),
    GetPage(
      name: RoutesName.mainWrapperScreen,
      page: () => MainWrapper(),
      binding: MainWrapperLocator(),
      transition: transition,
    ),
    GetPage(
      name: RoutesName.newAccount,
      page: () => const NewAccount(),
      transition: transition,
    ),
    // GetPage(
    //   name: RoutesName.detailsScreen,
    //   page: () => const CryptoDetailsView(),
    //   binding: CryptoDetailsLocator(),
    //   transition: transition,
    // ),
    // GetPage(
    //     name: RoutesName.newsDetailsScreen,
    //     page: () => const NewsDetailsView(),
    //     binding: NewsDetailsLocator(),
    //     transition: transition),
    // GetPage(
    //     name: RoutesName.searchScreen,
    //     page: () => const SearchView(),
    //     binding: SearchLocator(),
    //     transition: transition),
  ];
}
