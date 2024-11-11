import '../models/api.graphql.dart';

abstract class WalletRepository {
  Future<List<Wallets$Query$Wallets$Results?>> getWallets(
      {required double profileId, int? offset, int? limit, String? search});

  Future<List<Wallets$Query$Wallets$Results?>> getWalletsShort(
      {required double profileId, int? offset, int? limit, String? search});

  Future<Wallet$Query$Wallet?> getWallet({required id});

  Future<CreateWallet$Mutation$CreateWallet?> createWallet(
      {required int profileId, required String mnemonicPhrase});

  Future<CreateMnemonicWallet$Mutation$CreateMnemonicWallet?> createMnemonicWallet(
      {required int profileId});

  updateWallet({required int id, String? name, String? emoji});

  Future<ImportWallet$Mutation$ImportWallet?> importWallet(
      {required int profileId, required String seedKey});

  Future<ExportWallet$Mutation$ExportWallet?> exportWallet(
      {required int id,
      required String seedEncryptedKey,
      required String phrases});

  Future<bool> deleteWallet(
      {required int walletId,
      required String seedEncrypted,
      int? destinationWalletId});

  Future<bool> createTrustAsset({
    required int id,
    required String seedEncrypted,
    required int assetId,
  });
}
