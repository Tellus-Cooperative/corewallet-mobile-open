import 'package:corewallet/repositories/wallet_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

import '../models/api.graphql.dart';
import '../providers/graphql_provider.dart';
import '../utils/wallet_storage.dart';

class WalletService implements WalletRepository {
  @override
  Future<List<Wallets$Query$Wallets$Results?>> getWallets(
      {required double profileId,
      int? offset,
      int? limit,
      String? search}) async {
    final GraphQLClient client = getGraphQLClient(service: 'get_wallets');
    final QueryOptions options = QueryOptions(
      document: WALLETS_QUERY_DOCUMENT,
      variables: WalletsArguments(
              profile_id: profileId,
              offset: offset,
              limit: limit,
              search: search)
          .toJson(),
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      return Wallets$Query.fromJson(result.data!).wallets!.results!;
    }
    return [];
  }

  @override
  Future<List<Wallets$Query$Wallets$Results?>> getWalletsShort(
      {required double profileId,
      int? offset,
      int? limit,
      String? search}) async {
    final GraphQLClient client = getGraphQLClient(service: 'get_wallets');
    final QueryOptions options = QueryOptions(
      document: WALLETS_SHORT_QUERY_DOCUMENT,
      variables: WalletsShortArguments(
              profile_id: profileId,
              offset: offset,
              limit: limit,
              search: search)
          .toJson(),
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      return Wallets$Query.fromJson(result.data!).wallets!.results!;
    }
    return [];
  }

  @override
  Future<Wallet$Query$Wallet?> getWallet({required id}) async {
    final GraphQLClient client = getGraphQLClient(service: 'get_wallet');
    final QueryOptions options = QueryOptions(
      document: WALLET_QUERY_DOCUMENT,
      variables: WalletArguments(id: id).toJson(),
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      return Wallet$Query.fromJson(result.data!).wallet;
    }
    return null;
  }

  @override
  Future<CreateWallet$Mutation$CreateWallet?> createWallet(
      {required int profileId, required String mnemonicPhrase}) async {
    GraphQLClient client = getGraphQLClient(service: 'create_wallet');

    final MutationOptions options = MutationOptions(
      document: CREATE_WALLET_MUTATION_DOCUMENT,
      variables: CreateWalletArguments(profile_id: profileId, mnemonic_phrase: mnemonicPhrase).toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      CreateWallet$Mutation$CreateWallet? createWallet =
          CreateWallet$Mutation.fromJson(result.data!).createWallet;
      WalletStorage storage =
          WalletStorage(filename: "${createWallet!.wallet!.id!}.key");
      storage.writeWallet(createWallet.secretSeedEncrypted!);

      return createWallet;
    }
    return null;
  }

  @override
  Future<CreateMnemonicWallet$Mutation$CreateMnemonicWallet?> createMnemonicWallet(
      {required int profileId}) async {
    GraphQLClient client = getGraphQLClient(service: 'create_mnemonic_wallet');

    final MutationOptions options = MutationOptions(
      document: CREATE_MNEMONIC_WALLET_MUTATION_DOCUMENT,
      variables: CreateMnemonicWalletArguments(profile_id: profileId).toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }

    if (!result.isLoading && !result.hasException) {
      CreateMnemonicWallet$Mutation$CreateMnemonicWallet? createMnemonicWallet =
          CreateMnemonicWallet$Mutation.fromJson(result.data!).createMnemonicWallet;

      return createMnemonicWallet;
    }
    return null;
  }

  @override
  Future<bool> updateWallet(
      {required int id, String? name, String? emoji}) async {
    final GraphQLClient client = getGraphQLClient(service: 'update_wallet');
    final MutationOptions options = MutationOptions(
      document: UPDATE_WALLET_MUTATION_DOCUMENT,
      variables:
          UpdateWalletArguments(id: id, name: name, emoji: emoji).toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      return true;
    }
    return false;
  }

  @override
  Future<ExportWallet$Mutation$ExportWallet?> exportWallet(
      {required int id, required String seedEncryptedKey, required String phrases}) async {
    GraphQLClient client = getGraphQLClient(service: 'export_wallet');

    final MutationOptions options = MutationOptions(
      document: EXPORT_WALLET_MUTATION_DOCUMENT,
      variables:
          ExportWalletArguments(id: id, seed_encrypted_key: seedEncryptedKey, phrases: phrases)
              .toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      ExportWallet$Mutation$ExportWallet? exportWallet =
          ExportWallet$Mutation.fromJson(result.data!).exportWallet;

      return exportWallet;
    }
    return null;
  }

  @override
  Future<ImportWallet$Mutation$ImportWallet?> importWallet(
      {required int profileId, required String seedKey}) async {
    GraphQLClient client = getGraphQLClient(service: 'import_wallet');

    final MutationOptions options = MutationOptions(
      document: IMPORT_WALLET_MUTATION_DOCUMENT,
      variables:
          ImportWalletArguments(profile_id: profileId, secret_key: seedKey)
              .toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      ImportWallet$Mutation$ImportWallet? importWallet =
          ImportWallet$Mutation.fromJson(result.data!).importWallet;
      WalletStorage storage =
          WalletStorage(filename: "${importWallet!.wallet!.id!}.key");
      storage.writeWallet(importWallet.secretSeedEncrypted!);

      return importWallet;
    }
    return null;
  }

  @override
  Future<bool> deleteWallet(
      {required int walletId,
      required String seedEncrypted,
      int? destinationWalletId}) async {
    GraphQLClient client = getGraphQLClient(service: 'delete_wallet');

    final MutationOptions options = MutationOptions(
      document: DELETE_WALLET_MUTATION_DOCUMENT,
      variables: DeleteWalletArguments(
              wallet_id: walletId,
              seed_encrypted_key: seedEncrypted,
              destination_wallet_id: destinationWalletId)
          .toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> createTrustAsset(
      {required int id,
      required String seedEncrypted,
      required int assetId}) async {
    GraphQLClient client = getGraphQLClient(service: 'create_trust_asset');

    final MutationOptions options = MutationOptions(
      document: CREATE_WALLET_ASSET_MUTATION_DOCUMENT,
      variables: CreateWalletAssetArguments(
              id: id, seed_encrypted_key: seedEncrypted, asset_id: assetId)
          .toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      return true;
    }
    return false;
  }
}
