import '../models/transaction.model.dart';
import 'arrays.dart';

List buildChardData(DateTime dateCurrent, List chartData) {
  List finalChartData1 = [];
  List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  int qtyRotate = dateCurrent.month - 6;

  List<int> newMonths = rotLeft(months, qtyRotate);
  newMonths.removeRange(7, 12);

  for (var elementM in newMonths) {
    var exist = chartData.firstWhere((element) => element.month == elementM,
        orElse: () => -1);
    if (exist == -1) {
      finalChartData1.add(ChartWallet(month: elementM, deposit: 0, debit: 0));
    } else {
      finalChartData1.add(exist);
    }
  }
  return finalChartData1;
}
