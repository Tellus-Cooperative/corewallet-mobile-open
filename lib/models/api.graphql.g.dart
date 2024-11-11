// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profiles$Query$Profiles$Results$User
    _$Profiles$Query$Profiles$Results$UserFromJson(Map<String, dynamic> json) =>
        Profiles$Query$Profiles$Results$User()
          ..id = (json['id'] as num?)?.toInt()
          ..username = json['username'] as String?
          ..firstName = json['first_name'] as String?
          ..lastName = json['last_name'] as String?
          ..email = json['email'] as String?;

Map<String, dynamic> _$Profiles$Query$Profiles$Results$UserToJson(
        Profiles$Query$Profiles$Results$User instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
    };

Profiles$Query$Profiles$Results$MainWallet
    _$Profiles$Query$Profiles$Results$MainWalletFromJson(
            Map<String, dynamic> json) =>
        Profiles$Query$Profiles$Results$MainWallet()
          ..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$Profiles$Query$Profiles$Results$MainWalletToJson(
        Profiles$Query$Profiles$Results$MainWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

Profiles$Query$Profiles$Results _$Profiles$Query$Profiles$ResultsFromJson(
        Map<String, dynamic> json) =>
    Profiles$Query$Profiles$Results()
      ..id = (json['id'] as num?)?.toInt()
      ..country = json['country'] as String?
      ..mobilePhone = json['mobile_phone'] as String?
      ..mobilePhoneCode = json['mobile_phone_code'] as String?
      ..existWallets = json['exist_wallets'] as bool?
      ..isVerifiedEmail = json['is_verified_email'] as bool?
      ..isCardReserved = json['is_card_reserved'] as bool?
      ..idType = json['id_type'] as String?
      ..idNumber = json['id_number'] as String?
      ..user = json['user'] == null
          ? null
          : Profiles$Query$Profiles$Results$User.fromJson(
              json['user'] as Map<String, dynamic>)
      ..mainWallet = json['main_wallet'] == null
          ? null
          : Profiles$Query$Profiles$Results$MainWallet.fromJson(
              json['main_wallet'] as Map<String, dynamic>);

Map<String, dynamic> _$Profiles$Query$Profiles$ResultsToJson(
        Profiles$Query$Profiles$Results instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'mobile_phone': instance.mobilePhone,
      'mobile_phone_code': instance.mobilePhoneCode,
      'exist_wallets': instance.existWallets,
      'is_verified_email': instance.isVerifiedEmail,
      'is_card_reserved': instance.isCardReserved,
      'id_type': instance.idType,
      'id_number': instance.idNumber,
      'user': instance.user?.toJson(),
      'main_wallet': instance.mainWallet?.toJson(),
    };

Profiles$Query$Profiles _$Profiles$Query$ProfilesFromJson(
        Map<String, dynamic> json) =>
    Profiles$Query$Profiles()
      ..totalCount = (json['totalCount'] as num?)?.toInt()
      ..results = (json['results'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Profiles$Query$Profiles$Results.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Profiles$Query$ProfilesToJson(
        Profiles$Query$Profiles instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
    };

Profiles$Query _$Profiles$QueryFromJson(Map<String, dynamic> json) =>
    Profiles$Query()
      ..profiles = json['profiles'] == null
          ? null
          : Profiles$Query$Profiles.fromJson(
              json['profiles'] as Map<String, dynamic>);

Map<String, dynamic> _$Profiles$QueryToJson(Profiles$Query instance) =>
    <String, dynamic>{
      'profiles': instance.profiles?.toJson(),
    };

Profile$Query$Profile$User _$Profile$Query$Profile$UserFromJson(
        Map<String, dynamic> json) =>
    Profile$Query$Profile$User()
      ..id = (json['id'] as num?)?.toInt()
      ..username = json['username'] as String?
      ..firstName = json['first_name'] as String?
      ..lastName = json['last_name'] as String?
      ..email = json['email'] as String?;

Map<String, dynamic> _$Profile$Query$Profile$UserToJson(
        Profile$Query$Profile$User instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
    };

Profile$Query$Profile _$Profile$Query$ProfileFromJson(
        Map<String, dynamic> json) =>
    Profile$Query$Profile()
      ..id = (json['id'] as num?)?.toInt()
      ..country = json['country'] as String?
      ..mobilePhone = json['mobile_phone'] as String?
      ..mobilePhoneCode = json['mobile_phone_code'] as String?
      ..isCardReserved = json['is_card_reserved'] as bool?
      ..idType = json['id_type'] as String?
      ..idNumber = json['id_number'] as String?
      ..user = json['user'] == null
          ? null
          : Profile$Query$Profile$User.fromJson(
              json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$Profile$Query$ProfileToJson(
        Profile$Query$Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'mobile_phone': instance.mobilePhone,
      'mobile_phone_code': instance.mobilePhoneCode,
      'is_card_reserved': instance.isCardReserved,
      'id_type': instance.idType,
      'id_number': instance.idNumber,
      'user': instance.user?.toJson(),
    };

Profile$Query _$Profile$QueryFromJson(Map<String, dynamic> json) =>
    Profile$Query()
      ..profile = json['profile'] == null
          ? null
          : Profile$Query$Profile.fromJson(
              json['profile'] as Map<String, dynamic>);

Map<String, dynamic> _$Profile$QueryToJson(Profile$Query instance) =>
    <String, dynamic>{
      'profile': instance.profile?.toJson(),
    };

CreateProfile$Mutation$CreateProfile$Profile
    _$CreateProfile$Mutation$CreateProfile$ProfileFromJson(
            Map<String, dynamic> json) =>
        CreateProfile$Mutation$CreateProfile$Profile()
          ..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$CreateProfile$Mutation$CreateProfile$ProfileToJson(
        CreateProfile$Mutation$CreateProfile$Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateProfile$Mutation$CreateProfile
    _$CreateProfile$Mutation$CreateProfileFromJson(Map<String, dynamic> json) =>
        CreateProfile$Mutation$CreateProfile()
          ..profile = json['profile'] == null
              ? null
              : CreateProfile$Mutation$CreateProfile$Profile.fromJson(
                  json['profile'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateProfile$Mutation$CreateProfileToJson(
        CreateProfile$Mutation$CreateProfile instance) =>
    <String, dynamic>{
      'profile': instance.profile?.toJson(),
    };

CreateProfile$Mutation _$CreateProfile$MutationFromJson(
        Map<String, dynamic> json) =>
    CreateProfile$Mutation()
      ..createProfile = json['create_profile'] == null
          ? null
          : CreateProfile$Mutation$CreateProfile.fromJson(
              json['create_profile'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateProfile$MutationToJson(
        CreateProfile$Mutation instance) =>
    <String, dynamic>{
      'create_profile': instance.createProfile?.toJson(),
    };

UpdateProfile$Mutation$UpdateProfile$Profile
    _$UpdateProfile$Mutation$UpdateProfile$ProfileFromJson(
            Map<String, dynamic> json) =>
        UpdateProfile$Mutation$UpdateProfile$Profile()
          ..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$UpdateProfile$Mutation$UpdateProfile$ProfileToJson(
        UpdateProfile$Mutation$UpdateProfile$Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateProfile$Mutation$UpdateProfile
    _$UpdateProfile$Mutation$UpdateProfileFromJson(Map<String, dynamic> json) =>
        UpdateProfile$Mutation$UpdateProfile()
          ..profile = json['profile'] == null
              ? null
              : UpdateProfile$Mutation$UpdateProfile$Profile.fromJson(
                  json['profile'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateProfile$Mutation$UpdateProfileToJson(
        UpdateProfile$Mutation$UpdateProfile instance) =>
    <String, dynamic>{
      'profile': instance.profile?.toJson(),
    };

UpdateProfile$Mutation _$UpdateProfile$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateProfile$Mutation()
      ..updateProfile = json['update_profile'] == null
          ? null
          : UpdateProfile$Mutation$UpdateProfile.fromJson(
              json['update_profile'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateProfile$MutationToJson(
        UpdateProfile$Mutation instance) =>
    <String, dynamic>{
      'update_profile': instance.updateProfile?.toJson(),
    };

VerifyProfilePin$Mutation$VerifyProfilePin
    _$VerifyProfilePin$Mutation$VerifyProfilePinFromJson(
            Map<String, dynamic> json) =>
        VerifyProfilePin$Mutation$VerifyProfilePin()
          ..status = json['status'] as bool?;

Map<String, dynamic> _$VerifyProfilePin$Mutation$VerifyProfilePinToJson(
        VerifyProfilePin$Mutation$VerifyProfilePin instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

VerifyProfilePin$Mutation _$VerifyProfilePin$MutationFromJson(
        Map<String, dynamic> json) =>
    VerifyProfilePin$Mutation()
      ..verifyProfilePin = json['verify_profile_pin'] == null
          ? null
          : VerifyProfilePin$Mutation$VerifyProfilePin.fromJson(
              json['verify_profile_pin'] as Map<String, dynamic>);

Map<String, dynamic> _$VerifyProfilePin$MutationToJson(
        VerifyProfilePin$Mutation instance) =>
    <String, dynamic>{
      'verify_profile_pin': instance.verifyProfilePin?.toJson(),
    };

GetProfile$Mutation$GetProfile$Profile
    _$GetProfile$Mutation$GetProfile$ProfileFromJson(
            Map<String, dynamic> json) =>
        GetProfile$Mutation$GetProfile$Profile()
          ..id = (json['id'] as num?)?.toInt()
          ..mobilePhone = json['mobile_phone'] as String?
          ..isCardReserved = json['is_card_reserved'] as bool?
          ..idType = json['id_type'] as String?
          ..idNumber = json['id_number'] as String?;

Map<String, dynamic> _$GetProfile$Mutation$GetProfile$ProfileToJson(
        GetProfile$Mutation$GetProfile$Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mobile_phone': instance.mobilePhone,
      'is_card_reserved': instance.isCardReserved,
      'id_type': instance.idType,
      'id_number': instance.idNumber,
    };

GetProfile$Mutation$GetProfile _$GetProfile$Mutation$GetProfileFromJson(
        Map<String, dynamic> json) =>
    GetProfile$Mutation$GetProfile()
      ..profile = json['profile'] == null
          ? null
          : GetProfile$Mutation$GetProfile$Profile.fromJson(
              json['profile'] as Map<String, dynamic>)
      ..token = json['token'] as String?
      ..message = json['message'] as String?
      ..isForCreate = json['is_for_create'] as bool?;

Map<String, dynamic> _$GetProfile$Mutation$GetProfileToJson(
        GetProfile$Mutation$GetProfile instance) =>
    <String, dynamic>{
      'profile': instance.profile?.toJson(),
      'token': instance.token,
      'message': instance.message,
      'is_for_create': instance.isForCreate,
    };

GetProfile$Mutation _$GetProfile$MutationFromJson(Map<String, dynamic> json) =>
    GetProfile$Mutation()
      ..getProfile = json['get_profile'] == null
          ? null
          : GetProfile$Mutation$GetProfile.fromJson(
              json['get_profile'] as Map<String, dynamic>);

Map<String, dynamic> _$GetProfile$MutationToJson(
        GetProfile$Mutation instance) =>
    <String, dynamic>{
      'get_profile': instance.getProfile?.toJson(),
    };

ResetPasswordUser$Mutation$ResetPasswordUser
    _$ResetPasswordUser$Mutation$ResetPasswordUserFromJson(
            Map<String, dynamic> json) =>
        ResetPasswordUser$Mutation$ResetPasswordUser()
          ..status = json['status'] as bool?;

Map<String, dynamic> _$ResetPasswordUser$Mutation$ResetPasswordUserToJson(
        ResetPasswordUser$Mutation$ResetPasswordUser instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

ResetPasswordUser$Mutation _$ResetPasswordUser$MutationFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordUser$Mutation()
      ..resetPasswordUser = json['reset_password_user'] == null
          ? null
          : ResetPasswordUser$Mutation$ResetPasswordUser.fromJson(
              json['reset_password_user'] as Map<String, dynamic>);

Map<String, dynamic> _$ResetPasswordUser$MutationToJson(
        ResetPasswordUser$Mutation instance) =>
    <String, dynamic>{
      'reset_password_user': instance.resetPasswordUser?.toJson(),
    };

SendEmailPin$Mutation$SendEmailPin _$SendEmailPin$Mutation$SendEmailPinFromJson(
        Map<String, dynamic> json) =>
    SendEmailPin$Mutation$SendEmailPin()..status = json['status'] as bool?;

Map<String, dynamic> _$SendEmailPin$Mutation$SendEmailPinToJson(
        SendEmailPin$Mutation$SendEmailPin instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

SendEmailPin$Mutation _$SendEmailPin$MutationFromJson(
        Map<String, dynamic> json) =>
    SendEmailPin$Mutation()
      ..sendEmailPin = json['send_email_pin'] == null
          ? null
          : SendEmailPin$Mutation$SendEmailPin.fromJson(
              json['send_email_pin'] as Map<String, dynamic>);

Map<String, dynamic> _$SendEmailPin$MutationToJson(
        SendEmailPin$Mutation instance) =>
    <String, dynamic>{
      'send_email_pin': instance.sendEmailPin?.toJson(),
    };

VerifyEmailPin$Mutation$VerifyEmailPin
    _$VerifyEmailPin$Mutation$VerifyEmailPinFromJson(
            Map<String, dynamic> json) =>
        VerifyEmailPin$Mutation$VerifyEmailPin()
          ..status = json['status'] as bool?;

Map<String, dynamic> _$VerifyEmailPin$Mutation$VerifyEmailPinToJson(
        VerifyEmailPin$Mutation$VerifyEmailPin instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

VerifyEmailPin$Mutation _$VerifyEmailPin$MutationFromJson(
        Map<String, dynamic> json) =>
    VerifyEmailPin$Mutation()
      ..verifyEmailPin = json['verify_email_pin'] == null
          ? null
          : VerifyEmailPin$Mutation$VerifyEmailPin.fromJson(
              json['verify_email_pin'] as Map<String, dynamic>);

Map<String, dynamic> _$VerifyEmailPin$MutationToJson(
        VerifyEmailPin$Mutation instance) =>
    <String, dynamic>{
      'verify_email_pin': instance.verifyEmailPin?.toJson(),
    };

Assets$Query$Assets$Results _$Assets$Query$Assets$ResultsFromJson(
        Map<String, dynamic> json) =>
    Assets$Query$Assets$Results()
      ..id = (json['id'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..symbol = json['symbol'] as String?
      ..position = (json['position'] as num?)?.toInt()
      ..price24h = json['price24h'] as String?
      ..pricePercent24h = json['price_percent24h'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$Assets$Query$Assets$ResultsToJson(
        Assets$Query$Assets$Results instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'position': instance.position,
      'price24h': instance.price24h,
      'price_percent24h': instance.pricePercent24h,
      'image': instance.image,
    };

Assets$Query$Assets _$Assets$Query$AssetsFromJson(Map<String, dynamic> json) =>
    Assets$Query$Assets()
      ..totalCount = (json['totalCount'] as num?)?.toInt()
      ..results = (json['results'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Assets$Query$Assets$Results.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Assets$Query$AssetsToJson(
        Assets$Query$Assets instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
    };

Assets$Query _$Assets$QueryFromJson(Map<String, dynamic> json) => Assets$Query()
  ..assets = json['assets'] == null
      ? null
      : Assets$Query$Assets.fromJson(json['assets'] as Map<String, dynamic>);

Map<String, dynamic> _$Assets$QueryToJson(Assets$Query instance) =>
    <String, dynamic>{
      'assets': instance.assets?.toJson(),
    };

CreateTransaction$Mutation$CreateTransaction
    _$CreateTransaction$Mutation$CreateTransactionFromJson(
            Map<String, dynamic> json) =>
        CreateTransaction$Mutation$CreateTransaction()
          ..status = json['status'] as bool?;

Map<String, dynamic> _$CreateTransaction$Mutation$CreateTransactionToJson(
        CreateTransaction$Mutation$CreateTransaction instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

CreateTransaction$Mutation _$CreateTransaction$MutationFromJson(
        Map<String, dynamic> json) =>
    CreateTransaction$Mutation()
      ..createTransaction = json['create_transaction'] == null
          ? null
          : CreateTransaction$Mutation$CreateTransaction.fromJson(
              json['create_transaction'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateTransaction$MutationToJson(
        CreateTransaction$Mutation instance) =>
    <String, dynamic>{
      'create_transaction': instance.createTransaction?.toJson(),
    };

Conversions$Query$Conversions$Results
    _$Conversions$Query$Conversions$ResultsFromJson(
            Map<String, dynamic> json) =>
        Conversions$Query$Conversions$Results()
          ..id = (json['id'] as num?)?.toInt()
          ..name = json['name'] as String?
          ..symbol = json['symbol'] as String?
          ..quoteName = json['quote_name'] as String?
          ..quoteSymbol = json['quote_symbol'] as String?
          ..quotePrice = (json['quote_price'] as num?)?.toDouble()
          ..updatedAt = json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String);

Map<String, dynamic> _$Conversions$Query$Conversions$ResultsToJson(
        Conversions$Query$Conversions$Results instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'quote_name': instance.quoteName,
      'quote_symbol': instance.quoteSymbol,
      'quote_price': instance.quotePrice,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

Conversions$Query$Conversions _$Conversions$Query$ConversionsFromJson(
        Map<String, dynamic> json) =>
    Conversions$Query$Conversions()
      ..totalCount = (json['totalCount'] as num?)?.toInt()
      ..results = (json['results'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Conversions$Query$Conversions$Results.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Conversions$Query$ConversionsToJson(
        Conversions$Query$Conversions instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
    };

Conversions$Query _$Conversions$QueryFromJson(Map<String, dynamic> json) =>
    Conversions$Query()
      ..conversions = json['conversions'] == null
          ? null
          : Conversions$Query$Conversions.fromJson(
              json['conversions'] as Map<String, dynamic>);

Map<String, dynamic> _$Conversions$QueryToJson(Conversions$Query instance) =>
    <String, dynamic>{
      'conversions': instance.conversions?.toJson(),
    };

CreateSwapToken$Mutation$CreateSwapToken
    _$CreateSwapToken$Mutation$CreateSwapTokenFromJson(
            Map<String, dynamic> json) =>
        CreateSwapToken$Mutation$CreateSwapToken()
          ..status = json['status'] as bool?;

Map<String, dynamic> _$CreateSwapToken$Mutation$CreateSwapTokenToJson(
        CreateSwapToken$Mutation$CreateSwapToken instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

CreateSwapToken$Mutation _$CreateSwapToken$MutationFromJson(
        Map<String, dynamic> json) =>
    CreateSwapToken$Mutation()
      ..createSwapToken = json['create_swap_token'] == null
          ? null
          : CreateSwapToken$Mutation$CreateSwapToken.fromJson(
              json['create_swap_token'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateSwapToken$MutationToJson(
        CreateSwapToken$Mutation instance) =>
    <String, dynamic>{
      'create_swap_token': instance.createSwapToken?.toJson(),
    };

BuildPathStrictSend$Mutation$BuildPathStrictSend
    _$BuildPathStrictSend$Mutation$BuildPathStrictSendFromJson(
            Map<String, dynamic> json) =>
        BuildPathStrictSend$Mutation$BuildPathStrictSend()
          ..amount = json['amount'] as String?;

Map<String, dynamic> _$BuildPathStrictSend$Mutation$BuildPathStrictSendToJson(
        BuildPathStrictSend$Mutation$BuildPathStrictSend instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };

BuildPathStrictSend$Mutation _$BuildPathStrictSend$MutationFromJson(
        Map<String, dynamic> json) =>
    BuildPathStrictSend$Mutation()
      ..buildPathStrictSend = json['build_path_strict_send'] == null
          ? null
          : BuildPathStrictSend$Mutation$BuildPathStrictSend.fromJson(
              json['build_path_strict_send'] as Map<String, dynamic>);

Map<String, dynamic> _$BuildPathStrictSend$MutationToJson(
        BuildPathStrictSend$Mutation instance) =>
    <String, dynamic>{
      'build_path_strict_send': instance.buildPathStrictSend?.toJson(),
    };

TokenAuth$Mutation$TokenAuth _$TokenAuth$Mutation$TokenAuthFromJson(
        Map<String, dynamic> json) =>
    TokenAuth$Mutation$TokenAuth()
      ..token = json['token'] as String
      ..payload = json['payload'] as Object
      ..refreshExpiresIn = (json['refresh_expires_in'] as num).toInt();

Map<String, dynamic> _$TokenAuth$Mutation$TokenAuthToJson(
        TokenAuth$Mutation$TokenAuth instance) =>
    <String, dynamic>{
      'token': instance.token,
      'payload': instance.payload,
      'refresh_expires_in': instance.refreshExpiresIn,
    };

TokenAuth$Mutation _$TokenAuth$MutationFromJson(Map<String, dynamic> json) =>
    TokenAuth$Mutation()
      ..tokenAuth = json['token_auth'] == null
          ? null
          : TokenAuth$Mutation$TokenAuth.fromJson(
              json['token_auth'] as Map<String, dynamic>);

Map<String, dynamic> _$TokenAuth$MutationToJson(TokenAuth$Mutation instance) =>
    <String, dynamic>{
      'token_auth': instance.tokenAuth?.toJson(),
    };

Wallets$Query$Wallets$Results _$Wallets$Query$Wallets$ResultsFromJson(
        Map<String, dynamic> json) =>
    Wallets$Query$Wallets$Results()
      ..id = (json['id'] as num?)?.toInt()
      ..publicKey = json['public_key'] as String?
      ..name = json['name'] as String?
      ..emoji = json['emoji'] as String?
      ..balance = json['balance'] as String?;

Map<String, dynamic> _$Wallets$Query$Wallets$ResultsToJson(
        Wallets$Query$Wallets$Results instance) =>
    <String, dynamic>{
      'id': instance.id,
      'public_key': instance.publicKey,
      'name': instance.name,
      'emoji': instance.emoji,
      'balance': instance.balance,
    };

Wallets$Query$Wallets _$Wallets$Query$WalletsFromJson(
        Map<String, dynamic> json) =>
    Wallets$Query$Wallets()
      ..totalCount = (json['totalCount'] as num?)?.toInt()
      ..results = (json['results'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Wallets$Query$Wallets$Results.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Wallets$Query$WalletsToJson(
        Wallets$Query$Wallets instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
    };

Wallets$Query _$Wallets$QueryFromJson(Map<String, dynamic> json) =>
    Wallets$Query()
      ..wallets = json['wallets'] == null
          ? null
          : Wallets$Query$Wallets.fromJson(
              json['wallets'] as Map<String, dynamic>);

Map<String, dynamic> _$Wallets$QueryToJson(Wallets$Query instance) =>
    <String, dynamic>{
      'wallets': instance.wallets?.toJson(),
    };

WalletsShort$Query$Wallets$Results _$WalletsShort$Query$Wallets$ResultsFromJson(
        Map<String, dynamic> json) =>
    WalletsShort$Query$Wallets$Results()
      ..id = (json['id'] as num?)?.toInt()
      ..publicKey = json['public_key'] as String?
      ..name = json['name'] as String?
      ..emoji = json['emoji'] as String?;

Map<String, dynamic> _$WalletsShort$Query$Wallets$ResultsToJson(
        WalletsShort$Query$Wallets$Results instance) =>
    <String, dynamic>{
      'id': instance.id,
      'public_key': instance.publicKey,
      'name': instance.name,
      'emoji': instance.emoji,
    };

WalletsShort$Query$Wallets _$WalletsShort$Query$WalletsFromJson(
        Map<String, dynamic> json) =>
    WalletsShort$Query$Wallets()
      ..totalCount = (json['totalCount'] as num?)?.toInt()
      ..results = (json['results'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : WalletsShort$Query$Wallets$Results.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$WalletsShort$Query$WalletsToJson(
        WalletsShort$Query$Wallets instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'results': instance.results?.map((e) => e?.toJson()).toList(),
    };

WalletsShort$Query _$WalletsShort$QueryFromJson(Map<String, dynamic> json) =>
    WalletsShort$Query()
      ..wallets = json['wallets'] == null
          ? null
          : WalletsShort$Query$Wallets.fromJson(
              json['wallets'] as Map<String, dynamic>);

Map<String, dynamic> _$WalletsShort$QueryToJson(WalletsShort$Query instance) =>
    <String, dynamic>{
      'wallets': instance.wallets?.toJson(),
    };

Wallet$Query$Wallet$Assets$Asset _$Wallet$Query$Wallet$Assets$AssetFromJson(
        Map<String, dynamic> json) =>
    Wallet$Query$Wallet$Assets$Asset()
      ..id = (json['id'] as num?)?.toInt()
      ..symbol = json['symbol'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$Wallet$Query$Wallet$Assets$AssetToJson(
        Wallet$Query$Wallet$Assets$Asset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'image': instance.image,
    };

Wallet$Query$Wallet$Assets _$Wallet$Query$Wallet$AssetsFromJson(
        Map<String, dynamic> json) =>
    Wallet$Query$Wallet$Assets()
      ..id = (json['id'] as num?)?.toInt()
      ..assetType = json['asset_type'] as String?
      ..balance = json['balance'] as String?
      ..asset = json['asset'] == null
          ? null
          : Wallet$Query$Wallet$Assets$Asset.fromJson(
              json['asset'] as Map<String, dynamic>);

Map<String, dynamic> _$Wallet$Query$Wallet$AssetsToJson(
        Wallet$Query$Wallet$Assets instance) =>
    <String, dynamic>{
      'id': instance.id,
      'asset_type': instance.assetType,
      'balance': instance.balance,
      'asset': instance.asset?.toJson(),
    };

Wallet$Query$Wallet _$Wallet$Query$WalletFromJson(Map<String, dynamic> json) =>
    Wallet$Query$Wallet()
      ..id = (json['id'] as num?)?.toInt()
      ..publicKey = json['public_key'] as String?
      ..name = json['name'] as String?
      ..emoji = json['emoji'] as String?
      ..balance = json['balance'] as String?
      ..assets = (json['assets'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Wallet$Query$Wallet$Assets.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Wallet$Query$WalletToJson(
        Wallet$Query$Wallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'public_key': instance.publicKey,
      'name': instance.name,
      'emoji': instance.emoji,
      'balance': instance.balance,
      'assets': instance.assets?.map((e) => e?.toJson()).toList(),
    };

Wallet$Query _$Wallet$QueryFromJson(Map<String, dynamic> json) => Wallet$Query()
  ..wallet = json['wallet'] == null
      ? null
      : Wallet$Query$Wallet.fromJson(json['wallet'] as Map<String, dynamic>);

Map<String, dynamic> _$Wallet$QueryToJson(Wallet$Query instance) =>
    <String, dynamic>{
      'wallet': instance.wallet?.toJson(),
    };

CreateMnemonicWallet$Mutation$CreateMnemonicWallet
    _$CreateMnemonicWallet$Mutation$CreateMnemonicWalletFromJson(
            Map<String, dynamic> json) =>
        CreateMnemonicWallet$Mutation$CreateMnemonicWallet()
          ..mnemonicPhrase = json['mnemonic_phrase'] as String?;

Map<String, dynamic> _$CreateMnemonicWallet$Mutation$CreateMnemonicWalletToJson(
        CreateMnemonicWallet$Mutation$CreateMnemonicWallet instance) =>
    <String, dynamic>{
      'mnemonic_phrase': instance.mnemonicPhrase,
    };

CreateMnemonicWallet$Mutation _$CreateMnemonicWallet$MutationFromJson(
        Map<String, dynamic> json) =>
    CreateMnemonicWallet$Mutation()
      ..createMnemonicWallet = json['create_mnemonic_wallet'] == null
          ? null
          : CreateMnemonicWallet$Mutation$CreateMnemonicWallet.fromJson(
              json['create_mnemonic_wallet'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateMnemonicWallet$MutationToJson(
        CreateMnemonicWallet$Mutation instance) =>
    <String, dynamic>{
      'create_mnemonic_wallet': instance.createMnemonicWallet?.toJson(),
    };

CreateWallet$Mutation$CreateWallet$Wallet
    _$CreateWallet$Mutation$CreateWallet$WalletFromJson(
            Map<String, dynamic> json) =>
        CreateWallet$Mutation$CreateWallet$Wallet()
          ..id = (json['id'] as num?)?.toInt()
          ..publicKey = json['public_key'] as String?;

Map<String, dynamic> _$CreateWallet$Mutation$CreateWallet$WalletToJson(
        CreateWallet$Mutation$CreateWallet$Wallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'public_key': instance.publicKey,
    };

CreateWallet$Mutation$CreateWallet _$CreateWallet$Mutation$CreateWalletFromJson(
        Map<String, dynamic> json) =>
    CreateWallet$Mutation$CreateWallet()
      ..wallet = json['wallet'] == null
          ? null
          : CreateWallet$Mutation$CreateWallet$Wallet.fromJson(
              json['wallet'] as Map<String, dynamic>)
      ..secretSeed = json['secret_seed'] as String?
      ..secretSeedEncrypted = json['secret_seed_encrypted'] as String?;

Map<String, dynamic> _$CreateWallet$Mutation$CreateWalletToJson(
        CreateWallet$Mutation$CreateWallet instance) =>
    <String, dynamic>{
      'wallet': instance.wallet?.toJson(),
      'secret_seed': instance.secretSeed,
      'secret_seed_encrypted': instance.secretSeedEncrypted,
    };

CreateWallet$Mutation _$CreateWallet$MutationFromJson(
        Map<String, dynamic> json) =>
    CreateWallet$Mutation()
      ..createWallet = json['create_wallet'] == null
          ? null
          : CreateWallet$Mutation$CreateWallet.fromJson(
              json['create_wallet'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateWallet$MutationToJson(
        CreateWallet$Mutation instance) =>
    <String, dynamic>{
      'create_wallet': instance.createWallet?.toJson(),
    };

UpdateWallet$Mutation$UpdateWallet$Wallet
    _$UpdateWallet$Mutation$UpdateWallet$WalletFromJson(
            Map<String, dynamic> json) =>
        UpdateWallet$Mutation$UpdateWallet$Wallet()
          ..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$UpdateWallet$Mutation$UpdateWallet$WalletToJson(
        UpdateWallet$Mutation$UpdateWallet$Wallet instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateWallet$Mutation$UpdateWallet _$UpdateWallet$Mutation$UpdateWalletFromJson(
        Map<String, dynamic> json) =>
    UpdateWallet$Mutation$UpdateWallet()
      ..wallet = json['wallet'] == null
          ? null
          : UpdateWallet$Mutation$UpdateWallet$Wallet.fromJson(
              json['wallet'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateWallet$Mutation$UpdateWalletToJson(
        UpdateWallet$Mutation$UpdateWallet instance) =>
    <String, dynamic>{
      'wallet': instance.wallet?.toJson(),
    };

UpdateWallet$Mutation _$UpdateWallet$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateWallet$Mutation()
      ..updateWallet = json['update_wallet'] == null
          ? null
          : UpdateWallet$Mutation$UpdateWallet.fromJson(
              json['update_wallet'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateWallet$MutationToJson(
        UpdateWallet$Mutation instance) =>
    <String, dynamic>{
      'update_wallet': instance.updateWallet?.toJson(),
    };

ImportWallet$Mutation$ImportWallet$Wallet
    _$ImportWallet$Mutation$ImportWallet$WalletFromJson(
            Map<String, dynamic> json) =>
        ImportWallet$Mutation$ImportWallet$Wallet()
          ..id = (json['id'] as num?)?.toInt()
          ..publicKey = json['public_key'] as String?;

Map<String, dynamic> _$ImportWallet$Mutation$ImportWallet$WalletToJson(
        ImportWallet$Mutation$ImportWallet$Wallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'public_key': instance.publicKey,
    };

ImportWallet$Mutation$ImportWallet _$ImportWallet$Mutation$ImportWalletFromJson(
        Map<String, dynamic> json) =>
    ImportWallet$Mutation$ImportWallet()
      ..wallet = json['wallet'] == null
          ? null
          : ImportWallet$Mutation$ImportWallet$Wallet.fromJson(
              json['wallet'] as Map<String, dynamic>)
      ..secretSeedEncrypted = json['secret_seed_encrypted'] as String?;

Map<String, dynamic> _$ImportWallet$Mutation$ImportWalletToJson(
        ImportWallet$Mutation$ImportWallet instance) =>
    <String, dynamic>{
      'wallet': instance.wallet?.toJson(),
      'secret_seed_encrypted': instance.secretSeedEncrypted,
    };

ImportWallet$Mutation _$ImportWallet$MutationFromJson(
        Map<String, dynamic> json) =>
    ImportWallet$Mutation()
      ..importWallet = json['import_wallet'] == null
          ? null
          : ImportWallet$Mutation$ImportWallet.fromJson(
              json['import_wallet'] as Map<String, dynamic>);

Map<String, dynamic> _$ImportWallet$MutationToJson(
        ImportWallet$Mutation instance) =>
    <String, dynamic>{
      'import_wallet': instance.importWallet?.toJson(),
    };

ExportWallet$Mutation$ExportWallet$Wallet
    _$ExportWallet$Mutation$ExportWallet$WalletFromJson(
            Map<String, dynamic> json) =>
        ExportWallet$Mutation$ExportWallet$Wallet()
          ..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$ExportWallet$Mutation$ExportWallet$WalletToJson(
        ExportWallet$Mutation$ExportWallet$Wallet instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

ExportWallet$Mutation$ExportWallet _$ExportWallet$Mutation$ExportWalletFromJson(
        Map<String, dynamic> json) =>
    ExportWallet$Mutation$ExportWallet()
      ..wallet = json['wallet'] == null
          ? null
          : ExportWallet$Mutation$ExportWallet$Wallet.fromJson(
              json['wallet'] as Map<String, dynamic>)
      ..secretSeed = json['secret_seed'] as String?;

Map<String, dynamic> _$ExportWallet$Mutation$ExportWalletToJson(
        ExportWallet$Mutation$ExportWallet instance) =>
    <String, dynamic>{
      'wallet': instance.wallet?.toJson(),
      'secret_seed': instance.secretSeed,
    };

ExportWallet$Mutation _$ExportWallet$MutationFromJson(
        Map<String, dynamic> json) =>
    ExportWallet$Mutation()
      ..exportWallet = json['export_wallet'] == null
          ? null
          : ExportWallet$Mutation$ExportWallet.fromJson(
              json['export_wallet'] as Map<String, dynamic>);

Map<String, dynamic> _$ExportWallet$MutationToJson(
        ExportWallet$Mutation instance) =>
    <String, dynamic>{
      'export_wallet': instance.exportWallet?.toJson(),
    };

DeleteWallet$Mutation$DeleteWallet _$DeleteWallet$Mutation$DeleteWalletFromJson(
        Map<String, dynamic> json) =>
    DeleteWallet$Mutation$DeleteWallet()..status = json['status'] as bool?;

Map<String, dynamic> _$DeleteWallet$Mutation$DeleteWalletToJson(
        DeleteWallet$Mutation$DeleteWallet instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

DeleteWallet$Mutation _$DeleteWallet$MutationFromJson(
        Map<String, dynamic> json) =>
    DeleteWallet$Mutation()
      ..deleteWallet = json['delete_wallet'] == null
          ? null
          : DeleteWallet$Mutation$DeleteWallet.fromJson(
              json['delete_wallet'] as Map<String, dynamic>);

Map<String, dynamic> _$DeleteWallet$MutationToJson(
        DeleteWallet$Mutation instance) =>
    <String, dynamic>{
      'delete_wallet': instance.deleteWallet?.toJson(),
    };

CreateWalletAsset$Mutation$CreateWalletAsset
    _$CreateWalletAsset$Mutation$CreateWalletAssetFromJson(
            Map<String, dynamic> json) =>
        CreateWalletAsset$Mutation$CreateWalletAsset()
          ..status = json['status'] as bool?;

Map<String, dynamic> _$CreateWalletAsset$Mutation$CreateWalletAssetToJson(
        CreateWalletAsset$Mutation$CreateWalletAsset instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

CreateWalletAsset$Mutation _$CreateWalletAsset$MutationFromJson(
        Map<String, dynamic> json) =>
    CreateWalletAsset$Mutation()
      ..createWalletAsset = json['create_wallet_asset'] == null
          ? null
          : CreateWalletAsset$Mutation$CreateWalletAsset.fromJson(
              json['create_wallet_asset'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateWalletAsset$MutationToJson(
        CreateWalletAsset$Mutation instance) =>
    <String, dynamic>{
      'create_wallet_asset': instance.createWalletAsset?.toJson(),
    };

VerifyToken$Mutation$VerifyToken _$VerifyToken$Mutation$VerifyTokenFromJson(
        Map<String, dynamic> json) =>
    VerifyToken$Mutation$VerifyToken()..payload = json['payload'] as Object;

Map<String, dynamic> _$VerifyToken$Mutation$VerifyTokenToJson(
        VerifyToken$Mutation$VerifyToken instance) =>
    <String, dynamic>{
      'payload': instance.payload,
    };

VerifyToken$Mutation _$VerifyToken$MutationFromJson(
        Map<String, dynamic> json) =>
    VerifyToken$Mutation()
      ..verifyToken = json['verify_token'] == null
          ? null
          : VerifyToken$Mutation$VerifyToken.fromJson(
              json['verify_token'] as Map<String, dynamic>);

Map<String, dynamic> _$VerifyToken$MutationToJson(
        VerifyToken$Mutation instance) =>
    <String, dynamic>{
      'verify_token': instance.verifyToken?.toJson(),
    };

ProfilesArguments _$ProfilesArgumentsFromJson(Map<String, dynamic> json) =>
    ProfilesArguments(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      search: json['search'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$ProfilesArgumentsToJson(ProfilesArguments instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'search': instance.search,
      'username': instance.username,
    };

ProfileArguments _$ProfileArgumentsFromJson(Map<String, dynamic> json) =>
    ProfileArguments(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileArgumentsToJson(ProfileArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateProfileArguments _$CreateProfileArgumentsFromJson(
        Map<String, dynamic> json) =>
    CreateProfileArguments(
      full_name: json['full_name'] as String,
      mobile_phone: json['mobile_phone'] as String?,
      mobile_phone_code: json['mobile_phone_code'] as String?,
      country: json['country'] as String?,
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      id_type: json['id_type'] as String?,
      id_number: json['id_number'] as String?,
    );

Map<String, dynamic> _$CreateProfileArgumentsToJson(
        CreateProfileArguments instance) =>
    <String, dynamic>{
      'full_name': instance.full_name,
      'mobile_phone': instance.mobile_phone,
      'mobile_phone_code': instance.mobile_phone_code,
      'country': instance.country,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'id_type': instance.id_type,
      'id_number': instance.id_number,
    };

UpdateProfileArguments _$UpdateProfileArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileArguments(
      id: (json['id'] as num).toInt(),
      full_name: json['full_name'] as String?,
      mobile_phone: json['mobile_phone'] as String?,
      mobile_phone_code: json['mobile_phone_code'] as String?,
      country: json['country'] as String?,
      pin: json['pin'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      code_onesignal: json['code_onesignal'] as String?,
      email: json['email'] as String?,
      is_card_reserved: json['is_card_reserved'] as bool?,
      id_type: json['id_type'] as String?,
      id_number: json['id_number'] as String?,
    );

Map<String, dynamic> _$UpdateProfileArgumentsToJson(
        UpdateProfileArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.full_name,
      'mobile_phone': instance.mobile_phone,
      'mobile_phone_code': instance.mobile_phone_code,
      'country': instance.country,
      'pin': instance.pin,
      'username': instance.username,
      'password': instance.password,
      'code_onesignal': instance.code_onesignal,
      'email': instance.email,
      'is_card_reserved': instance.is_card_reserved,
      'id_type': instance.id_type,
      'id_number': instance.id_number,
    };

VerifyProfilePinArguments _$VerifyProfilePinArgumentsFromJson(
        Map<String, dynamic> json) =>
    VerifyProfilePinArguments(
      id: (json['id'] as num).toInt(),
      pin: json['pin'] as String,
    );

Map<String, dynamic> _$VerifyProfilePinArgumentsToJson(
        VerifyProfilePinArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pin': instance.pin,
    };

GetProfileArguments _$GetProfileArgumentsFromJson(Map<String, dynamic> json) =>
    GetProfileArguments(
      token: json['token'] as String,
    );

Map<String, dynamic> _$GetProfileArgumentsToJson(
        GetProfileArguments instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

ResetPasswordUserArguments _$ResetPasswordUserArgumentsFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordUserArguments(
      email: json['email'] as String,
    );

Map<String, dynamic> _$ResetPasswordUserArgumentsToJson(
        ResetPasswordUserArguments instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

SendEmailPinArguments _$SendEmailPinArgumentsFromJson(
        Map<String, dynamic> json) =>
    SendEmailPinArguments(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$SendEmailPinArgumentsToJson(
        SendEmailPinArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

VerifyEmailPinArguments _$VerifyEmailPinArgumentsFromJson(
        Map<String, dynamic> json) =>
    VerifyEmailPinArguments(
      id: (json['id'] as num).toInt(),
      pin: json['pin'] as String,
    );

Map<String, dynamic> _$VerifyEmailPinArgumentsToJson(
        VerifyEmailPinArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pin': instance.pin,
    };

AssetsArguments _$AssetsArgumentsFromJson(Map<String, dynamic> json) =>
    AssetsArguments(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      search: json['search'] as String?,
      force_update: json['force_update'] as String?,
      is_recommended: json['is_recommended'] as bool?,
    );

Map<String, dynamic> _$AssetsArgumentsToJson(AssetsArguments instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'search': instance.search,
      'force_update': instance.force_update,
      'is_recommended': instance.is_recommended,
    };

CreateTransactionArguments _$CreateTransactionArgumentsFromJson(
        Map<String, dynamic> json) =>
    CreateTransactionArguments(
      wallet_id: (json['wallet_id'] as num).toInt(),
      seed_encrypted_key: json['seed_encrypted_key'] as String,
      destination_id: json['destination_id'] as String,
      amount: json['amount'] as String,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$CreateTransactionArgumentsToJson(
        CreateTransactionArguments instance) =>
    <String, dynamic>{
      'wallet_id': instance.wallet_id,
      'seed_encrypted_key': instance.seed_encrypted_key,
      'destination_id': instance.destination_id,
      'amount': instance.amount,
      'memo': instance.memo,
    };

ConversionsArguments _$ConversionsArgumentsFromJson(
        Map<String, dynamic> json) =>
    ConversionsArguments(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      search: json['search'] as String?,
      force_update: json['force_update'] as String?,
    );

Map<String, dynamic> _$ConversionsArgumentsToJson(
        ConversionsArguments instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'search': instance.search,
      'force_update': instance.force_update,
    };

CreateSwapTokenArguments _$CreateSwapTokenArgumentsFromJson(
        Map<String, dynamic> json) =>
    CreateSwapTokenArguments(
      wallet_id: (json['wallet_id'] as num).toInt(),
      seed_encrypted_key: json['seed_encrypted_key'] as String,
      origin_asset_id: (json['origin_asset_id'] as num).toInt(),
      destiny_asset_id: (json['destiny_asset_id'] as num).toInt(),
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$CreateSwapTokenArgumentsToJson(
        CreateSwapTokenArguments instance) =>
    <String, dynamic>{
      'wallet_id': instance.wallet_id,
      'seed_encrypted_key': instance.seed_encrypted_key,
      'origin_asset_id': instance.origin_asset_id,
      'destiny_asset_id': instance.destiny_asset_id,
      'amount': instance.amount,
    };

BuildPathStrictSendArguments _$BuildPathStrictSendArgumentsFromJson(
        Map<String, dynamic> json) =>
    BuildPathStrictSendArguments(
      wallet_id: (json['wallet_id'] as num).toInt(),
      origin_asset_id: (json['origin_asset_id'] as num).toInt(),
      destiny_asset_id: (json['destiny_asset_id'] as num).toInt(),
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$BuildPathStrictSendArgumentsToJson(
        BuildPathStrictSendArguments instance) =>
    <String, dynamic>{
      'wallet_id': instance.wallet_id,
      'origin_asset_id': instance.origin_asset_id,
      'destiny_asset_id': instance.destiny_asset_id,
      'amount': instance.amount,
    };

TokenAuthArguments _$TokenAuthArgumentsFromJson(Map<String, dynamic> json) =>
    TokenAuthArguments(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$TokenAuthArgumentsToJson(TokenAuthArguments instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

WalletsArguments _$WalletsArgumentsFromJson(Map<String, dynamic> json) =>
    WalletsArguments(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      search: json['search'] as String?,
      profile_id: (json['profile_id'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WalletsArgumentsToJson(WalletsArguments instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'search': instance.search,
      'profile_id': instance.profile_id,
    };

WalletsShortArguments _$WalletsShortArgumentsFromJson(
        Map<String, dynamic> json) =>
    WalletsShortArguments(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      search: json['search'] as String?,
      profile_id: (json['profile_id'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WalletsShortArgumentsToJson(
        WalletsShortArguments instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'search': instance.search,
      'profile_id': instance.profile_id,
    };

WalletArguments _$WalletArgumentsFromJson(Map<String, dynamic> json) =>
    WalletArguments(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$WalletArgumentsToJson(WalletArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateMnemonicWalletArguments _$CreateMnemonicWalletArgumentsFromJson(
        Map<String, dynamic> json) =>
    CreateMnemonicWalletArguments(
      profile_id: (json['profile_id'] as num).toInt(),
    );

Map<String, dynamic> _$CreateMnemonicWalletArgumentsToJson(
        CreateMnemonicWalletArguments instance) =>
    <String, dynamic>{
      'profile_id': instance.profile_id,
    };

CreateWalletArguments _$CreateWalletArgumentsFromJson(
        Map<String, dynamic> json) =>
    CreateWalletArguments(
      profile_id: (json['profile_id'] as num).toInt(),
      mnemonic_phrase: json['mnemonic_phrase'] as String,
    );

Map<String, dynamic> _$CreateWalletArgumentsToJson(
        CreateWalletArguments instance) =>
    <String, dynamic>{
      'profile_id': instance.profile_id,
      'mnemonic_phrase': instance.mnemonic_phrase,
    };

UpdateWalletArguments _$UpdateWalletArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateWalletArguments(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      emoji: json['emoji'] as String?,
    );

Map<String, dynamic> _$UpdateWalletArgumentsToJson(
        UpdateWalletArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'emoji': instance.emoji,
    };

ImportWalletArguments _$ImportWalletArgumentsFromJson(
        Map<String, dynamic> json) =>
    ImportWalletArguments(
      profile_id: (json['profile_id'] as num).toInt(),
      secret_key: json['secret_key'] as String,
    );

Map<String, dynamic> _$ImportWalletArgumentsToJson(
        ImportWalletArguments instance) =>
    <String, dynamic>{
      'profile_id': instance.profile_id,
      'secret_key': instance.secret_key,
    };

ExportWalletArguments _$ExportWalletArgumentsFromJson(
        Map<String, dynamic> json) =>
    ExportWalletArguments(
      id: (json['id'] as num).toInt(),
      seed_encrypted_key: json['seed_encrypted_key'] as String,
      phrases: json['phrases'] as String,
    );

Map<String, dynamic> _$ExportWalletArgumentsToJson(
        ExportWalletArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seed_encrypted_key': instance.seed_encrypted_key,
      'phrases': instance.phrases,
    };

DeleteWalletArguments _$DeleteWalletArgumentsFromJson(
        Map<String, dynamic> json) =>
    DeleteWalletArguments(
      wallet_id: (json['wallet_id'] as num).toInt(),
      seed_encrypted_key: json['seed_encrypted_key'] as String,
      destination_wallet_id: (json['destination_wallet_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DeleteWalletArgumentsToJson(
        DeleteWalletArguments instance) =>
    <String, dynamic>{
      'wallet_id': instance.wallet_id,
      'seed_encrypted_key': instance.seed_encrypted_key,
      'destination_wallet_id': instance.destination_wallet_id,
    };

CreateWalletAssetArguments _$CreateWalletAssetArgumentsFromJson(
        Map<String, dynamic> json) =>
    CreateWalletAssetArguments(
      id: (json['id'] as num).toInt(),
      seed_encrypted_key: json['seed_encrypted_key'] as String,
      asset_id: (json['asset_id'] as num).toInt(),
    );

Map<String, dynamic> _$CreateWalletAssetArgumentsToJson(
        CreateWalletAssetArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seed_encrypted_key': instance.seed_encrypted_key,
      'asset_id': instance.asset_id,
    };

VerifyTokenArguments _$VerifyTokenArgumentsFromJson(
        Map<String, dynamic> json) =>
    VerifyTokenArguments(
      token: json['token'] as String,
    );

Map<String, dynamic> _$VerifyTokenArgumentsToJson(
        VerifyTokenArguments instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
