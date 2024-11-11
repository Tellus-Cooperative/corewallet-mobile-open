import 'package:corewallet/utils/lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../models/api.graphql.dart';
import '../repositories/wallet_repository.dart';

class WalletProvider with ChangeNotifier {
  final WalletRepository walletRepository;

  List<Wallets$Query$Wallets$Results?> wallets = [];

  bool hasNextPage = true;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;

  int offset = 0;
  int limit = 20;
  double? _profileId;

  late ScrollController controller;

  WalletProvider(this.walletRepository);

  init({required double profileId}) {
    _profileId = profileId;
    controller = ScrollController()..addListener(_loadMore);
  }

  Future<void> getWallets() async {
    isFirstLoadRunning = true;

    var tempWallet = await walletRepository.getWallets(
        offset: offset, limit: limit, profileId: _profileId!);

    isFirstLoadRunning = false;
    wallets = tempWallet;
    notifyListeners();
  }

  void _loadMore() async {
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        controller.position.extentAfter < 300) {
      isLoadMoreRunning = true;

      offset += limit;
      try {
        var tempWallet = await walletRepository.getWallets(
            offset: offset, limit: limit, profileId: _profileId!);
        if (tempWallet.isNotEmpty) {
          wallets.addAll(tempWallet);
        } else {
          hasNextPage = false;
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      isLoadMoreRunning = false;
      notifyListeners();
    }
  }

  refresh() {
    offset = 0;
    limit = 20;
    hasNextPage = true;
    getWallets();
  }

  bool isLoading = false;
  bool isSaved = false;

  bool loadingIcon = false;
  bool showIcon = false;
  List<String> mnemonicPhrases = [];
  List mnemonicPhrasesRandom = [];

  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emojiController = TextEditingController(text: '');

  initWallet(Wallet$Query$Wallet? wallet) {
    if (wallet != null) {
      nameController.text = wallet.name!;
      emojiController.text = wallet.emoji!;
    }
  }

  Future addMnemonicWallet() async {
    isLoading = true;
    CreateMnemonicWallet$Mutation$CreateMnemonicWallet? response =
        await walletRepository.createMnemonicWallet(
            profileId: _profileId!.toInt());
    mnemonicPhrases = response!.mnemonicPhrase!.split(' ');
    mnemonicPhrasesRandom = listShuffle(mnemonicPhrases);
    notifyListeners();
  }

  Future addWallet(
      {required int profileId, required String mnemonicPhrase}) async {
    isLoading = true;
    await walletRepository.createWallet(
        profileId: profileId, mnemonicPhrase: mnemonicPhrase);
    notifyListeners();
  }

  Future updateWallet({required int id}) async {
    isLoading = true;

    isSaved = await walletRepository.updateWallet(
        id: id, name: nameController.text, emoji: emojiController.text);
    notifyListeners();
  }
}
