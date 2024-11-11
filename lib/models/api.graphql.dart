// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Profiles$Query$Profiles$Results$User extends JsonSerializable
    with EquatableMixin {
  Profiles$Query$Profiles$Results$User();

  factory Profiles$Query$Profiles$Results$User.fromJson(
          Map<String, dynamic> json) =>
      _$Profiles$Query$Profiles$Results$UserFromJson(json);

  int? id;

  String? username;

  @JsonKey(name: 'first_name')
  String? firstName;

  @JsonKey(name: 'last_name')
  String? lastName;

  String? email;

  @override
  List<Object?> get props => [id, username, firstName, lastName, email];

  @override
  Map<String, dynamic> toJson() =>
      _$Profiles$Query$Profiles$Results$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Profiles$Query$Profiles$Results$MainWallet extends JsonSerializable
    with EquatableMixin {
  Profiles$Query$Profiles$Results$MainWallet();

  factory Profiles$Query$Profiles$Results$MainWallet.fromJson(
          Map<String, dynamic> json) =>
      _$Profiles$Query$Profiles$Results$MainWalletFromJson(json);

  int? id;

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJson() =>
      _$Profiles$Query$Profiles$Results$MainWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Profiles$Query$Profiles$Results extends JsonSerializable
    with EquatableMixin {
  Profiles$Query$Profiles$Results();

  factory Profiles$Query$Profiles$Results.fromJson(Map<String, dynamic> json) =>
      _$Profiles$Query$Profiles$ResultsFromJson(json);

  int? id;

  String? country;

  @JsonKey(name: 'mobile_phone')
  String? mobilePhone;

  @JsonKey(name: 'mobile_phone_code')
  String? mobilePhoneCode;

  @JsonKey(name: 'exist_wallets')
  bool? existWallets;

  @JsonKey(name: 'is_verified_email')
  bool? isVerifiedEmail;

  @JsonKey(name: 'is_card_reserved')
  bool? isCardReserved;

  @JsonKey(name: 'id_type')
  String? idType;

  @JsonKey(name: 'id_number')
  String? idNumber;

  Profiles$Query$Profiles$Results$User? user;

  @JsonKey(name: 'main_wallet')
  Profiles$Query$Profiles$Results$MainWallet? mainWallet;

  @override
  List<Object?> get props => [
        id,
        country,
        mobilePhone,
        mobilePhoneCode,
        existWallets,
        isVerifiedEmail,
        isCardReserved,
        idType,
        idNumber,
        user,
        mainWallet
      ];

  @override
  Map<String, dynamic> toJson() =>
      _$Profiles$Query$Profiles$ResultsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Profiles$Query$Profiles extends JsonSerializable with EquatableMixin {
  Profiles$Query$Profiles();

  factory Profiles$Query$Profiles.fromJson(Map<String, dynamic> json) =>
      _$Profiles$Query$ProfilesFromJson(json);

  int? totalCount;

  List<Profiles$Query$Profiles$Results?>? results;

  @override
  List<Object?> get props => [totalCount, results];

  @override
  Map<String, dynamic> toJson() => _$Profiles$Query$ProfilesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Profiles$Query extends JsonSerializable with EquatableMixin {
  Profiles$Query();

  factory Profiles$Query.fromJson(Map<String, dynamic> json) =>
      _$Profiles$QueryFromJson(json);

  Profiles$Query$Profiles? profiles;

  @override
  List<Object?> get props => [profiles];

  @override
  Map<String, dynamic> toJson() => _$Profiles$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Profile$Query$Profile$User extends JsonSerializable with EquatableMixin {
  Profile$Query$Profile$User();

  factory Profile$Query$Profile$User.fromJson(Map<String, dynamic> json) =>
      _$Profile$Query$Profile$UserFromJson(json);

  int? id;

  String? username;

  @JsonKey(name: 'first_name')
  String? firstName;

  @JsonKey(name: 'last_name')
  String? lastName;

  String? email;

  @override
  List<Object?> get props => [id, username, firstName, lastName, email];

  @override
  Map<String, dynamic> toJson() => _$Profile$Query$Profile$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Profile$Query$Profile extends JsonSerializable with EquatableMixin {
  Profile$Query$Profile();

  factory Profile$Query$Profile.fromJson(Map<String, dynamic> json) =>
      _$Profile$Query$ProfileFromJson(json);

  int? id;

  String? country;

  @JsonKey(name: 'mobile_phone')
  String? mobilePhone;

  @JsonKey(name: 'mobile_phone_code')
  String? mobilePhoneCode;

  @JsonKey(name: 'is_card_reserved')
  bool? isCardReserved;

  @JsonKey(name: 'id_type')
  String? idType;

  @JsonKey(name: 'id_number')
  String? idNumber;

  Profile$Query$Profile$User? user;

  @override
  List<Object?> get props => [
        id,
        country,
        mobilePhone,
        mobilePhoneCode,
        isCardReserved,
        idType,
        idNumber,
        user
      ];

  @override
  Map<String, dynamic> toJson() => _$Profile$Query$ProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Profile$Query extends JsonSerializable with EquatableMixin {
  Profile$Query();

  factory Profile$Query.fromJson(Map<String, dynamic> json) =>
      _$Profile$QueryFromJson(json);

  Profile$Query$Profile? profile;

  @override
  List<Object?> get props => [profile];

  @override
  Map<String, dynamic> toJson() => _$Profile$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateProfile$Mutation$CreateProfile$Profile extends JsonSerializable
    with EquatableMixin {
  CreateProfile$Mutation$CreateProfile$Profile();

  factory CreateProfile$Mutation$CreateProfile$Profile.fromJson(
          Map<String, dynamic> json) =>
      _$CreateProfile$Mutation$CreateProfile$ProfileFromJson(json);

  int? id;

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJson() =>
      _$CreateProfile$Mutation$CreateProfile$ProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateProfile$Mutation$CreateProfile extends JsonSerializable
    with EquatableMixin {
  CreateProfile$Mutation$CreateProfile();

  factory CreateProfile$Mutation$CreateProfile.fromJson(
          Map<String, dynamic> json) =>
      _$CreateProfile$Mutation$CreateProfileFromJson(json);

  CreateProfile$Mutation$CreateProfile$Profile? profile;

  @override
  List<Object?> get props => [profile];

  @override
  Map<String, dynamic> toJson() =>
      _$CreateProfile$Mutation$CreateProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateProfile$Mutation extends JsonSerializable with EquatableMixin {
  CreateProfile$Mutation();

  factory CreateProfile$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateProfile$MutationFromJson(json);

  @JsonKey(name: 'create_profile')
  CreateProfile$Mutation$CreateProfile? createProfile;

  @override
  List<Object?> get props => [createProfile];

  @override
  Map<String, dynamic> toJson() => _$CreateProfile$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfile$Mutation$UpdateProfile$Profile extends JsonSerializable
    with EquatableMixin {
  UpdateProfile$Mutation$UpdateProfile$Profile();

  factory UpdateProfile$Mutation$UpdateProfile$Profile.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateProfile$Mutation$UpdateProfile$ProfileFromJson(json);

  int? id;

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJson() =>
      _$UpdateProfile$Mutation$UpdateProfile$ProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfile$Mutation$UpdateProfile extends JsonSerializable
    with EquatableMixin {
  UpdateProfile$Mutation$UpdateProfile();

  factory UpdateProfile$Mutation$UpdateProfile.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateProfile$Mutation$UpdateProfileFromJson(json);

  UpdateProfile$Mutation$UpdateProfile$Profile? profile;

  @override
  List<Object?> get props => [profile];

  @override
  Map<String, dynamic> toJson() =>
      _$UpdateProfile$Mutation$UpdateProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfile$Mutation extends JsonSerializable with EquatableMixin {
  UpdateProfile$Mutation();

  factory UpdateProfile$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfile$MutationFromJson(json);

  @JsonKey(name: 'update_profile')
  UpdateProfile$Mutation$UpdateProfile? updateProfile;

  @override
  List<Object?> get props => [updateProfile];

  @override
  Map<String, dynamic> toJson() => _$UpdateProfile$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VerifyProfilePin$Mutation$VerifyProfilePin extends JsonSerializable
    with EquatableMixin {
  VerifyProfilePin$Mutation$VerifyProfilePin();

  factory VerifyProfilePin$Mutation$VerifyProfilePin.fromJson(
          Map<String, dynamic> json) =>
      _$VerifyProfilePin$Mutation$VerifyProfilePinFromJson(json);

  bool? status;

  @override
  List<Object?> get props => [status];

  @override
  Map<String, dynamic> toJson() =>
      _$VerifyProfilePin$Mutation$VerifyProfilePinToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VerifyProfilePin$Mutation extends JsonSerializable with EquatableMixin {
  VerifyProfilePin$Mutation();

  factory VerifyProfilePin$Mutation.fromJson(Map<String, dynamic> json) =>
      _$VerifyProfilePin$MutationFromJson(json);

  @JsonKey(name: 'verify_profile_pin')
  VerifyProfilePin$Mutation$VerifyProfilePin? verifyProfilePin;

  @override
  List<Object?> get props => [verifyProfilePin];

  @override
  Map<String, dynamic> toJson() => _$VerifyProfilePin$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Mutation$GetProfile$Profile extends JsonSerializable
    with EquatableMixin {
  GetProfile$Mutation$GetProfile$Profile();

  factory GetProfile$Mutation$GetProfile$Profile.fromJson(
          Map<String, dynamic> json) =>
      _$GetProfile$Mutation$GetProfile$ProfileFromJson(json);

  int? id;

  @JsonKey(name: 'mobile_phone')
  String? mobilePhone;

  @JsonKey(name: 'is_card_reserved')
  bool? isCardReserved;

  @JsonKey(name: 'id_type')
  String? idType;

  @JsonKey(name: 'id_number')
  String? idNumber;

  @override
  List<Object?> get props =>
      [id, mobilePhone, isCardReserved, idType, idNumber];

  @override
  Map<String, dynamic> toJson() =>
      _$GetProfile$Mutation$GetProfile$ProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Mutation$GetProfile extends JsonSerializable
    with EquatableMixin {
  GetProfile$Mutation$GetProfile();

  factory GetProfile$Mutation$GetProfile.fromJson(Map<String, dynamic> json) =>
      _$GetProfile$Mutation$GetProfileFromJson(json);

  GetProfile$Mutation$GetProfile$Profile? profile;

  String? token;

  String? message;

  @JsonKey(name: 'is_for_create')
  bool? isForCreate;

  @override
  List<Object?> get props => [profile, token, message, isForCreate];

  @override
  Map<String, dynamic> toJson() => _$GetProfile$Mutation$GetProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Mutation extends JsonSerializable with EquatableMixin {
  GetProfile$Mutation();

  factory GetProfile$Mutation.fromJson(Map<String, dynamic> json) =>
      _$GetProfile$MutationFromJson(json);

  @JsonKey(name: 'get_profile')
  GetProfile$Mutation$GetProfile? getProfile;

  @override
  List<Object?> get props => [getProfile];

  @override
  Map<String, dynamic> toJson() => _$GetProfile$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResetPasswordUser$Mutation$ResetPasswordUser extends JsonSerializable
    with EquatableMixin {
  ResetPasswordUser$Mutation$ResetPasswordUser();

  factory ResetPasswordUser$Mutation$ResetPasswordUser.fromJson(
          Map<String, dynamic> json) =>
      _$ResetPasswordUser$Mutation$ResetPasswordUserFromJson(json);

  bool? status;

  @override
  List<Object?> get props => [status];

  @override
  Map<String, dynamic> toJson() =>
      _$ResetPasswordUser$Mutation$ResetPasswordUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResetPasswordUser$Mutation extends JsonSerializable with EquatableMixin {
  ResetPasswordUser$Mutation();

  factory ResetPasswordUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordUser$MutationFromJson(json);

  @JsonKey(name: 'reset_password_user')
  ResetPasswordUser$Mutation$ResetPasswordUser? resetPasswordUser;

  @override
  List<Object?> get props => [resetPasswordUser];

  @override
  Map<String, dynamic> toJson() => _$ResetPasswordUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendEmailPin$Mutation$SendEmailPin extends JsonSerializable
    with EquatableMixin {
  SendEmailPin$Mutation$SendEmailPin();

  factory SendEmailPin$Mutation$SendEmailPin.fromJson(
          Map<String, dynamic> json) =>
      _$SendEmailPin$Mutation$SendEmailPinFromJson(json);

  bool? status;

  @override
  List<Object?> get props => [status];

  @override
  Map<String, dynamic> toJson() =>
      _$SendEmailPin$Mutation$SendEmailPinToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendEmailPin$Mutation extends JsonSerializable with EquatableMixin {
  SendEmailPin$Mutation();

  factory SendEmailPin$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SendEmailPin$MutationFromJson(json);

  @JsonKey(name: 'send_email_pin')
  SendEmailPin$Mutation$SendEmailPin? sendEmailPin;

  @override
  List<Object?> get props => [sendEmailPin];

  @override
  Map<String, dynamic> toJson() => _$SendEmailPin$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VerifyEmailPin$Mutation$VerifyEmailPin extends JsonSerializable
    with EquatableMixin {
  VerifyEmailPin$Mutation$VerifyEmailPin();

  factory VerifyEmailPin$Mutation$VerifyEmailPin.fromJson(
          Map<String, dynamic> json) =>
      _$VerifyEmailPin$Mutation$VerifyEmailPinFromJson(json);

  bool? status;

  @override
  List<Object?> get props => [status];

  @override
  Map<String, dynamic> toJson() =>
      _$VerifyEmailPin$Mutation$VerifyEmailPinToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VerifyEmailPin$Mutation extends JsonSerializable with EquatableMixin {
  VerifyEmailPin$Mutation();

  factory VerifyEmailPin$Mutation.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailPin$MutationFromJson(json);

  @JsonKey(name: 'verify_email_pin')
  VerifyEmailPin$Mutation$VerifyEmailPin? verifyEmailPin;

  @override
  List<Object?> get props => [verifyEmailPin];

  @override
  Map<String, dynamic> toJson() => _$VerifyEmailPin$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Assets$Query$Assets$Results extends JsonSerializable with EquatableMixin {
  Assets$Query$Assets$Results();

  factory Assets$Query$Assets$Results.fromJson(Map<String, dynamic> json) =>
      _$Assets$Query$Assets$ResultsFromJson(json);

  int? id;

  String? name;

  String? symbol;

  int? position;

  String? price24h;

  @JsonKey(name: 'price_percent24h')
  String? pricePercent24h;

  String? image;

  @override
  List<Object?> get props =>
      [id, name, symbol, position, price24h, pricePercent24h, image];

  @override
  Map<String, dynamic> toJson() => _$Assets$Query$Assets$ResultsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Assets$Query$Assets extends JsonSerializable with EquatableMixin {
  Assets$Query$Assets();

  factory Assets$Query$Assets.fromJson(Map<String, dynamic> json) =>
      _$Assets$Query$AssetsFromJson(json);

  int? totalCount;

  List<Assets$Query$Assets$Results?>? results;

  @override
  List<Object?> get props => [totalCount, results];

  @override
  Map<String, dynamic> toJson() => _$Assets$Query$AssetsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Assets$Query extends JsonSerializable with EquatableMixin {
  Assets$Query();

  factory Assets$Query.fromJson(Map<String, dynamic> json) =>
      _$Assets$QueryFromJson(json);

  Assets$Query$Assets? assets;

  @override
  List<Object?> get props => [assets];

  @override
  Map<String, dynamic> toJson() => _$Assets$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateTransaction$Mutation$CreateTransaction extends JsonSerializable
    with EquatableMixin {
  CreateTransaction$Mutation$CreateTransaction();

  factory CreateTransaction$Mutation$CreateTransaction.fromJson(
          Map<String, dynamic> json) =>
      _$CreateTransaction$Mutation$CreateTransactionFromJson(json);

  bool? status;

  @override
  List<Object?> get props => [status];

  @override
  Map<String, dynamic> toJson() =>
      _$CreateTransaction$Mutation$CreateTransactionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateTransaction$Mutation extends JsonSerializable with EquatableMixin {
  CreateTransaction$Mutation();

  factory CreateTransaction$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateTransaction$MutationFromJson(json);

  @JsonKey(name: 'create_transaction')
  CreateTransaction$Mutation$CreateTransaction? createTransaction;

  @override
  List<Object?> get props => [createTransaction];

  @override
  Map<String, dynamic> toJson() => _$CreateTransaction$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Conversions$Query$Conversions$Results extends JsonSerializable
    with EquatableMixin {
  Conversions$Query$Conversions$Results();

  factory Conversions$Query$Conversions$Results.fromJson(
          Map<String, dynamic> json) =>
      _$Conversions$Query$Conversions$ResultsFromJson(json);

  int? id;

  String? name;

  String? symbol;

  @JsonKey(name: 'quote_name')
  String? quoteName;

  @JsonKey(name: 'quote_symbol')
  String? quoteSymbol;

  @JsonKey(name: 'quote_price')
  double? quotePrice;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  @override
  List<Object?> get props =>
      [id, name, symbol, quoteName, quoteSymbol, quotePrice, updatedAt];

  @override
  Map<String, dynamic> toJson() =>
      _$Conversions$Query$Conversions$ResultsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Conversions$Query$Conversions extends JsonSerializable
    with EquatableMixin {
  Conversions$Query$Conversions();

  factory Conversions$Query$Conversions.fromJson(Map<String, dynamic> json) =>
      _$Conversions$Query$ConversionsFromJson(json);

  int? totalCount;

  List<Conversions$Query$Conversions$Results?>? results;

  @override
  List<Object?> get props => [totalCount, results];

  @override
  Map<String, dynamic> toJson() => _$Conversions$Query$ConversionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Conversions$Query extends JsonSerializable with EquatableMixin {
  Conversions$Query();

  factory Conversions$Query.fromJson(Map<String, dynamic> json) =>
      _$Conversions$QueryFromJson(json);

  Conversions$Query$Conversions? conversions;

  @override
  List<Object?> get props => [conversions];

  @override
  Map<String, dynamic> toJson() => _$Conversions$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateSwapToken$Mutation$CreateSwapToken extends JsonSerializable
    with EquatableMixin {
  CreateSwapToken$Mutation$CreateSwapToken();

  factory CreateSwapToken$Mutation$CreateSwapToken.fromJson(
          Map<String, dynamic> json) =>
      _$CreateSwapToken$Mutation$CreateSwapTokenFromJson(json);

  bool? status;

  @override
  List<Object?> get props => [status];

  @override
  Map<String, dynamic> toJson() =>
      _$CreateSwapToken$Mutation$CreateSwapTokenToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateSwapToken$Mutation extends JsonSerializable with EquatableMixin {
  CreateSwapToken$Mutation();

  factory CreateSwapToken$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateSwapToken$MutationFromJson(json);

  @JsonKey(name: 'create_swap_token')
  CreateSwapToken$Mutation$CreateSwapToken? createSwapToken;

  @override
  List<Object?> get props => [createSwapToken];

  @override
  Map<String, dynamic> toJson() => _$CreateSwapToken$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BuildPathStrictSend$Mutation$BuildPathStrictSend extends JsonSerializable
    with EquatableMixin {
  BuildPathStrictSend$Mutation$BuildPathStrictSend();

  factory BuildPathStrictSend$Mutation$BuildPathStrictSend.fromJson(
          Map<String, dynamic> json) =>
      _$BuildPathStrictSend$Mutation$BuildPathStrictSendFromJson(json);

  String? amount;

  @override
  List<Object?> get props => [amount];

  @override
  Map<String, dynamic> toJson() =>
      _$BuildPathStrictSend$Mutation$BuildPathStrictSendToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BuildPathStrictSend$Mutation extends JsonSerializable
    with EquatableMixin {
  BuildPathStrictSend$Mutation();

  factory BuildPathStrictSend$Mutation.fromJson(Map<String, dynamic> json) =>
      _$BuildPathStrictSend$MutationFromJson(json);

  @JsonKey(name: 'build_path_strict_send')
  BuildPathStrictSend$Mutation$BuildPathStrictSend? buildPathStrictSend;

  @override
  List<Object?> get props => [buildPathStrictSend];

  @override
  Map<String, dynamic> toJson() => _$BuildPathStrictSend$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TokenAuth$Mutation$TokenAuth extends JsonSerializable
    with EquatableMixin {
  TokenAuth$Mutation$TokenAuth();

  factory TokenAuth$Mutation$TokenAuth.fromJson(Map<String, dynamic> json) =>
      _$TokenAuth$Mutation$TokenAuthFromJson(json);

  late String token;

  late Object payload;

  @JsonKey(name: 'refresh_expires_in')
  late int refreshExpiresIn;

  @override
  List<Object?> get props => [token, payload, refreshExpiresIn];

  @override
  Map<String, dynamic> toJson() => _$TokenAuth$Mutation$TokenAuthToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TokenAuth$Mutation extends JsonSerializable with EquatableMixin {
  TokenAuth$Mutation();

  factory TokenAuth$Mutation.fromJson(Map<String, dynamic> json) =>
      _$TokenAuth$MutationFromJson(json);

  @JsonKey(name: 'token_auth')
  TokenAuth$Mutation$TokenAuth? tokenAuth;

  @override
  List<Object?> get props => [tokenAuth];

  @override
  Map<String, dynamic> toJson() => _$TokenAuth$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallets$Query$Wallets$Results extends JsonSerializable
    with EquatableMixin {
  Wallets$Query$Wallets$Results();

  factory Wallets$Query$Wallets$Results.fromJson(Map<String, dynamic> json) =>
      _$Wallets$Query$Wallets$ResultsFromJson(json);

  int? id;

  @JsonKey(name: 'public_key')
  String? publicKey;

  String? name;

  String? emoji;

  String? balance;

  @override
  List<Object?> get props => [id, publicKey, name, emoji, balance];

  @override
  Map<String, dynamic> toJson() => _$Wallets$Query$Wallets$ResultsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallets$Query$Wallets extends JsonSerializable with EquatableMixin {
  Wallets$Query$Wallets();

  factory Wallets$Query$Wallets.fromJson(Map<String, dynamic> json) =>
      _$Wallets$Query$WalletsFromJson(json);

  int? totalCount;

  List<Wallets$Query$Wallets$Results?>? results;

  @override
  List<Object?> get props => [totalCount, results];

  @override
  Map<String, dynamic> toJson() => _$Wallets$Query$WalletsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallets$Query extends JsonSerializable with EquatableMixin {
  Wallets$Query();

  factory Wallets$Query.fromJson(Map<String, dynamic> json) =>
      _$Wallets$QueryFromJson(json);

  Wallets$Query$Wallets? wallets;

  @override
  List<Object?> get props => [wallets];

  @override
  Map<String, dynamic> toJson() => _$Wallets$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WalletsShort$Query$Wallets$Results extends JsonSerializable
    with EquatableMixin {
  WalletsShort$Query$Wallets$Results();

  factory WalletsShort$Query$Wallets$Results.fromJson(
          Map<String, dynamic> json) =>
      _$WalletsShort$Query$Wallets$ResultsFromJson(json);

  int? id;

  @JsonKey(name: 'public_key')
  String? publicKey;

  String? name;

  String? emoji;

  @override
  List<Object?> get props => [id, publicKey, name, emoji];

  @override
  Map<String, dynamic> toJson() =>
      _$WalletsShort$Query$Wallets$ResultsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WalletsShort$Query$Wallets extends JsonSerializable with EquatableMixin {
  WalletsShort$Query$Wallets();

  factory WalletsShort$Query$Wallets.fromJson(Map<String, dynamic> json) =>
      _$WalletsShort$Query$WalletsFromJson(json);

  int? totalCount;

  List<WalletsShort$Query$Wallets$Results?>? results;

  @override
  List<Object?> get props => [totalCount, results];

  @override
  Map<String, dynamic> toJson() => _$WalletsShort$Query$WalletsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WalletsShort$Query extends JsonSerializable with EquatableMixin {
  WalletsShort$Query();

  factory WalletsShort$Query.fromJson(Map<String, dynamic> json) =>
      _$WalletsShort$QueryFromJson(json);

  WalletsShort$Query$Wallets? wallets;

  @override
  List<Object?> get props => [wallets];

  @override
  Map<String, dynamic> toJson() => _$WalletsShort$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$Wallet$Assets$Asset extends JsonSerializable
    with EquatableMixin {
  Wallet$Query$Wallet$Assets$Asset();

  factory Wallet$Query$Wallet$Assets$Asset.fromJson(
          Map<String, dynamic> json) =>
      _$Wallet$Query$Wallet$Assets$AssetFromJson(json);

  int? id;

  String? symbol;

  String? image;

  @override
  List<Object?> get props => [id, symbol, image];

  @override
  Map<String, dynamic> toJson() =>
      _$Wallet$Query$Wallet$Assets$AssetToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$Wallet$Assets extends JsonSerializable with EquatableMixin {
  Wallet$Query$Wallet$Assets();

  factory Wallet$Query$Wallet$Assets.fromJson(Map<String, dynamic> json) =>
      _$Wallet$Query$Wallet$AssetsFromJson(json);

  int? id;

  @JsonKey(name: 'asset_type')
  String? assetType;

  String? balance;

  Wallet$Query$Wallet$Assets$Asset? asset;

  @override
  List<Object?> get props => [id, assetType, balance, asset];

  @override
  Map<String, dynamic> toJson() => _$Wallet$Query$Wallet$AssetsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query$Wallet extends JsonSerializable with EquatableMixin {
  Wallet$Query$Wallet();

  factory Wallet$Query$Wallet.fromJson(Map<String, dynamic> json) =>
      _$Wallet$Query$WalletFromJson(json);

  int? id;

  @JsonKey(name: 'public_key')
  String? publicKey;

  String? name;

  String? emoji;

  String? balance;

  List<Wallet$Query$Wallet$Assets?>? assets;

  @override
  List<Object?> get props => [id, publicKey, name, emoji, balance, assets];

  @override
  Map<String, dynamic> toJson() => _$Wallet$Query$WalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Wallet$Query extends JsonSerializable with EquatableMixin {
  Wallet$Query();

  factory Wallet$Query.fromJson(Map<String, dynamic> json) =>
      _$Wallet$QueryFromJson(json);

  Wallet$Query$Wallet? wallet;

  @override
  List<Object?> get props => [wallet];

  @override
  Map<String, dynamic> toJson() => _$Wallet$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateMnemonicWallet$Mutation$CreateMnemonicWallet
    extends JsonSerializable with EquatableMixin {
  CreateMnemonicWallet$Mutation$CreateMnemonicWallet();

  factory CreateMnemonicWallet$Mutation$CreateMnemonicWallet.fromJson(
          Map<String, dynamic> json) =>
      _$CreateMnemonicWallet$Mutation$CreateMnemonicWalletFromJson(json);

  @JsonKey(name: 'mnemonic_phrase')
  String? mnemonicPhrase;

  @override
  List<Object?> get props => [mnemonicPhrase];

  @override
  Map<String, dynamic> toJson() =>
      _$CreateMnemonicWallet$Mutation$CreateMnemonicWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateMnemonicWallet$Mutation extends JsonSerializable
    with EquatableMixin {
  CreateMnemonicWallet$Mutation();

  factory CreateMnemonicWallet$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateMnemonicWallet$MutationFromJson(json);

  @JsonKey(name: 'create_mnemonic_wallet')
  CreateMnemonicWallet$Mutation$CreateMnemonicWallet? createMnemonicWallet;

  @override
  List<Object?> get props => [createMnemonicWallet];

  @override
  Map<String, dynamic> toJson() => _$CreateMnemonicWallet$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateWallet$Mutation$CreateWallet$Wallet extends JsonSerializable
    with EquatableMixin {
  CreateWallet$Mutation$CreateWallet$Wallet();

  factory CreateWallet$Mutation$CreateWallet$Wallet.fromJson(
          Map<String, dynamic> json) =>
      _$CreateWallet$Mutation$CreateWallet$WalletFromJson(json);

  int? id;

  @JsonKey(name: 'public_key')
  String? publicKey;

  @override
  List<Object?> get props => [id, publicKey];

  @override
  Map<String, dynamic> toJson() =>
      _$CreateWallet$Mutation$CreateWallet$WalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateWallet$Mutation$CreateWallet extends JsonSerializable
    with EquatableMixin {
  CreateWallet$Mutation$CreateWallet();

  factory CreateWallet$Mutation$CreateWallet.fromJson(
          Map<String, dynamic> json) =>
      _$CreateWallet$Mutation$CreateWalletFromJson(json);

  CreateWallet$Mutation$CreateWallet$Wallet? wallet;

  @JsonKey(name: 'secret_seed')
  String? secretSeed;

  @JsonKey(name: 'secret_seed_encrypted')
  String? secretSeedEncrypted;

  @override
  List<Object?> get props => [wallet, secretSeed, secretSeedEncrypted];

  @override
  Map<String, dynamic> toJson() =>
      _$CreateWallet$Mutation$CreateWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateWallet$Mutation extends JsonSerializable with EquatableMixin {
  CreateWallet$Mutation();

  factory CreateWallet$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateWallet$MutationFromJson(json);

  @JsonKey(name: 'create_wallet')
  CreateWallet$Mutation$CreateWallet? createWallet;

  @override
  List<Object?> get props => [createWallet];

  @override
  Map<String, dynamic> toJson() => _$CreateWallet$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateWallet$Mutation$UpdateWallet$Wallet extends JsonSerializable
    with EquatableMixin {
  UpdateWallet$Mutation$UpdateWallet$Wallet();

  factory UpdateWallet$Mutation$UpdateWallet$Wallet.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateWallet$Mutation$UpdateWallet$WalletFromJson(json);

  int? id;

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJson() =>
      _$UpdateWallet$Mutation$UpdateWallet$WalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateWallet$Mutation$UpdateWallet extends JsonSerializable
    with EquatableMixin {
  UpdateWallet$Mutation$UpdateWallet();

  factory UpdateWallet$Mutation$UpdateWallet.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateWallet$Mutation$UpdateWalletFromJson(json);

  UpdateWallet$Mutation$UpdateWallet$Wallet? wallet;

  @override
  List<Object?> get props => [wallet];

  @override
  Map<String, dynamic> toJson() =>
      _$UpdateWallet$Mutation$UpdateWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateWallet$Mutation extends JsonSerializable with EquatableMixin {
  UpdateWallet$Mutation();

  factory UpdateWallet$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateWallet$MutationFromJson(json);

  @JsonKey(name: 'update_wallet')
  UpdateWallet$Mutation$UpdateWallet? updateWallet;

  @override
  List<Object?> get props => [updateWallet];

  @override
  Map<String, dynamic> toJson() => _$UpdateWallet$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ImportWallet$Mutation$ImportWallet$Wallet extends JsonSerializable
    with EquatableMixin {
  ImportWallet$Mutation$ImportWallet$Wallet();

  factory ImportWallet$Mutation$ImportWallet$Wallet.fromJson(
          Map<String, dynamic> json) =>
      _$ImportWallet$Mutation$ImportWallet$WalletFromJson(json);

  int? id;

  @JsonKey(name: 'public_key')
  String? publicKey;

  @override
  List<Object?> get props => [id, publicKey];

  @override
  Map<String, dynamic> toJson() =>
      _$ImportWallet$Mutation$ImportWallet$WalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ImportWallet$Mutation$ImportWallet extends JsonSerializable
    with EquatableMixin {
  ImportWallet$Mutation$ImportWallet();

  factory ImportWallet$Mutation$ImportWallet.fromJson(
          Map<String, dynamic> json) =>
      _$ImportWallet$Mutation$ImportWalletFromJson(json);

  ImportWallet$Mutation$ImportWallet$Wallet? wallet;

  @JsonKey(name: 'secret_seed_encrypted')
  String? secretSeedEncrypted;

  @override
  List<Object?> get props => [wallet, secretSeedEncrypted];

  @override
  Map<String, dynamic> toJson() =>
      _$ImportWallet$Mutation$ImportWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ImportWallet$Mutation extends JsonSerializable with EquatableMixin {
  ImportWallet$Mutation();

  factory ImportWallet$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ImportWallet$MutationFromJson(json);

  @JsonKey(name: 'import_wallet')
  ImportWallet$Mutation$ImportWallet? importWallet;

  @override
  List<Object?> get props => [importWallet];

  @override
  Map<String, dynamic> toJson() => _$ImportWallet$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExportWallet$Mutation$ExportWallet$Wallet extends JsonSerializable
    with EquatableMixin {
  ExportWallet$Mutation$ExportWallet$Wallet();

  factory ExportWallet$Mutation$ExportWallet$Wallet.fromJson(
          Map<String, dynamic> json) =>
      _$ExportWallet$Mutation$ExportWallet$WalletFromJson(json);

  int? id;

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJson() =>
      _$ExportWallet$Mutation$ExportWallet$WalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExportWallet$Mutation$ExportWallet extends JsonSerializable
    with EquatableMixin {
  ExportWallet$Mutation$ExportWallet();

  factory ExportWallet$Mutation$ExportWallet.fromJson(
          Map<String, dynamic> json) =>
      _$ExportWallet$Mutation$ExportWalletFromJson(json);

  ExportWallet$Mutation$ExportWallet$Wallet? wallet;

  @JsonKey(name: 'secret_seed')
  String? secretSeed;

  @override
  List<Object?> get props => [wallet, secretSeed];

  @override
  Map<String, dynamic> toJson() =>
      _$ExportWallet$Mutation$ExportWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExportWallet$Mutation extends JsonSerializable with EquatableMixin {
  ExportWallet$Mutation();

  factory ExportWallet$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ExportWallet$MutationFromJson(json);

  @JsonKey(name: 'export_wallet')
  ExportWallet$Mutation$ExportWallet? exportWallet;

  @override
  List<Object?> get props => [exportWallet];

  @override
  Map<String, dynamic> toJson() => _$ExportWallet$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteWallet$Mutation$DeleteWallet extends JsonSerializable
    with EquatableMixin {
  DeleteWallet$Mutation$DeleteWallet();

  factory DeleteWallet$Mutation$DeleteWallet.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteWallet$Mutation$DeleteWalletFromJson(json);

  bool? status;

  @override
  List<Object?> get props => [status];

  @override
  Map<String, dynamic> toJson() =>
      _$DeleteWallet$Mutation$DeleteWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteWallet$Mutation extends JsonSerializable with EquatableMixin {
  DeleteWallet$Mutation();

  factory DeleteWallet$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteWallet$MutationFromJson(json);

  @JsonKey(name: 'delete_wallet')
  DeleteWallet$Mutation$DeleteWallet? deleteWallet;

  @override
  List<Object?> get props => [deleteWallet];

  @override
  Map<String, dynamic> toJson() => _$DeleteWallet$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateWalletAsset$Mutation$CreateWalletAsset extends JsonSerializable
    with EquatableMixin {
  CreateWalletAsset$Mutation$CreateWalletAsset();

  factory CreateWalletAsset$Mutation$CreateWalletAsset.fromJson(
          Map<String, dynamic> json) =>
      _$CreateWalletAsset$Mutation$CreateWalletAssetFromJson(json);

  bool? status;

  @override
  List<Object?> get props => [status];

  @override
  Map<String, dynamic> toJson() =>
      _$CreateWalletAsset$Mutation$CreateWalletAssetToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateWalletAsset$Mutation extends JsonSerializable with EquatableMixin {
  CreateWalletAsset$Mutation();

  factory CreateWalletAsset$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateWalletAsset$MutationFromJson(json);

  @JsonKey(name: 'create_wallet_asset')
  CreateWalletAsset$Mutation$CreateWalletAsset? createWalletAsset;

  @override
  List<Object?> get props => [createWalletAsset];

  @override
  Map<String, dynamic> toJson() => _$CreateWalletAsset$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VerifyToken$Mutation$VerifyToken extends JsonSerializable
    with EquatableMixin {
  VerifyToken$Mutation$VerifyToken();

  factory VerifyToken$Mutation$VerifyToken.fromJson(
          Map<String, dynamic> json) =>
      _$VerifyToken$Mutation$VerifyTokenFromJson(json);

  late Object payload;

  @override
  List<Object?> get props => [payload];

  @override
  Map<String, dynamic> toJson() =>
      _$VerifyToken$Mutation$VerifyTokenToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VerifyToken$Mutation extends JsonSerializable with EquatableMixin {
  VerifyToken$Mutation();

  factory VerifyToken$Mutation.fromJson(Map<String, dynamic> json) =>
      _$VerifyToken$MutationFromJson(json);

  @JsonKey(name: 'verify_token')
  VerifyToken$Mutation$VerifyToken? verifyToken;

  @override
  List<Object?> get props => [verifyToken];

  @override
  Map<String, dynamic> toJson() => _$VerifyToken$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProfilesArguments extends JsonSerializable with EquatableMixin {
  ProfilesArguments({
    this.limit,
    this.offset,
    this.search,
    this.username,
  });

  @override
  factory ProfilesArguments.fromJson(Map<String, dynamic> json) =>
      _$ProfilesArgumentsFromJson(json);

  final int? limit;

  final int? offset;

  final String? search;

  final String? username;

  @override
  List<Object?> get props => [limit, offset, search, username];

  @override
  Map<String, dynamic> toJson() => _$ProfilesArgumentsToJson(this);
}

final PROFILES_QUERY_DOCUMENT_OPERATION_NAME = 'Profiles';
final PROFILES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Profiles'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'search')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'username')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'profiles'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'search'),
            value: VariableNode(name: NameNode(value: 'search')),
          ),
          ArgumentNode(
            name: NameNode(value: 'ordering'),
            value: StringValueNode(
              value: '-id',
              isBlock: false,
            ),
          ),
          ArgumentNode(
            name: NameNode(value: 'user__username'),
            value: VariableNode(name: NameNode(value: 'username')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'results'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'limit'),
                value: VariableNode(name: NameNode(value: 'limit')),
              ),
              ArgumentNode(
                name: NameNode(value: 'offset'),
                value: VariableNode(name: NameNode(value: 'offset')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'country'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'mobile_phone'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'mobile_phone_code'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'exist_wallets'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'is_verified_email'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'is_card_reserved'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'id_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'id_number'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'user'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'username'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'first_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'last_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'main_wallet'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class ProfilesQuery extends GraphQLQuery<Profiles$Query, ProfilesArguments> {
  ProfilesQuery({required this.variables});

  @override
  final DocumentNode document = PROFILES_QUERY_DOCUMENT;

  @override
  final String operationName = PROFILES_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final ProfilesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  Profiles$Query parse(Map<String, dynamic> json) =>
      Profiles$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ProfileArguments extends JsonSerializable with EquatableMixin {
  ProfileArguments({required this.id});

  @override
  factory ProfileArguments.fromJson(Map<String, dynamic> json) =>
      _$ProfileArgumentsFromJson(json);

  late int id;

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJson() => _$ProfileArgumentsToJson(this);
}

final PROFILE_QUERY_DOCUMENT_OPERATION_NAME = 'Profile';
final PROFILE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Profile'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'profile'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'country'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'mobile_phone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'mobile_phone_code'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_card_reserved'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'id_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'id_number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'username'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'first_name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'last_name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'email'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class ProfileQuery extends GraphQLQuery<Profile$Query, ProfileArguments> {
  ProfileQuery({required this.variables});

  @override
  final DocumentNode document = PROFILE_QUERY_DOCUMENT;

  @override
  final String operationName = PROFILE_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final ProfileArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  Profile$Query parse(Map<String, dynamic> json) =>
      Profile$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateProfileArguments extends JsonSerializable with EquatableMixin {
  CreateProfileArguments({
    required this.full_name,
    this.mobile_phone,
    this.mobile_phone_code,
    this.country,
    required this.username,
    required this.password,
    required this.email,
    this.id_type,
    this.id_number,
  });

  @override
  factory CreateProfileArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateProfileArgumentsFromJson(json);

  late String full_name;

  final String? mobile_phone;

  final String? mobile_phone_code;

  final String? country;

  late String username;

  late String password;

  late String email;

  final String? id_type;

  final String? id_number;

  @override
  List<Object?> get props => [
        full_name,
        mobile_phone,
        mobile_phone_code,
        country,
        username,
        password,
        email,
        id_type,
        id_number
      ];

  @override
  Map<String, dynamic> toJson() => _$CreateProfileArgumentsToJson(this);
}

final CREATE_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME = 'createProfile';
final CREATE_PROFILE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'createProfile'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'full_name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mobile_phone')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mobile_phone_code')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'country')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'username')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'password')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id_type')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id_number')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'create_profile'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'full_name'),
            value: VariableNode(name: NameNode(value: 'full_name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'mobile_phone'),
            value: VariableNode(name: NameNode(value: 'mobile_phone')),
          ),
          ArgumentNode(
            name: NameNode(value: 'mobile_phone_code'),
            value: VariableNode(name: NameNode(value: 'mobile_phone_code')),
          ),
          ArgumentNode(
            name: NameNode(value: 'username'),
            value: VariableNode(name: NameNode(value: 'username')),
          ),
          ArgumentNode(
            name: NameNode(value: 'password'),
            value: VariableNode(name: NameNode(value: 'password')),
          ),
          ArgumentNode(
            name: NameNode(value: 'email'),
            value: VariableNode(name: NameNode(value: 'email')),
          ),
          ArgumentNode(
            name: NameNode(value: 'country'),
            value: VariableNode(name: NameNode(value: 'country')),
          ),
          ArgumentNode(
            name: NameNode(value: 'id_type'),
            value: VariableNode(name: NameNode(value: 'id_type')),
          ),
          ArgumentNode(
            name: NameNode(value: 'id_number'),
            value: VariableNode(name: NameNode(value: 'id_number')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'profile'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class CreateProfileMutation
    extends GraphQLQuery<CreateProfile$Mutation, CreateProfileArguments> {
  CreateProfileMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_PROFILE_MUTATION_DOCUMENT;

  @override
  final String operationName = CREATE_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CreateProfileArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  CreateProfile$Mutation parse(Map<String, dynamic> json) =>
      CreateProfile$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileArguments extends JsonSerializable with EquatableMixin {
  UpdateProfileArguments({
    required this.id,
    this.full_name,
    this.mobile_phone,
    this.mobile_phone_code,
    this.country,
    this.pin,
    this.username,
    this.password,
    this.code_onesignal,
    this.email,
    this.is_card_reserved,
    this.id_type,
    this.id_number,
  });

  @override
  factory UpdateProfileArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileArgumentsFromJson(json);

  late int id;

  final String? full_name;

  final String? mobile_phone;

  final String? mobile_phone_code;

  final String? country;

  final String? pin;

  final String? username;

  final String? password;

  final String? code_onesignal;

  final String? email;

  final bool? is_card_reserved;

  final String? id_type;

  final String? id_number;

  @override
  List<Object?> get props => [
        id,
        full_name,
        mobile_phone,
        mobile_phone_code,
        country,
        pin,
        username,
        password,
        code_onesignal,
        email,
        is_card_reserved,
        id_type,
        id_number
      ];

  @override
  Map<String, dynamic> toJson() => _$UpdateProfileArgumentsToJson(this);
}

final UPDATE_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME = 'updateProfile';
final UPDATE_PROFILE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateProfile'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'full_name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mobile_phone')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mobile_phone_code')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'country')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pin')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'username')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'password')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'code_onesignal')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'is_card_reserved')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id_type')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id_number')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_profile'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'full_name'),
            value: VariableNode(name: NameNode(value: 'full_name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'mobile_phone'),
            value: VariableNode(name: NameNode(value: 'mobile_phone')),
          ),
          ArgumentNode(
            name: NameNode(value: 'mobile_phone_code'),
            value: VariableNode(name: NameNode(value: 'mobile_phone_code')),
          ),
          ArgumentNode(
            name: NameNode(value: 'country'),
            value: VariableNode(name: NameNode(value: 'country')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pin'),
            value: VariableNode(name: NameNode(value: 'pin')),
          ),
          ArgumentNode(
            name: NameNode(value: 'username'),
            value: VariableNode(name: NameNode(value: 'username')),
          ),
          ArgumentNode(
            name: NameNode(value: 'password'),
            value: VariableNode(name: NameNode(value: 'password')),
          ),
          ArgumentNode(
            name: NameNode(value: 'code_onesignal'),
            value: VariableNode(name: NameNode(value: 'code_onesignal')),
          ),
          ArgumentNode(
            name: NameNode(value: 'email'),
            value: VariableNode(name: NameNode(value: 'email')),
          ),
          ArgumentNode(
            name: NameNode(value: 'is_card_reserved'),
            value: VariableNode(name: NameNode(value: 'is_card_reserved')),
          ),
          ArgumentNode(
            name: NameNode(value: 'id_type'),
            value: VariableNode(name: NameNode(value: 'id_type')),
          ),
          ArgumentNode(
            name: NameNode(value: 'id_number'),
            value: VariableNode(name: NameNode(value: 'id_number')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'profile'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class UpdateProfileMutation
    extends GraphQLQuery<UpdateProfile$Mutation, UpdateProfileArguments> {
  UpdateProfileMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_PROFILE_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateProfileArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  UpdateProfile$Mutation parse(Map<String, dynamic> json) =>
      UpdateProfile$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class VerifyProfilePinArguments extends JsonSerializable with EquatableMixin {
  VerifyProfilePinArguments({
    required this.id,
    required this.pin,
  });

  @override
  factory VerifyProfilePinArguments.fromJson(Map<String, dynamic> json) =>
      _$VerifyProfilePinArgumentsFromJson(json);

  late int id;

  late String pin;

  @override
  List<Object?> get props => [id, pin];

  @override
  Map<String, dynamic> toJson() => _$VerifyProfilePinArgumentsToJson(this);
}

final VERIFY_PROFILE_PIN_MUTATION_DOCUMENT_OPERATION_NAME = 'verifyProfilePin';
final VERIFY_PROFILE_PIN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'verifyProfilePin'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pin')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'verify_profile_pin'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pin'),
            value: VariableNode(name: NameNode(value: 'pin')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class VerifyProfilePinMutation
    extends GraphQLQuery<VerifyProfilePin$Mutation, VerifyProfilePinArguments> {
  VerifyProfilePinMutation({required this.variables});

  @override
  final DocumentNode document = VERIFY_PROFILE_PIN_MUTATION_DOCUMENT;

  @override
  final String operationName =
      VERIFY_PROFILE_PIN_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final VerifyProfilePinArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  VerifyProfilePin$Mutation parse(Map<String, dynamic> json) =>
      VerifyProfilePin$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetProfileArguments extends JsonSerializable with EquatableMixin {
  GetProfileArguments({required this.token});

  @override
  factory GetProfileArguments.fromJson(Map<String, dynamic> json) =>
      _$GetProfileArgumentsFromJson(json);

  late String token;

  @override
  List<Object?> get props => [token];

  @override
  Map<String, dynamic> toJson() => _$GetProfileArgumentsToJson(this);
}

final GET_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME = 'getProfile';
final GET_PROFILE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'getProfile'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'token')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'get_profile'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'token'),
            value: VariableNode(name: NameNode(value: 'token')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'profile'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'mobile_phone'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'is_card_reserved'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'id_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'id_number'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'token'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'is_for_create'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GetProfileMutation
    extends GraphQLQuery<GetProfile$Mutation, GetProfileArguments> {
  GetProfileMutation({required this.variables});

  @override
  final DocumentNode document = GET_PROFILE_MUTATION_DOCUMENT;

  @override
  final String operationName = GET_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final GetProfileArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  GetProfile$Mutation parse(Map<String, dynamic> json) =>
      GetProfile$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ResetPasswordUserArguments extends JsonSerializable with EquatableMixin {
  ResetPasswordUserArguments({required this.email});

  @override
  factory ResetPasswordUserArguments.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordUserArgumentsFromJson(json);

  late String email;

  @override
  List<Object?> get props => [email];

  @override
  Map<String, dynamic> toJson() => _$ResetPasswordUserArgumentsToJson(this);
}

final RESET_PASSWORD_USER_MUTATION_DOCUMENT_OPERATION_NAME =
    'ResetPasswordUser';
final RESET_PASSWORD_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ResetPasswordUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'reset_password_user'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'email'),
            value: VariableNode(name: NameNode(value: 'email')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class ResetPasswordUserMutation extends GraphQLQuery<ResetPasswordUser$Mutation,
    ResetPasswordUserArguments> {
  ResetPasswordUserMutation({required this.variables});

  @override
  final DocumentNode document = RESET_PASSWORD_USER_MUTATION_DOCUMENT;

  @override
  final String operationName =
      RESET_PASSWORD_USER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final ResetPasswordUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  ResetPasswordUser$Mutation parse(Map<String, dynamic> json) =>
      ResetPasswordUser$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SendEmailPinArguments extends JsonSerializable with EquatableMixin {
  SendEmailPinArguments({required this.id});

  @override
  factory SendEmailPinArguments.fromJson(Map<String, dynamic> json) =>
      _$SendEmailPinArgumentsFromJson(json);

  late int id;

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJson() => _$SendEmailPinArgumentsToJson(this);
}

final SEND_EMAIL_PIN_MUTATION_DOCUMENT_OPERATION_NAME = 'SendEmailPin';
final SEND_EMAIL_PIN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SendEmailPin'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'send_email_pin'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class SendEmailPinMutation
    extends GraphQLQuery<SendEmailPin$Mutation, SendEmailPinArguments> {
  SendEmailPinMutation({required this.variables});

  @override
  final DocumentNode document = SEND_EMAIL_PIN_MUTATION_DOCUMENT;

  @override
  final String operationName = SEND_EMAIL_PIN_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SendEmailPinArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  SendEmailPin$Mutation parse(Map<String, dynamic> json) =>
      SendEmailPin$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class VerifyEmailPinArguments extends JsonSerializable with EquatableMixin {
  VerifyEmailPinArguments({
    required this.id,
    required this.pin,
  });

  @override
  factory VerifyEmailPinArguments.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailPinArgumentsFromJson(json);

  late int id;

  late String pin;

  @override
  List<Object?> get props => [id, pin];

  @override
  Map<String, dynamic> toJson() => _$VerifyEmailPinArgumentsToJson(this);
}

final VERIFY_EMAIL_PIN_MUTATION_DOCUMENT_OPERATION_NAME = 'VerifyEmailPin';
final VERIFY_EMAIL_PIN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'VerifyEmailPin'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pin')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'verify_email_pin'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pin'),
            value: VariableNode(name: NameNode(value: 'pin')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class VerifyEmailPinMutation
    extends GraphQLQuery<VerifyEmailPin$Mutation, VerifyEmailPinArguments> {
  VerifyEmailPinMutation({required this.variables});

  @override
  final DocumentNode document = VERIFY_EMAIL_PIN_MUTATION_DOCUMENT;

  @override
  final String operationName =
      VERIFY_EMAIL_PIN_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final VerifyEmailPinArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  VerifyEmailPin$Mutation parse(Map<String, dynamic> json) =>
      VerifyEmailPin$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AssetsArguments extends JsonSerializable with EquatableMixin {
  AssetsArguments({
    this.limit,
    this.offset,
    this.search,
    this.force_update,
    this.is_recommended,
  });

  @override
  factory AssetsArguments.fromJson(Map<String, dynamic> json) =>
      _$AssetsArgumentsFromJson(json);

  final int? limit;

  final int? offset;

  final String? search;

  final String? force_update;

  final bool? is_recommended;

  @override
  List<Object?> get props =>
      [limit, offset, search, force_update, is_recommended];

  @override
  Map<String, dynamic> toJson() => _$AssetsArgumentsToJson(this);
}

final ASSETS_QUERY_DOCUMENT_OPERATION_NAME = 'Assets';
final ASSETS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Assets'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'search')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'force_update')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'is_recommended')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'assets'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'search'),
            value: VariableNode(name: NameNode(value: 'search')),
          ),
          ArgumentNode(
            name: NameNode(value: 'force_update'),
            value: VariableNode(name: NameNode(value: 'force_update')),
          ),
          ArgumentNode(
            name: NameNode(value: 'ordering'),
            value: StringValueNode(
              value: 'position',
              isBlock: false,
            ),
          ),
          ArgumentNode(
            name: NameNode(value: 'is_recommended'),
            value: VariableNode(name: NameNode(value: 'is_recommended')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'results'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'limit'),
                value: VariableNode(name: NameNode(value: 'limit')),
              ),
              ArgumentNode(
                name: NameNode(value: 'offset'),
                value: VariableNode(name: NameNode(value: 'offset')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'symbol'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'position'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'price24h'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'price_percent24h'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class AssetsQuery extends GraphQLQuery<Assets$Query, AssetsArguments> {
  AssetsQuery({required this.variables});

  @override
  final DocumentNode document = ASSETS_QUERY_DOCUMENT;

  @override
  final String operationName = ASSETS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final AssetsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  Assets$Query parse(Map<String, dynamic> json) => Assets$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateTransactionArguments extends JsonSerializable with EquatableMixin {
  CreateTransactionArguments({
    required this.wallet_id,
    required this.seed_encrypted_key,
    required this.destination_id,
    required this.amount,
    this.memo,
  });

  @override
  factory CreateTransactionArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionArgumentsFromJson(json);

  late int wallet_id;

  late String seed_encrypted_key;

  late String destination_id;

  late String amount;

  final String? memo;

  @override
  List<Object?> get props =>
      [wallet_id, seed_encrypted_key, destination_id, amount, memo];

  @override
  Map<String, dynamic> toJson() => _$CreateTransactionArgumentsToJson(this);
}

final CREATE_TRANSACTION_MUTATION_DOCUMENT_OPERATION_NAME = 'createTransaction';
final CREATE_TRANSACTION_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'createTransaction'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'wallet_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'seed_encrypted_key')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'destination_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'amount')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'memo')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'create_transaction'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'wallet_id'),
            value: VariableNode(name: NameNode(value: 'wallet_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'seed_encrypted_key'),
            value: VariableNode(name: NameNode(value: 'seed_encrypted_key')),
          ),
          ArgumentNode(
            name: NameNode(value: 'destination_id'),
            value: VariableNode(name: NameNode(value: 'destination_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'amount'),
            value: VariableNode(name: NameNode(value: 'amount')),
          ),
          ArgumentNode(
            name: NameNode(value: 'memo'),
            value: VariableNode(name: NameNode(value: 'memo')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class CreateTransactionMutation extends GraphQLQuery<CreateTransaction$Mutation,
    CreateTransactionArguments> {
  CreateTransactionMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_TRANSACTION_MUTATION_DOCUMENT;

  @override
  final String operationName =
      CREATE_TRANSACTION_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CreateTransactionArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  CreateTransaction$Mutation parse(Map<String, dynamic> json) =>
      CreateTransaction$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ConversionsArguments extends JsonSerializable with EquatableMixin {
  ConversionsArguments({
    this.limit,
    this.offset,
    this.search,
    this.force_update,
  });

  @override
  factory ConversionsArguments.fromJson(Map<String, dynamic> json) =>
      _$ConversionsArgumentsFromJson(json);

  final int? limit;

  final int? offset;

  final String? search;

  final String? force_update;

  @override
  List<Object?> get props => [limit, offset, search, force_update];

  @override
  Map<String, dynamic> toJson() => _$ConversionsArgumentsToJson(this);
}

final CONVERSIONS_QUERY_DOCUMENT_OPERATION_NAME = 'Conversions';
final CONVERSIONS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Conversions'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'search')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'force_update')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'conversions'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'search'),
            value: VariableNode(name: NameNode(value: 'search')),
          ),
          ArgumentNode(
            name: NameNode(value: 'ordering'),
            value: StringValueNode(
              value: 'id',
              isBlock: false,
            ),
          ),
          ArgumentNode(
            name: NameNode(value: 'force_update'),
            value: VariableNode(name: NameNode(value: 'force_update')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'results'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'limit'),
                value: VariableNode(name: NameNode(value: 'limit')),
              ),
              ArgumentNode(
                name: NameNode(value: 'offset'),
                value: VariableNode(name: NameNode(value: 'offset')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'symbol'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'quote_name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'quote_symbol'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'quote_price'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'updated_at'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class ConversionsQuery
    extends GraphQLQuery<Conversions$Query, ConversionsArguments> {
  ConversionsQuery({required this.variables});

  @override
  final DocumentNode document = CONVERSIONS_QUERY_DOCUMENT;

  @override
  final String operationName = CONVERSIONS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final ConversionsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  Conversions$Query parse(Map<String, dynamic> json) =>
      Conversions$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateSwapTokenArguments extends JsonSerializable with EquatableMixin {
  CreateSwapTokenArguments({
    required this.wallet_id,
    required this.seed_encrypted_key,
    required this.origin_asset_id,
    required this.destiny_asset_id,
    required this.amount,
  });

  @override
  factory CreateSwapTokenArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateSwapTokenArgumentsFromJson(json);

  late int wallet_id;

  late String seed_encrypted_key;

  late int origin_asset_id;

  late int destiny_asset_id;

  late String amount;

  @override
  List<Object?> get props => [
        wallet_id,
        seed_encrypted_key,
        origin_asset_id,
        destiny_asset_id,
        amount
      ];

  @override
  Map<String, dynamic> toJson() => _$CreateSwapTokenArgumentsToJson(this);
}

final CREATE_SWAP_TOKEN_MUTATION_DOCUMENT_OPERATION_NAME = 'createSwapToken';
final CREATE_SWAP_TOKEN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'createSwapToken'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'wallet_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'seed_encrypted_key')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'origin_asset_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'destiny_asset_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'amount')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'create_swap_token'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'wallet_id'),
            value: VariableNode(name: NameNode(value: 'wallet_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'seed_encrypted_key'),
            value: VariableNode(name: NameNode(value: 'seed_encrypted_key')),
          ),
          ArgumentNode(
            name: NameNode(value: 'origin_asset_id'),
            value: VariableNode(name: NameNode(value: 'origin_asset_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'destiny_asset_id'),
            value: VariableNode(name: NameNode(value: 'destiny_asset_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'amount'),
            value: VariableNode(name: NameNode(value: 'amount')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class CreateSwapTokenMutation
    extends GraphQLQuery<CreateSwapToken$Mutation, CreateSwapTokenArguments> {
  CreateSwapTokenMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_SWAP_TOKEN_MUTATION_DOCUMENT;

  @override
  final String operationName =
      CREATE_SWAP_TOKEN_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CreateSwapTokenArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  CreateSwapToken$Mutation parse(Map<String, dynamic> json) =>
      CreateSwapToken$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class BuildPathStrictSendArguments extends JsonSerializable
    with EquatableMixin {
  BuildPathStrictSendArguments({
    required this.wallet_id,
    required this.origin_asset_id,
    required this.destiny_asset_id,
    required this.amount,
  });

  @override
  factory BuildPathStrictSendArguments.fromJson(Map<String, dynamic> json) =>
      _$BuildPathStrictSendArgumentsFromJson(json);

  late int wallet_id;

  late int origin_asset_id;

  late int destiny_asset_id;

  late String amount;

  @override
  List<Object?> get props =>
      [wallet_id, origin_asset_id, destiny_asset_id, amount];

  @override
  Map<String, dynamic> toJson() => _$BuildPathStrictSendArgumentsToJson(this);
}

final BUILD_PATH_STRICT_SEND_MUTATION_DOCUMENT_OPERATION_NAME =
    'buildPathStrictSend';
final BUILD_PATH_STRICT_SEND_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'buildPathStrictSend'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'wallet_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'origin_asset_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'destiny_asset_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'amount')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'build_path_strict_send'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'wallet_id'),
            value: VariableNode(name: NameNode(value: 'wallet_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'origin_asset_id'),
            value: VariableNode(name: NameNode(value: 'origin_asset_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'destiny_asset_id'),
            value: VariableNode(name: NameNode(value: 'destiny_asset_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'amount'),
            value: VariableNode(name: NameNode(value: 'amount')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'amount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class BuildPathStrictSendMutation extends GraphQLQuery<
    BuildPathStrictSend$Mutation, BuildPathStrictSendArguments> {
  BuildPathStrictSendMutation({required this.variables});

  @override
  final DocumentNode document = BUILD_PATH_STRICT_SEND_MUTATION_DOCUMENT;

  @override
  final String operationName =
      BUILD_PATH_STRICT_SEND_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final BuildPathStrictSendArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  BuildPathStrictSend$Mutation parse(Map<String, dynamic> json) =>
      BuildPathStrictSend$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class TokenAuthArguments extends JsonSerializable with EquatableMixin {
  TokenAuthArguments({
    required this.username,
    required this.password,
  });

  @override
  factory TokenAuthArguments.fromJson(Map<String, dynamic> json) =>
      _$TokenAuthArgumentsFromJson(json);

  late String username;

  late String password;

  @override
  List<Object?> get props => [username, password];

  @override
  Map<String, dynamic> toJson() => _$TokenAuthArgumentsToJson(this);
}

final TOKEN_AUTH_MUTATION_DOCUMENT_OPERATION_NAME = 'TokenAuth';
final TOKEN_AUTH_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'TokenAuth'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'username')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'password')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'token_auth'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'username'),
            value: VariableNode(name: NameNode(value: 'username')),
          ),
          ArgumentNode(
            name: NameNode(value: 'password'),
            value: VariableNode(name: NameNode(value: 'password')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'token'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payload'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'refresh_expires_in'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class TokenAuthMutation
    extends GraphQLQuery<TokenAuth$Mutation, TokenAuthArguments> {
  TokenAuthMutation({required this.variables});

  @override
  final DocumentNode document = TOKEN_AUTH_MUTATION_DOCUMENT;

  @override
  final String operationName = TOKEN_AUTH_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final TokenAuthArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  TokenAuth$Mutation parse(Map<String, dynamic> json) =>
      TokenAuth$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class WalletsArguments extends JsonSerializable with EquatableMixin {
  WalletsArguments({
    this.limit,
    this.offset,
    this.search,
    this.profile_id,
  });

  @override
  factory WalletsArguments.fromJson(Map<String, dynamic> json) =>
      _$WalletsArgumentsFromJson(json);

  final int? limit;

  final int? offset;

  final String? search;

  final double? profile_id;

  @override
  List<Object?> get props => [limit, offset, search, profile_id];

  @override
  Map<String, dynamic> toJson() => _$WalletsArgumentsToJson(this);
}

final WALLETS_QUERY_DOCUMENT_OPERATION_NAME = 'Wallets';
final WALLETS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Wallets'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'search')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'profile_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Decimal'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'wallets'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'search'),
            value: VariableNode(name: NameNode(value: 'search')),
          ),
          ArgumentNode(
            name: NameNode(value: 'profile_id'),
            value: VariableNode(name: NameNode(value: 'profile_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'ordering'),
            value: StringValueNode(
              value: 'id',
              isBlock: false,
            ),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'results'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'limit'),
                value: VariableNode(name: NameNode(value: 'limit')),
              ),
              ArgumentNode(
                name: NameNode(value: 'offset'),
                value: VariableNode(name: NameNode(value: 'offset')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'public_key'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'emoji'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'balance'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class WalletsQuery extends GraphQLQuery<Wallets$Query, WalletsArguments> {
  WalletsQuery({required this.variables});

  @override
  final DocumentNode document = WALLETS_QUERY_DOCUMENT;

  @override
  final String operationName = WALLETS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final WalletsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  Wallets$Query parse(Map<String, dynamic> json) =>
      Wallets$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class WalletsShortArguments extends JsonSerializable with EquatableMixin {
  WalletsShortArguments({
    this.limit,
    this.offset,
    this.search,
    this.profile_id,
  });

  @override
  factory WalletsShortArguments.fromJson(Map<String, dynamic> json) =>
      _$WalletsShortArgumentsFromJson(json);

  final int? limit;

  final int? offset;

  final String? search;

  final double? profile_id;

  @override
  List<Object?> get props => [limit, offset, search, profile_id];

  @override
  Map<String, dynamic> toJson() => _$WalletsShortArgumentsToJson(this);
}

final WALLETS_SHORT_QUERY_DOCUMENT_OPERATION_NAME = 'WalletsShort';
final WALLETS_SHORT_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'WalletsShort'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'search')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'profile_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Decimal'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'wallets'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'search'),
            value: VariableNode(name: NameNode(value: 'search')),
          ),
          ArgumentNode(
            name: NameNode(value: 'profile_id'),
            value: VariableNode(name: NameNode(value: 'profile_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'ordering'),
            value: StringValueNode(
              value: 'id',
              isBlock: false,
            ),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'results'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'limit'),
                value: VariableNode(name: NameNode(value: 'limit')),
              ),
              ArgumentNode(
                name: NameNode(value: 'offset'),
                value: VariableNode(name: NameNode(value: 'offset')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'public_key'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'emoji'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class WalletsShortQuery
    extends GraphQLQuery<WalletsShort$Query, WalletsShortArguments> {
  WalletsShortQuery({required this.variables});

  @override
  final DocumentNode document = WALLETS_SHORT_QUERY_DOCUMENT;

  @override
  final String operationName = WALLETS_SHORT_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final WalletsShortArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  WalletsShort$Query parse(Map<String, dynamic> json) =>
      WalletsShort$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class WalletArguments extends JsonSerializable with EquatableMixin {
  WalletArguments({required this.id});

  @override
  factory WalletArguments.fromJson(Map<String, dynamic> json) =>
      _$WalletArgumentsFromJson(json);

  late int id;

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJson() => _$WalletArgumentsToJson(this);
}

final WALLET_QUERY_DOCUMENT_OPERATION_NAME = 'Wallet';
final WALLET_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Wallet'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'wallet'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'public_key'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'emoji'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'balance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'assets'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'asset_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'balance'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'asset'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'symbol'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'image'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class WalletQuery extends GraphQLQuery<Wallet$Query, WalletArguments> {
  WalletQuery({required this.variables});

  @override
  final DocumentNode document = WALLET_QUERY_DOCUMENT;

  @override
  final String operationName = WALLET_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final WalletArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  Wallet$Query parse(Map<String, dynamic> json) => Wallet$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateMnemonicWalletArguments extends JsonSerializable
    with EquatableMixin {
  CreateMnemonicWalletArguments({required this.profile_id});

  @override
  factory CreateMnemonicWalletArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateMnemonicWalletArgumentsFromJson(json);

  late int profile_id;

  @override
  List<Object?> get props => [profile_id];

  @override
  Map<String, dynamic> toJson() => _$CreateMnemonicWalletArgumentsToJson(this);
}

final CREATE_MNEMONIC_WALLET_MUTATION_DOCUMENT_OPERATION_NAME =
    'CreateMnemonicWallet';
final CREATE_MNEMONIC_WALLET_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateMnemonicWallet'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'profile_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'create_mnemonic_wallet'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'profile_id'),
            value: VariableNode(name: NameNode(value: 'profile_id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'mnemonic_phrase'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class CreateMnemonicWalletMutation extends GraphQLQuery<
    CreateMnemonicWallet$Mutation, CreateMnemonicWalletArguments> {
  CreateMnemonicWalletMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_MNEMONIC_WALLET_MUTATION_DOCUMENT;

  @override
  final String operationName =
      CREATE_MNEMONIC_WALLET_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CreateMnemonicWalletArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  CreateMnemonicWallet$Mutation parse(Map<String, dynamic> json) =>
      CreateMnemonicWallet$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateWalletArguments extends JsonSerializable with EquatableMixin {
  CreateWalletArguments({
    required this.profile_id,
    required this.mnemonic_phrase,
  });

  @override
  factory CreateWalletArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateWalletArgumentsFromJson(json);

  late int profile_id;

  late String mnemonic_phrase;

  @override
  List<Object?> get props => [profile_id, mnemonic_phrase];

  @override
  Map<String, dynamic> toJson() => _$CreateWalletArgumentsToJson(this);
}

final CREATE_WALLET_MUTATION_DOCUMENT_OPERATION_NAME = 'CreateWallet';
final CREATE_WALLET_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateWallet'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'profile_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mnemonic_phrase')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'create_wallet'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'profile_id'),
            value: VariableNode(name: NameNode(value: 'profile_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'mnemonic_phrase'),
            value: VariableNode(name: NameNode(value: 'mnemonic_phrase')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'wallet'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'public_key'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'secret_seed'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'secret_seed_encrypted'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class CreateWalletMutation
    extends GraphQLQuery<CreateWallet$Mutation, CreateWalletArguments> {
  CreateWalletMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_WALLET_MUTATION_DOCUMENT;

  @override
  final String operationName = CREATE_WALLET_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CreateWalletArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  CreateWallet$Mutation parse(Map<String, dynamic> json) =>
      CreateWallet$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateWalletArguments extends JsonSerializable with EquatableMixin {
  UpdateWalletArguments({
    required this.id,
    this.name,
    this.emoji,
  });

  @override
  factory UpdateWalletArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateWalletArgumentsFromJson(json);

  late int id;

  final String? name;

  final String? emoji;

  @override
  List<Object?> get props => [id, name, emoji];

  @override
  Map<String, dynamic> toJson() => _$UpdateWalletArgumentsToJson(this);
}

final UPDATE_WALLET_MUTATION_DOCUMENT_OPERATION_NAME = 'UpdateWallet';
final UPDATE_WALLET_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateWallet'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'emoji')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_wallet'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'emoji'),
            value: VariableNode(name: NameNode(value: 'emoji')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'wallet'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class UpdateWalletMutation
    extends GraphQLQuery<UpdateWallet$Mutation, UpdateWalletArguments> {
  UpdateWalletMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_WALLET_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_WALLET_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateWalletArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  UpdateWallet$Mutation parse(Map<String, dynamic> json) =>
      UpdateWallet$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ImportWalletArguments extends JsonSerializable with EquatableMixin {
  ImportWalletArguments({
    required this.profile_id,
    required this.secret_key,
  });

  @override
  factory ImportWalletArguments.fromJson(Map<String, dynamic> json) =>
      _$ImportWalletArgumentsFromJson(json);

  late int profile_id;

  late String secret_key;

  @override
  List<Object?> get props => [profile_id, secret_key];

  @override
  Map<String, dynamic> toJson() => _$ImportWalletArgumentsToJson(this);
}

final IMPORT_WALLET_MUTATION_DOCUMENT_OPERATION_NAME = 'ImportWallet';
final IMPORT_WALLET_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ImportWallet'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'profile_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'secret_key')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'import_wallet'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'profile_id'),
            value: VariableNode(name: NameNode(value: 'profile_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'secret_key'),
            value: VariableNode(name: NameNode(value: 'secret_key')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'wallet'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'public_key'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'secret_seed_encrypted'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class ImportWalletMutation
    extends GraphQLQuery<ImportWallet$Mutation, ImportWalletArguments> {
  ImportWalletMutation({required this.variables});

  @override
  final DocumentNode document = IMPORT_WALLET_MUTATION_DOCUMENT;

  @override
  final String operationName = IMPORT_WALLET_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final ImportWalletArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  ImportWallet$Mutation parse(Map<String, dynamic> json) =>
      ImportWallet$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ExportWalletArguments extends JsonSerializable with EquatableMixin {
  ExportWalletArguments({
    required this.id,
    required this.seed_encrypted_key,
    required this.phrases,
  });

  @override
  factory ExportWalletArguments.fromJson(Map<String, dynamic> json) =>
      _$ExportWalletArgumentsFromJson(json);

  late int id;

  late String seed_encrypted_key;

  late String phrases;

  @override
  List<Object?> get props => [id, seed_encrypted_key, phrases];

  @override
  Map<String, dynamic> toJson() => _$ExportWalletArgumentsToJson(this);
}

final EXPORT_WALLET_MUTATION_DOCUMENT_OPERATION_NAME = 'ExportWallet';
final EXPORT_WALLET_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ExportWallet'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'seed_encrypted_key')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'phrases')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'export_wallet'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'seed_encrypted_key'),
            value: VariableNode(name: NameNode(value: 'seed_encrypted_key')),
          ),
          ArgumentNode(
            name: NameNode(value: 'phrases'),
            value: VariableNode(name: NameNode(value: 'phrases')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'wallet'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'secret_seed'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class ExportWalletMutation
    extends GraphQLQuery<ExportWallet$Mutation, ExportWalletArguments> {
  ExportWalletMutation({required this.variables});

  @override
  final DocumentNode document = EXPORT_WALLET_MUTATION_DOCUMENT;

  @override
  final String operationName = EXPORT_WALLET_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final ExportWalletArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  ExportWallet$Mutation parse(Map<String, dynamic> json) =>
      ExportWallet$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteWalletArguments extends JsonSerializable with EquatableMixin {
  DeleteWalletArguments({
    required this.wallet_id,
    required this.seed_encrypted_key,
    this.destination_wallet_id,
  });

  @override
  factory DeleteWalletArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteWalletArgumentsFromJson(json);

  late int wallet_id;

  late String seed_encrypted_key;

  final int? destination_wallet_id;

  @override
  List<Object?> get props =>
      [wallet_id, seed_encrypted_key, destination_wallet_id];

  @override
  Map<String, dynamic> toJson() => _$DeleteWalletArgumentsToJson(this);
}

final DELETE_WALLET_MUTATION_DOCUMENT_OPERATION_NAME = 'deleteWallet';
final DELETE_WALLET_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteWallet'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'wallet_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'seed_encrypted_key')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'destination_wallet_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delete_wallet'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'wallet_id'),
            value: VariableNode(name: NameNode(value: 'wallet_id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'seed_encrypted_key'),
            value: VariableNode(name: NameNode(value: 'seed_encrypted_key')),
          ),
          ArgumentNode(
            name: NameNode(value: 'destination_wallet_id'),
            value: VariableNode(name: NameNode(value: 'destination_wallet_id')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class DeleteWalletMutation
    extends GraphQLQuery<DeleteWallet$Mutation, DeleteWalletArguments> {
  DeleteWalletMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_WALLET_MUTATION_DOCUMENT;

  @override
  final String operationName = DELETE_WALLET_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final DeleteWalletArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  DeleteWallet$Mutation parse(Map<String, dynamic> json) =>
      DeleteWallet$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateWalletAssetArguments extends JsonSerializable with EquatableMixin {
  CreateWalletAssetArguments({
    required this.id,
    required this.seed_encrypted_key,
    required this.asset_id,
  });

  @override
  factory CreateWalletAssetArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateWalletAssetArgumentsFromJson(json);

  late int id;

  late String seed_encrypted_key;

  late int asset_id;

  @override
  List<Object?> get props => [id, seed_encrypted_key, asset_id];

  @override
  Map<String, dynamic> toJson() => _$CreateWalletAssetArgumentsToJson(this);
}

final CREATE_WALLET_ASSET_MUTATION_DOCUMENT_OPERATION_NAME =
    'createWalletAsset';
final CREATE_WALLET_ASSET_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'createWalletAsset'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'seed_encrypted_key')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'asset_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'create_wallet_asset'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          ),
          ArgumentNode(
            name: NameNode(value: 'seed_encrypted_key'),
            value: VariableNode(name: NameNode(value: 'seed_encrypted_key')),
          ),
          ArgumentNode(
            name: NameNode(value: 'asset_id'),
            value: VariableNode(name: NameNode(value: 'asset_id')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class CreateWalletAssetMutation extends GraphQLQuery<CreateWalletAsset$Mutation,
    CreateWalletAssetArguments> {
  CreateWalletAssetMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_WALLET_ASSET_MUTATION_DOCUMENT;

  @override
  final String operationName =
      CREATE_WALLET_ASSET_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CreateWalletAssetArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  CreateWalletAsset$Mutation parse(Map<String, dynamic> json) =>
      CreateWalletAsset$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class VerifyTokenArguments extends JsonSerializable with EquatableMixin {
  VerifyTokenArguments({required this.token});

  @override
  factory VerifyTokenArguments.fromJson(Map<String, dynamic> json) =>
      _$VerifyTokenArgumentsFromJson(json);

  late String token;

  @override
  List<Object?> get props => [token];

  @override
  Map<String, dynamic> toJson() => _$VerifyTokenArgumentsToJson(this);
}

final VERIFY_TOKEN_MUTATION_DOCUMENT_OPERATION_NAME = 'VerifyToken';
final VERIFY_TOKEN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'VerifyToken'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'token')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'verify_token'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'token'),
            value: VariableNode(name: NameNode(value: 'token')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'payload'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class VerifyTokenMutation
    extends GraphQLQuery<VerifyToken$Mutation, VerifyTokenArguments> {
  VerifyTokenMutation({required this.variables});

  @override
  final DocumentNode document = VERIFY_TOKEN_MUTATION_DOCUMENT;

  @override
  final String operationName = VERIFY_TOKEN_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final VerifyTokenArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  VerifyToken$Mutation parse(Map<String, dynamic> json) =>
      VerifyToken$Mutation.fromJson(json);
}
