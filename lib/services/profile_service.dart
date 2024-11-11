import 'package:corewallet/repositories/profile_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

import '../models/api.graphql.dart';
import '../providers/graphql_provider.dart';

class ProfileService implements ProfileRepository {
  @override
  Future<bool> updateProfilePin({
    required int id,
    required String pin,
  }) async {
    final GraphQLClient client = getGraphQLClient(service: 'update_account');
    final MutationOptions options = MutationOptions(
      document: UPDATE_PROFILE_MUTATION_DOCUMENT,
      variables: UpdateProfileArguments(id: id, pin: pin).toJson(),
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

  @override
  verifyProfilePin({required int id, required String pin}) async {
    final GraphQLClient client =
        getGraphQLClient(service: 'verify_pin_profile');
    final MutationOptions options = MutationOptions(
      document: VERIFY_PROFILE_PIN_MUTATION_DOCUMENT,
      variables: VerifyProfilePinArguments(id: id, pin: pin).toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (!result.isLoading && !result.hasException) {
      var status = VerifyProfilePin$Mutation.fromJson(result.data!)
          .verifyProfilePin
          ?.status;
      return status;
    } else {
      if (kDebugMode) {
        print(result.exception);
      }
      return false;
    }
  }

  Future<bool> updateProfile({
    required int id,
    String? username,
    String? password,
    String? fullname,
    String? country,
    bool? isTestnet,
    String? codeOnesignal,
    String? email,
    String? mobilePhone,
    String? mobilePhoneCode,
    String? idType,
    String? idNumber,
  }) async {
    final GraphQLClient client = getGraphQLClient(service: 'update_account');
    final MutationOptions options = MutationOptions(
      document: UPDATE_PROFILE_MUTATION_DOCUMENT,
      variables: UpdateProfileArguments(
        id: id,
        full_name: fullname,
        username: username,
        password: password,
        country: country,
        code_onesignal: codeOnesignal,
        email: email,
        mobile_phone: mobilePhone,
        mobile_phone_code: mobilePhoneCode,
        id_type: idType,
        id_number: idNumber
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

  Future<GetProfile$Mutation$GetProfile?> getProfile(
      String tokenFirebase) async {
    final GraphQLClient client = getGraphQLClient(service: 'get_profile');
    final MutationOptions options = MutationOptions(
      document: GET_PROFILE_MUTATION_DOCUMENT,
      variables: GetProfileArguments(token: tokenFirebase).toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (result.hasException) {
      if (kDebugMode) {
        print(result.exception);
      }
    }

    if (!result.hasException && result.isNotLoading) {
      if (kDebugMode) {
        print(result.data!);
      }
      GetProfile$Mutation$GetProfile getProfile =
          GetProfile$Mutation.fromJson(result.data!).getProfile!;
      return getProfile;
    }
    return null;
  }

  @override
  sendVerificationEmailPin({required int id}) async {
    final GraphQLClient client =
        getGraphQLClient(service: 'send_verify_email_pin');
    final MutationOptions options = MutationOptions(
      document: SEND_EMAIL_PIN_MUTATION_DOCUMENT,
      variables: SendEmailPinArguments(id: id).toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (!result.isLoading && !result.hasException) {
      var status =
          SendEmailPin$Mutation.fromJson(result.data!).sendEmailPin?.status;
      return status;
    } else {
      if (kDebugMode) {
        print(result.exception);
      }
      return false;
    }
  }

  @override
  verifyEmailPin({required int id, required String pin}) async {
    final GraphQLClient client = getGraphQLClient(service: 'verify_email_pin');
    final MutationOptions options = MutationOptions(
      document: VERIFY_EMAIL_PIN_MUTATION_DOCUMENT,
      variables: VerifyEmailPinArguments(id: id, pin: pin).toJson(),
    );

    final QueryResult result = await client.mutate(options);

    if (!result.isLoading && !result.hasException) {
      var status =
          VerifyEmailPin$Mutation.fromJson(result.data!).verifyEmailPin?.status;
      return status;
    } else {
      if (kDebugMode) {
        print(result.exception);
      }
      return false;
    }
  }

  @override
  updateProfileCardReserved({required int id}) async {
    final GraphQLClient client = getGraphQLClient(service: 'update_account');
    final MutationOptions options = MutationOptions(
      document: UPDATE_PROFILE_MUTATION_DOCUMENT,
      variables:
          UpdateProfileArguments(id: id, is_card_reserved: true).toJson(),
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
