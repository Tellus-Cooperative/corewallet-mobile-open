import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

import '../models/api.graphql.dart';
import '../providers/graphql_provider.dart';

class AccountService {
  Future<Profile$Query$Profile?> getAccount({required int id}) async {
    final GraphQLClient client = getGraphQLClient(service: 'get_account');
    final QueryOptions options = QueryOptions(
      document: PROFILE_QUERY_DOCUMENT,
      variables: ProfileArguments(id: id).toJson(),
    );

    final QueryResult result = await client.query(options);
    if (!result.hasException) {
      return Profile$Query.fromJson(result.data!).profile;
    }
    return null;
  }

  Future<bool> createAccount({
    required String phone,
    required String fullName,
    required String password,
    required String email,
    required String country,
  }) async {
    final GraphQLClient client = getGraphQLClient(service: 'create_account');
    final MutationOptions options = MutationOptions(
      document: CREATE_PROFILE_MUTATION_DOCUMENT,
      variables: CreateProfileArguments(
        username: phone,
        password: password,
        full_name: fullName,
        mobile_phone: phone,
        email: email,
        country: country,
      ).toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (!result.isLoading && !result.hasException) {
      return true;
    } else {
      if (kDebugMode) {
        print(result.exception);
      }
      return false;
    }
  }

  Future<bool> updateAccount({
    required int id,
    String? fullName,
    String? country,
  }) async {
    final GraphQLClient client = getGraphQLClient(service: 'update_account');
    final MutationOptions options = MutationOptions(
      document: UPDATE_PROFILE_MUTATION_DOCUMENT,
      variables:
          UpdateProfileArguments(id: id, full_name: fullName, country: country)
              .toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (!result.isLoading && !result.hasException) {
      return true;
    } else {
      if (kDebugMode) {
        print(result.exception);
      }
      return false;
    }
  }

  Future<bool> makePasswordAccount({required String email}) async {
    final GraphQLClient client =
        getGraphQLClient(service: 'get_password_account');
    final MutationOptions options = MutationOptions(
      document: RESET_PASSWORD_USER_MUTATION_DOCUMENT,
      variables: ResetPasswordUserArguments(email: email).toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (!result.isLoading && !result.hasException) {
      return true;
    } else {
      if (kDebugMode) {
        print(result.exception);
      }
      return false;
    }
  }
}
