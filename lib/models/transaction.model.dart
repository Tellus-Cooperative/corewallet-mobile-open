class Transaction {
  late String transactionHash;
  late String sourceAccount;
  late DateTime createdAt;
  late String amount;
  late String assetCode;

  Transaction(
      {required this.transactionHash,
      required this.sourceAccount,
      required this.createdAt,
      required this.amount,
      required this.assetCode});
}

class ChartWallet {
  int month;
  double deposit;
  double debit;

  ChartWallet(
      {required this.month, required this.deposit, required this.debit});
}
