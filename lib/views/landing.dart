import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<StatefulWidget> createState() => _LandingWithIndicatorState();
}

class _LandingWithIndicatorState extends State<Landing> {
  final PageController _controller = PageController();

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
                      customizedBanners: [
                        buildBanner(
                            'Bienvenido a Becoop Wallet',
                            'Deposita fácilmente y con seguridad.',
                            'page1.png'),
                        buildBanner(
                            'Ahorra con Becoop Wallet',
                            'Ahorra, crece y aprende con nosotros.',
                            'page2.png'),
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
                    Navigator.pushNamed(context, '/sign');
                  },
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Inicia Sesión',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Crear una nueva cuenta',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: mainPrimary90, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildBanner(String title, String subtitle, String image) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(color: mainBlack60)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign');
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
        Text(
          subtitle,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        Flexible(
            child: Image.asset(
          'assets/images/landing/$image',
          fit: BoxFit.cover,
        ))
      ]),
    );
  }
}
