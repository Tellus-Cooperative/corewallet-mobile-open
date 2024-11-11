import 'package:corewallet/models/api.dart';

abstract class TransactionRepository {
  Future<bool> createTransaction({
    required int walletId,
    required String destinationId,
    required String amount,
    required String seedEncrypted,
    required String memo,
  });

  Future<List<Conversions$Query$Conversions$Results?>> getConversions(
      {int? offset, int? limit, String? search});

  Future<bool> createSwapToken({
    required int walletId,
    required String seedEncrypted,
    required int assetOriginId,
    required int assetDestinyId,
    required String amount,
  });

  Future<String> buildPathStrictSend({
    required int walletId,
    required int assetOriginId,
    required int assetDestinyId,
    required String amount,
  });
}
