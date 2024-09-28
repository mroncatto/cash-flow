import 'package:cashflow/common/models/cuenta_models/cuenta_model.dart';
import 'package:cashflow/common/widgets/empty_states/offline_user_state.dart';
import 'package:cashflow/features/accounts_feature/presentation/components/details_item_info.dart';
import 'package:cashflow/features/accounts_feature/presentation/controller/account_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../common/common.dart';

class DetailAccountView extends GetView<AccountViewController> {
  const DetailAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    DateTime _selected = DateTime.timestamp();

    return Scaffold(
      appBar: AppBar(
        title:
            Text("Detalles de la cuenta", style: theme.textTheme.displaySmall),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                  onTap: () async {
                    await controller.arquivarCuenta();
                  },
                  child: const Text("Arquivar Cuenta")),
            ],
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Column(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: controller.obx(
                    (state) {
                      CuentaModel? model = controller.cuenta;
                      return RefreshIndicator(
                          color: theme.primaryColor,
                          backgroundColor: theme.cardColor,
                          onRefresh: () {
                            return controller
                                .buscarContaPorId(Get.arguments[0]);
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            primary: false,
                            child: Column(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.01),
                                  width: size.width,
                                  height: size.height * 0.32,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.03),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              /// Mount change
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: GestureDetector(
                                                      onTap: () => {},
                                                      child: const Icon(
                                                          Icons
                                                              .keyboard_arrow_left,
                                                          color: Colors.white,
                                                          size: 30),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    margin: const EdgeInsets
                                                        .fromLTRB(30, 5, 40, 5),
                                                    child: GestureDetector(
                                                      onTap: () => {},
                                                      child: Text(
                                                          FormatHelper
                                                              .getMonthName(
                                                                  monthNumber:
                                                                      _selected
                                                                          .month),
                                                          style: GoogleFonts
                                                              .baiJamjuree(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      16)),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: GestureDetector(
                                                      onTap: () => {},
                                                      child: const Icon(
                                                          Icons
                                                              .keyboard_arrow_right,
                                                          color: Colors.white,
                                                          size: 30),
                                                    ),
                                                  ),
                                                  //GestureDetector(),
                                                ],
                                              ),

                                              /// Top title description
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: size.height * 0.02,
                                                    bottom:
                                                        size.height * 0.003),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      model.descripcion,
                                                      style: GoogleFonts.ubuntu(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    Text(
                                                      " / ${model.moneda.codigo}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.ubuntu(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),

                                              /// Saldo
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          size.height * 0.001),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              bottom:
                                                                  size.height *
                                                                      0.02),
                                                          child: Text(
                                                            "Saldo",
                                                            style: GoogleFonts.ubuntu(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.01,
                                                        ),
                                                        Text(
                                                          DecimalRounder
                                                              .setMarketCap(
                                                                  model.saldo),
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                      ])),

                                              /// Ajusta saldo Button
                                              // Padding(
                                              //     padding: EdgeInsets.only(
                                              //         bottom:
                                              //             size.height * 0.001),
                                              //     child: ElevatedButton(
                                              //       child:
                                              //           Text("Ajustar Saldo"),
                                              //       onPressed: () {},
                                              //     )),

                                              /// Detalhes
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: size.height * 0.01),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    DetailsLittleItem(
                                                      theme: theme,
                                                      size: size,
                                                      title: 'Ingresos',
                                                      subtitle: "200.000.000",
                                                    ),
                                                    DetailsLittleItem(
                                                      theme: theme,
                                                      size: size,
                                                      title: 'Gastos',
                                                      subtitle: "100.000.000",
                                                    ),
                                                    DetailsLittleItem(
                                                      theme: theme,
                                                      size: size,
                                                      title: 'Balance',
                                                      subtitle: "100.000.000",
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: size.height * 0.01),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 10,
                                                                  horizontal:
                                                                      2),
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .category_rounded),
                                                              SizedBox(
                                                                  width: 5),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Tipo",
                                                                    style: GoogleFonts.ubuntu(
                                                                        color: const Color
                                                                            .fromARGB(
                                                                            175,
                                                                            255,
                                                                            255,
                                                                            255),
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    model
                                                                        .toType()!,
                                                                    style: GoogleFonts
                                                                        .ubuntu(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 10,
                                                                  horizontal:
                                                                      2),
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .monetization_on),
                                                              SizedBox(
                                                                  width: 5),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Moneda",
                                                                    style: GoogleFonts.ubuntu(
                                                                        color: const Color
                                                                            .fromARGB(
                                                                            175,
                                                                            255,
                                                                            255,
                                                                            255),
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  Text(
                                                                    model.moneda
                                                                        .nombre,
                                                                    style: GoogleFonts
                                                                        .ubuntu(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                    onError: (error) => OfflineUserState(
                        onPressed: () {
                          controller.buscarContaPorId(Get.arguments[0]);
                        },
                        mainAxisAlignment: MainAxisAlignment.center),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controller.alterarCuenta();
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
