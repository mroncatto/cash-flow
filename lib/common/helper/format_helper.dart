import 'package:intl/intl.dart';

class FormatHelper {

  static String formatarMoeda({required valor, symbol="", decimalDigits=0}) {
    NumberFormat formatoMoeda = NumberFormat.currency(locale: 'es_PY', symbol: symbol, decimalDigits: 0);
    return formatoMoeda.format(valor);
  }

  static String getMonthName({required monthNumber}) {
    List<String> months = <String>["Janeiro", "Fevereiro", "Marco", "Abril", "Maio", "Junio", "Julio", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
    if(monthNumber < 0 || monthNumber > 12) return "";
    return months[--monthNumber];
  }

  static String formatarData(DateTime data) {
    return DateFormat('dd/MM/yyyy').format(data);
  }

  static String formatarDataLetras(DateTime data) {
    return DateFormat('MMM d, yyyy').format(data);
  }

  static String formatarDataFormato(DateTime data, String formato) {
    return DateFormat(formato).format(data);
  }

}