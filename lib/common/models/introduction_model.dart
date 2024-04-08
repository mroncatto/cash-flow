class IntroModel {
  final String img;
  final String title;
  final String subTitle;

  ///
  IntroModel({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<IntroModel> introductionItems = [
  IntroModel(
    img: "assets/img/4.png",
    title: "Wallet Security",
    subTitle:
        "Secure online and offline wallets\nwith our advance technology",
  ),
  IntroModel(
    img: "assets/img/3.png",
    title: "Real-Time Graphs",
    subTitle:
        "Get the real-time graphs with\nmarket history and info",
  ),
  IntroModel(
    img: "assets/img/1.png",
    title: "Financial Advises",
    subTitle: "Take professional financial advises\nfrom professionals anytime",
  ),
];