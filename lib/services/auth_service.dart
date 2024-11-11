import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

import '../models/api.graphql.dart';
import '../providers/graphql_provider.dart';

class AuthService {
  Future<String?> signIn(
      {required String username, required String password}) async {
    final GraphQLClient client = getGraphQLClient(service: 'token_auth');
    final MutationOptions options = MutationOptions(
      document: TOKEN_AUTH_MUTATION_DOCUMENT,
      variables:
          TokenAuthArguments(username: username, password: password).toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    if (!result.hasException) {
      return TokenAuth$Mutation.fromJson(result.data!).tokenAuth!.token;
    }

    return null;
  }
}
