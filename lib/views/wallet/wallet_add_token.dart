import 'dart:async';

import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/services/wallet_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../models/api.graphql.dart';
import '../../../providers/main_provider.dart';
import '../../services/asset_service.dart';
import '../../utils/filters.dart';
import '../../utils/form_input.dart';
import '../../utils/wallet_storage.dart';

class WalletAddTokenPage extends StatefulWidget {
  final Wallet$Query$Wallet wallet;

  const WalletAddTokenPage({super.key, required this.wallet});

  @override
  WalletAddTokenPageState createState() => WalletAddTokenPageState();
}

class WalletAddTokenPageState extends State<WalletAddTokenPage> {
  List<int> assetsAddedIds = [];

  List<Assets$Query$Assets$Results?> assets = [];
  List<Assets$Query$Assets$Results?> assetsRecommended = [];
  Timer? _debounce;
  TextEditingController searchController = TextEditingController();
  String seedEncrypted = '';
  WalletService walletService = WalletService();

  late Assets$Query$Assets$Results selectedAsset =
      Assets$Query$Assets$Results();

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    setState(() {
      assetsAddedIds =
          widget.wallet.assets!.map((asset) => asset!.asset!.id!).toList();
    });

    AssetService assetService = AssetService();
    var list = await assetService.getAssets(isRecommended: false);

    var listRecommended = await assetService.getAssets(isRecommended: true);

    WalletStorage storage = WalletStorage(filename: "${widget.wallet.id}.key");
    storage.readWallet().then((value) => {seedEncrypted = value});

    setState(() {
      assets = list;
      assetsRecommended = listRecommended;
    });
  }

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Token'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.all(0),
              child: inputSearch(
                  searchController, 'Buscar', searchInputChange, mainProvider),
            ),
            const SizedBox(
              height: 10,
            ),
            if (searchController.text == '')
              const Text("Recomendados",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  )),
            if (searchController.text == '')
              tokenList(mainProvider, assetsRecommended),
            const SizedBox(
              height: 10,
            ),
            Expanded(child: tokenList(mainProvider, assets)),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  loadAssets() async {
    AssetService assetService = AssetService();
    var list = await assetService.getAssets();
    setState(() {
      assets = list;
    });
  }

  searchInputChange(String query, MainProvider mainProvider) async {
    AssetService assetService = AssetService();

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      var list = await assetService.getAssets(search: query);
      setState(() {
        assets = list;
      });
    });
  }

  Widget tokenList(
      MainProvider mainProvider, List<Assets$Query$Assets$Results?> assets) {
    if (assets.isEmpty) {
      return const Center(child: Text('No existen datos'));
    }

    return Container(
      alignment: Alignment.topLeft,
      child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: assets.length,
          itemBuilder: (context, index) {
            return Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: assets[index]!.image!.isEmpty
                          ? SvgPicture.asset(
                              'assets/images/tickers/Stellar.svg',
                            )
                          : Image.network('${assets[index]!.image}'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            assets[index]!.symbol!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                              truncateMiddleToken(assets[index]!.name!,
                                  leftSide: 5, rightSide: 6),
                              style: const TextStyle(
                                  fontSize: 12, color: mainBlack60))
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainPrimary80,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: assetsAddedIds.contains(assets[index]!.id!)
                          ? null
                          : () async {

                              var currentAsset = assets[index];

                              bool status =
                                  await walletService.createTrustAsset(
                                      id: widget.wallet.id!,
                                      seedEncrypted: seedEncrypted,
                                      assetId: currentAsset!.id!);

                              if (status) {
                                mainProvider.getWallet();
                                Navigator.pop(context);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Hubo un error",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    fontSize: 16.0);
                              }
                            },
                      child: Text(
                        assetsAddedIds.contains(assets[index]!.id!)
                            ? 'Añadido'
                            : 'Añadir',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ));
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.white,
              indent: 20,
            );
          }),
    );
  }
}
