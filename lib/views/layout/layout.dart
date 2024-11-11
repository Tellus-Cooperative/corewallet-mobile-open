import 'dart:async';

import 'package:corewallet/providers/main_provider.dart';
import 'package:corewallet/services/transaction_service.dart';
import 'package:corewallet/views/_partial/_corecard_partial.dart';
import 'package:corewallet/views/_partial/home_partial.dart';
import 'package:corewallet/views/_partial/token_partial.dart';
import 'package:corewallet/views/_partial/_transaction_modal.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/api.graphql.dart';
import '../../providers/profile_provider.dart';
import '../../services/profile_service.dart';
import '../../services/wallet_service.dart';
import '../account/profile_pin_add.dart';
import '../widgets/loading_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool _obscureBalance = true;

  get onPressed => null;
  bool _isLoading = true;
  int viewIndex = 0;
  WalletService walletService = WalletService();
  TransactionService transactionService = TransactionService();
  List<Assets$Query$Assets$Results?> assets = [];

  TextEditingController searchController = TextEditingController();

  String currentToken = 'USD';
  double factorConversionXlmToUsd = 0.00;
  double factorConversionXlmToClp = 0.00;
  double factorConversion = 0.00;

  Timer? _debounce;

  void setUsd() {
    setState(() {
      currentToken = 'USD';
      factorConversion = factorConversionXlmToUsd;
    });
  }

  void setClp() {
    setState(() {
      currentToken = 'CLP';
      factorConversion = factorConversionXlmToClp;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialize();
    });
    super.initState();
  }

  initialize() async {
    setState(() {
      _isLoading = true;
    });

    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);

    bool existWallets = mainProvider.profile!.existWallets!;
    if (!existWallets) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<ProfileProvider>(
                  create: (_) => ProfileProvider(ProfileService()),
                  child: const ProfileAddPinPage(),
                )),
      );
    }

    bool? isVerified = mainProvider.profile!.isVerifiedEmail;

    if (!isVerified!) {
      ProfileService profileService = ProfileService();
      profileService.sendVerificationEmailPin(id: mainProvider.profileId);
      Navigator.pushNamed(context, '/sign-verify-email');
    }

    mainProvider.getWallet();

    setState(() {
      _isLoading = false;
    });

    var conversions = await transactionService.getConversions();
    mainProvider.setFactorConversionXlmToUsd(conversions[0]!.quotePrice!);
    mainProvider.setFactorConversionXlmToClp(conversions[1]!.quotePrice!);
    mainProvider.setFactorConversionUsdToClp(conversions[2]!.quotePrice!);
    mainProvider.setCurrentConversion('USD');

    mainProvider.loadAssetList();
  }

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: true);
    if (_isLoading) {
      return const Scaffold(body: LoadingPage());
    } else {
      return Scaffold(
        // extendBody: true,
        body: selectPartial(context, mainProvider),
        bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
            child: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 0,
              items: [
                CurvedNavigationBarItem(
                  child: SvgPicture.asset('assets/icons/Home.svg',
                      colorFilter: ColorFilter.mode(
                          viewIndex == 0 ? mainPrimary90 : mainPrimary40,
                          BlendMode.srcIn)),
                  label: 'Home',
                ),
                CurvedNavigationBarItem(
                  child: SvgPicture.asset('assets/icons/Chart.svg',
                      colorFilter: ColorFilter.mode(
                          viewIndex == 1 ? mainPrimary90 : mainPrimary40,
                          BlendMode.srcIn)),
                  label: 'Tokens',
                ),
                CurvedNavigationBarItem(
                  child: SvgPicture.asset('assets/icons/Group.svg',
                      colorFilter: ColorFilter.mode(
                          viewIndex == 2 ? mainPrimary90 : mainPrimary40,
                          BlendMode.srcIn)),
                ),
                CurvedNavigationBarItem(
                  child: SvgPicture.asset('assets/icons/Card.svg',
                      colorFilter: ColorFilter.mode(
                          viewIndex == 3 ? mainPrimary90 : mainPrimary40,
                          BlendMode.srcIn)),
                  label: 'Tarjeta',
                ),
                CurvedNavigationBarItem(
                  child: SvgPicture.asset('assets/icons/User.svg',
                      colorFilter: ColorFilter.mode(
                          viewIndex == 4 ? mainPrimary90 : mainPrimary40,
                          BlendMode.srcIn)),
                  label: 'Perfil',
                ),
              ],
              color: Colors.white,
              // buttonBackgroundColor: mainPrimary90,
              backgroundColor: mainBlack5,
              animationCurve: Curves.easeInOut,
              onTap: (index) {
                setState(() {
                  viewIndex = index;
                });
                switch (index) {
                  case (2):
                    {
                      showModalTransaction(context);
                    }
                  case (4):
                    {
                      Navigator.pushNamed(context, '/profile-edit');
                    }
                }
              },
              letIndexChange: (index) => true,
            )),
      );
    }
  }

  searchInputChange(String query, MainProvider mainProvider) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      mainProvider.reloadAssetList(search: query);
    });
  }

  Widget selectPartial(BuildContext context, MainProvider mainProvider) {
    Widget selectedContainer = homePartial(
        context, mainProvider, _obscureBalance, _toggleObscureBalance);
    switch (viewIndex) {
      case (1):
        {
          selectedContainer = tokenPartial(
              context, mainProvider, searchInputChange, searchController);
        }
      case (3):
        {
          selectedContainer = const CoreCardPartial();
        }
      // case (4):
      //   {
      //     selectedContainer = showModalProfile(context, mainProvider);
      //   }
    }
    return selectedContainer;
  }

  void _toggleObscureBalance() {
    setState(() {
      _obscureBalance = !_obscureBalance;
    });
  }
}
