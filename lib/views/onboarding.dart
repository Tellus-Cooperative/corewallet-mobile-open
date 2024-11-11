import 'package:banner_carousel/banner_carousel.dart';
import 'package:corewallet/providers/wallet_provider.dart';
import 'package:corewallet/services/wallet_service.dart';
import 'package:corewallet/views/wallet/add/wallet_add_accept_mnemonic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingPageWithIndicatorState();
}

class _OnboardingPageWithIndicatorState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  var currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return BannerCarousel(
                      height: constraints.maxHeight,
                      showIndicator: true,
                      pageController: _controller,
                      animation: true,
                      initialPage: 0,
                      viewportFraction: 1,
                      spaceBetween: 200,
                      onPageChanged: (page) {
                        setState(() {
                          currentPage = page;
                        });
                      },
                      customizedBanners: [
                        buildBanner(
                            'Aprende lo Básico',
                            'Bienvenido al mundo de las criptomonedas',
                            'Prepárate para descubrir una nueva manera de manejar tu dinero.',
                            'img1.png'),
                        buildBanner(
                            'Aprende lo Básico',
                            '¿Qué es una criptomoneda?',
                            'Una criptomoneda es una moneda digital descentralizada que utiliza la criptografía para asegurar y verificar transacciones. Un ancla en la red Stellar es una entidad que actúa como puente entre la red Stellar y otros sistemas de pago, permitiendo el intercambio de diferentes monedas y activos.',
                            'img2.png'),
                        buildBanner(
                            'Aprende lo Básico',
                            '¿Qué es Stellar?',
                            'Stellar es una plataforma de pagos descentralizada y de código abierto que utiliza la tecnología blockchain para facilitar transacciones internacionales de forma rápida, segura y económica. Stellar utiliza su propia criptomoneda llamada Lumens (XLM) y es altamente escalable y personalizable para desarrollar soluciones de pago personalizadas.',
                            'img3.png'),
                        buildBanner(
                            'Aprende lo Básico',
                            '¿Qué es Tellus Cooperativa?',
                            'Nuestra app trabaja con Tellus Cooperativa, una compañía dedicada a educar sobre criptomonedas, promover la democracia participativa  y crear una red de beneficios locales. Aprende más en telluscoop.com',
                            'img4.png'),
                        buildBanner(
                            'Aprende lo Básico',
                            '¿Qué puedes hacer con Becoop Wallet?',
                            'Con Becoop Wallet puedes enviar y recibir criptomonedas en la red Stellar y retirar dinero a tu banco o en dólares. La app está diseñada para ayudarte a ahorrar y gestionar tus fondos de manera segura y sencilla.',
                            'img5.png'),
                        buildBanner(
                            'Aprende lo Básico',
                            '¡Felicitaciones!',
                            'Ahora estás listo para empezar a usar todas las funciones de Becoop Wallet.\nHaz clic en "¡Comienza a Ahorrar!" para empezar a usar la billetera.',
                            'img6.png'),
                      ],
                    );
                  }),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    if (currentPage == 5) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider(
                                    create: (_) =>
                                        WalletProvider(WalletService()),
                                    child: const WalletAddAcceptMnemonicPage(),
                                  )));
                    } else {
                      setState(() {
                        currentPage += 1;
                      });
                      _controller.jumpToPage(currentPage);
                    }
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              currentPage == 5
                                  ? '¡Comienza a Ahorrar!'
                                  : 'Siguiente',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildBanner(
      String title, String subtitle, String paragraph, String image) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(color: mainBlack60)),
            if (currentPage < 5)
              ElevatedButton(
                onPressed: () {
                  _controller.jumpToPage(5);

                  //Navigator.popAndPushNamed(context, '/wallet-add');
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: mainBlack5,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    minimumSize: Size.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Omitir',
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: mainBlack100),
                ),
              )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            subtitle,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                height: 1.35,
                fontFamily: 'Montserrat'),
          ),
        ),
        const SizedBox(height: 12),
        Text(paragraph,
            style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                height: 1.6,
                fontWeight: FontWeight.w500,
                color: mainBlack60)),
        const SizedBox(height: 12),
        Flexible(
            child: Image.asset(
          'assets/images/onboarding/$image',
          fit: BoxFit.cover,
        ))
      ]),
    );
  }
}
