import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitChasingDots(
      color: mainPrimary90,
    ));
  }
}

class LoadingImagePage extends StatelessWidget {
  const LoadingImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitPulse(
        color: mainPrimary90,
      ),
    );
  }
}
