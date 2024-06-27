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
    title: "Bem-vindo",
    subTitle:
        "Gerencie despesas, orçamentos e metas \nem um só lugar",
  ),
  IntroModel(
    img: "assets/img/3.png",
    title: "Orçamentos",
    subTitle:
        "Crie orçamentos, receba alertas e \ncontrole seus gastos com facilidade",
  ),
  IntroModel(
    img: "assets/img/1.png",
    title: "Investimentos",
    subTitle: "Acompanhe investimentos, receba sugestões \ne simule cenários para seu futuro financeiro",
  ),
];