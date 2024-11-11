import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

import '../models/api.graphql.dart';
import '../providers/graphql_provider.dart';
import '../repositories/transaction_repository.dart';

class TransactionService implements TransactionRepository {
  @override
  Future<bool> createTransaction(
      {required int walletId,
      required String destinationId,
      required String amount,
      required String seedEncrypted,
      required String memo}) async {
    GraphQLClient client = getGraphQLClient(service: 'create_transaction');

    final MutationOptions options = MutationOptions(
      document: CREATE_TRANSACTION_MUTATION_DOCUMENT,
      variables: CreateTransactionArguments(
              wallet_id: walletId,
              destination_id: destinationId,
              amount: amount,
              seed_encrypted_key: seedEncrypted,
              memo: memo)
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
  Future<List<Conversions$Query$Conversions$Results?>> getConversions(
      {int? offset, int? limit, String? search}) async {
    final GraphQLClient client = getGraphQLClient(service: 'get_conversions');
    final QueryOptions options = QueryOptions(
      document: CONVERSIONS_QUERY_DOCUMENT,
      variables:
          ConversionsArguments(offset: offset, limit: limit, search: search)
              .toJson(),
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      return Conversions$Query.fromJson(result.data!).conversions!.results!;
    }
    return [];
  }

  @override
  Future<bool> createSwapToken(
      {required int walletId,
      required String seedEncrypted,
      required int assetOriginId,
      required int assetDestinyId,
      required String amount}) async {
    GraphQLClient client = getGraphQLClient(service: 'create_swap_token');

    final MutationOptions options = MutationOptions(
      document: CREATE_SWAP_TOKEN_MUTATION_DOCUMENT,
      variables: CreateSwapTokenArguments(
              wallet_id: walletId,
              seed_encrypted_key: seedEncrypted,
              origin_asset_id: assetOriginId,
              destiny_asset_id: assetDestinyId,
              amount: amount)
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
  Future<String> buildPathStrictSend(
      {required int walletId,
      required int assetOriginId,
      required int assetDestinyId,
      required String amount}) async {
    GraphQLClient client = getGraphQLClient(service: 'create_swap_token');

    final MutationOptions options = MutationOptions(
      document: BUILD_PATH_STRICT_SEND_MUTATION_DOCUMENT,
      variables: BuildPathStrictSendArguments(
              wallet_id: walletId,
              origin_asset_id: assetOriginId,
              destiny_asset_id: assetDestinyId,
              amount: amount)
          .toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      var amount = BuildPathStrictSend$Mutation.fromJson(result.data!)
          .buildPathStrictSend
          ?.amount;
      return amount!;
    }
    return '';
  }
}
