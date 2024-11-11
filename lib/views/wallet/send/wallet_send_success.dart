import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/api.graphql.dart';

class WalletSendSuccess extends StatefulWidget {
  const WalletSendSuccess(this.wallet, this.amount, {super.key});

  final Wallet$Query$Wallet wallet;
  final String amount;

  @override
  State<StatefulWidget> createState() => _WalletSendSuccessWithIndicatorState();
}

class _WalletSendSuccessWithIndicatorState extends State<WalletSendSuccess> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(0),
                width: double.infinity,
                child: Column(children: [
                  const SizedBox(height: 126),
                  SizedBox(
                    width: 280,
                    child: Image.asset(
                      'assets/images/wallet/success.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text("Envío Exitoso",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      )),
                  const SizedBox(height: 16),
                  Text("${widget.amount} XLM",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      )),
                  const SizedBox(height: 28),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: const Text(
                          "Tu envío llegará en cuestión de segundos.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: mainBlack60,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )))
                ]),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  mainProvider.getWallet();
                  Navigator.popAndPushNamed(context, '/');
                },
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          child: Text(
                            'Continuar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
