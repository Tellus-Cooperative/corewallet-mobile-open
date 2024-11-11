import 'dart:convert';

import 'package:corewallet/models/payload.dart';
import 'package:corewallet/services/wallet_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/asset_service.dart';
import '../services/profile_service.dart';
import './graphql_provider.dart';
import '../config/environment.dart';
import '../models/api.graphql.dart';

class MainProvider with ChangeNotifier {
  SharedPreferences? _sharedPreferences;
  Profiles$Query$Profiles$Results? _profile;

  SharedPreferences? get sharedPreferences => _sharedPreferences;

  Profiles$Query$Profiles$Results? get profile => _profile;

  int get profileId => _profile!.id!;

  int? _selectedId;

  int? get selectedId => _selectedId;

  bool _showDetail = false;

  bool get showDetail => _showDetail;

  int? walletId;

  Wallet$Query$Wallet? wallet;

  List<Assets$Query$Assets$Results?> assets = [];

  double factorConversionXlmToUsd = 0.00;
  double factorConversionXlmToClp = 0.00;
  double factorConversionUsdToClp = 0.00;
  String currentConversion = 'USD';
  double factorConversion = 0.00;
  double factorUsdConversion = 1;
  String currentTokenConversion = 'USD';

  bool isTestnet = false;
  String oneSignalCode = '';

  resetProfile() {
    _profile = null;
    _sharedPreferences!.clear();
    Environment.setPublic();
    notifyListeners();
  }

  setProfile(profile) {
    _profile = profile;
    notifyListeners();
  }

  updateSelectedId(int? value) {
    _selectedId = value;
    notifyListeners();
  }

  setFactorConversionXlmToUsd(value) {
    factorConversionXlmToUsd = value;
  }

  setFactorConversionXlmToClp(value) {
    factorConversionXlmToClp = value;
  }

  setFactorConversionUsdToClp(value) {
    factorConversionUsdToClp = value;
  }

  setCurrentConversion(symbol) {
    currentConversion = symbol;

    if (symbol == 'USD') {
      factorConversion = factorConversionXlmToUsd;
      notifyListeners();
    } else if (symbol == 'CLP') {
      factorConversion = factorConversionXlmToClp;
      notifyListeners();
    } else {
      currentConversion = 'None';
      factorConversion = 0.00;
    }
  }

  setCurrentUsdConversion(symbol) {
    currentTokenConversion = symbol;

    if (symbol == 'USD') {
      factorUsdConversion = 1;
      notifyListeners();
    } else if (symbol == 'CLP') {
      factorUsdConversion = factorConversionUsdToClp;
      notifyListeners();
    } else {
      factorUsdConversion = 0.00;
    }
  }

  updateShowDetail(bool value) {
    _showDetail = value;
    notifyListeners();
  }

  setIsTestnet(bool newStatus) {
    isTestnet = newStatus;
    notifyListeners();
  }

  updateItemSharedPreferences(String key, String value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setString(key, value);
    notifyListeners();
  }

  Future<bool> checkLoginStatus(BuildContext context) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    bool isLogin = false;

    if (_sharedPreferences?.getString('token') != null) {
      final GraphQLClient client = getGraphQLClient(service: 'verify_token');
      final MutationOptions options = MutationOptions(
        document: VERIFY_TOKEN_MUTATION_DOCUMENT,
        variables:
            VerifyTokenArguments(token: _sharedPreferences!.getString('token')!)
                .toJson(),
      );

      final QueryResult result = await client.mutate(options);

      if (!result.isLoading && !result.hasException) {
        if (kDebugMode) {
          print('hay token');
        }
        Environment.setPrivateToken(_sharedPreferences!.getString('token')!);

        var authToken =
            VerifyToken$Mutation.fromJson(result.data!).verifyToken!.payload;
        Payload payload = Payload.fromJson(jsonDecode(jsonEncode(authToken)));

        var currentProfile = await getProfile(payload.username);
        if (currentProfile != null) {
          isLogin = true;
          setProfile(currentProfile);

          if (currentProfile.mainWallet != null) {
            walletId = currentProfile.mainWallet!.id!;
          } else {
            walletId = null;
          }
        } else {
          resetProfile();
        }
      } else {
        resetProfile();
        if (kDebugMode) {
          print(result.exception);
        }
      }
    } else {
      if (kDebugMode) {
        print('no hay token');
      }
      resetProfile();
    }
    return isLogin;
  }

  Future<Profiles$Query$Profiles$Results?> getProfile(String username) async {
    final GraphQLClient client = getGraphQLClient(service: 'get_profile');
    final QueryOptions options = QueryOptions(
      document: PROFILES_QUERY_DOCUMENT,
      variables: ProfilesArguments(username: username, limit: 1).toJson(),
    );

    final QueryResult result = await client.query(options);

    if (!result.hasException) {
      var profiles = Profiles$Query.fromJson(result.data!).profiles!.results!;

      if (profiles.isNotEmpty) {
        return profiles.first;
      }
      return null;
    } else {
      if (kDebugMode) {
        print(result.exception);
      }
    }
    return null;
  }

  setEnvironmentMode({isTestnet = false}) {
    if (isTestnet) {
      Environment.setEnvironmentTestnet();
    } else {
      Environment.setEnvironmentPublic();
    }
  }

  loadAssetList() {
    reloadAssetList();
  }

  reloadAssetList({search = ''}) async {
    AssetService assetService = AssetService();
    assets = await assetService.getAssets(search: search);
    notifyListeners();
  }

  resetWallet() {
    walletId = null;
    wallet = null;
    notifyListeners();
  }

  getWallet() async {
    WalletService walletService = WalletService();
    if (walletId != null) {
      wallet = await walletService.getWallet(id: walletId);
    } else {
      wallet = null;
    }
    notifyListeners();
  }

  initOnesignal() {
    // var id = OneSignal.User.pushSubscription.id;
    OneSignal.User.pushSubscription.addObserver((state) {
      if (kDebugMode) {
        // print(state.current.jsonRepresentation());
      }
      oneSignalCode = OneSignal.User.pushSubscription.id!;
    });

    OneSignal.Notifications.addPermissionObserver((state) {
      if (kDebugMode) {
        print("Has permission $state");
      }
    });

    OneSignal.Notifications.addClickListener((event) {
      if (kDebugMode) {
        print('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
      }
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      /// preventDefault to not display the notification
      event.preventDefault();

      /// Do async work

      /// notification.display() to display after preventing default
      event.notification.display();
    });

    OneSignal.InAppMessages.addClickListener((event) {
      if (kDebugMode) {
        print(
            "In App Message Clicked: \n${event.result.jsonRepresentation().replaceAll("\\n", "\n")}");
      }
    });
    OneSignal.InAppMessages.addWillDisplayListener((event) {
      if (kDebugMode) {
        print("ON WILL DISPLAY IN APP MESSAGE ${event.message.messageId}");
      }
    });
    OneSignal.InAppMessages.addDidDisplayListener((event) {
      if (kDebugMode) {
        print("ON DID DISPLAY IN APP MESSAGE ${event.message.messageId}");
      }
    });
    OneSignal.InAppMessages.addWillDismissListener((event) {
      if (kDebugMode) {
        print("ON WILL DISMISS IN APP MESSAGE ${event.message.messageId}");
      }
    });
    OneSignal.InAppMessages.addDidDismissListener((event) {
      if (kDebugMode) {
        print("ON DID DISMISS IN APP MESSAGE ${event.message.messageId}");
      }
    });
  }

  updateProfileCodeOneSignal(String codeOnesignal) async {
    ProfileService profileService = ProfileService();

    if (kDebugMode) {
      print('updating one code signal: $codeOnesignal');
    }

    if (codeOnesignal == '') {
      if (kDebugMode) {
        print('Empty one code signal');
      }
      return;
    }

    await profileService.updateProfile(
      id: profileId,
      codeOnesignal: codeOnesignal,
    );
    notifyListeners();
  }

  Future getCurrentProfile() async {
    _profile = await getProfile(_profile!.user!.username!);
    notifyListeners();
  }
}
