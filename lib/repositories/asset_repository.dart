import '../models/api.graphql.dart';

abstract class AssetRepository {
  Future<List<Assets$Query$Assets$Results?>> getAssets(
      {int? offset, int? limit, String? search, String? forceUpdate});
}
