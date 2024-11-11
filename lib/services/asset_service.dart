import 'package:corewallet/repositories/asset_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

import '../models/api.graphql.dart';
import '../providers/graphql_provider.dart';

class AssetService implements AssetRepository {
  @override
  Future<List<Assets$Query$Assets$Results?>> getAssets(
      {int? offset,
      int? limit,
      String? search,
      String? forceUpdate,
      bool? isRecommended}) async {
    if (search != null && search != '') {
      forceUpdate = 'true';
    }

    final GraphQLClient client = getGraphQLClient(service: 'get_assets');
    final QueryOptions options = QueryOptions(
      document: ASSETS_QUERY_DOCUMENT,
      variables: AssetsArguments(
        is_recommended: isRecommended,
        force_update: forceUpdate,
        offset: offset,
        limit: limit,
        search: search,
      ).toJson(),
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.isLoading && !result.hasException) {
      return Assets$Query.fromJson(result.data!).assets!.results!;
    }
    return [];
  }
}
