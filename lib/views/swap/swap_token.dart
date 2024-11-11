import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/models/api.graphql.dart';
import 'package:corewallet/views/swap/swap_token_confirmation.dart';
import 'package:corewallet/views/widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/transaction_service.dart';
import '../widgets/switch_custom.dart';

class InputWithDropdown extends StatefulWidget {
  final List<Wallet$Query$Wallet$Assets?> dropdownValues;
  final Function onValueChanged;
  final TextEditingController inputController;
  final bool readOnly;
  final Function onChangedInput;

  const InputWithDropdown({
    super.key,
    required this.inputController,
    required this.dropdownValues,
    required this.onValueChanged,
    required this.readOnly,
    required this.onChangedInput,
  });

  @override
  InputWithDropdownState createState() => InputWithDropdownState();
}

class InputWithDropdownState extends State<InputWithDropdown> {
  late Wallet$Query$Wallet$Assets selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.dropdownValues.first!;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CupertinoTextField(
          // focusNode: _focusNode,
          readOnly: widget.readOnly,
          textInputAction: TextInputAction.next,
          controller: widget.inputController,
          decoration: BoxDecoration(
              color: mainBlack5, borderRadius: BorderRadius.circular(16)),
          placeholder: '',
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
              color: mainBlack60,
              fontWeight: FontWeight.w400,
              letterSpacing: 1),
          suffix: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: DropdownButton<Wallet$Query$Wallet$Assets>(
              value: selectedValue,
              items: widget.dropdownValues.map((item) {
                return DropdownMenuItem<Wallet$Query$Wallet$Assets>(
                  value: item,
                  child: Text(item!.asset!.symbol!),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue!;
                  widget.onValueChanged(newValue);
                });
              },
            ),
          ),
          placeholderStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          onChanged: (value) => widget.onChangedInput(value),
        ),
      ],
    );
  }
}

class SwapTokenPage extends StatefulWidget {
  final Wallet$Query$Wallet? wallet;

  const SwapTokenPage({super.key, required this.wallet});

  @override
  SwapTokenPageState createState() => SwapTokenPageState();
}

class SwapTokenPageState extends State<SwapTokenPage> {
  Wallet$Query$Wallet$Assets selectedFromToken = Wallet$Query$Wallet$Assets();
  Wallet$Query$Wallet$Assets selectedToToken = Wallet$Query$Wallet$Assets();
  double tokenPrice = 0.0;
  bool isSwitched = false;
  TextEditingController inputFromController = TextEditingController();
  TextEditingController inputToController = TextEditingController();
  List<Wallet$Query$Wallet$Assets?> tokens = [];
  TransactionService transactionService = TransactionService();

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() {
    setState(() {
      tokens = widget.wallet!.assets!;
      selectedFromToken = tokens.first!;
      selectedToToken = tokens.first!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Intercambia tus Tokens',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                )),
            const SizedBox(height: 5),
            const Text('Selecciona un token e intercambialo por otro.',
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: mainBlack60)),
            const SizedBox(height: 10),
            const Text('Cambias:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 10),
            InputWithDropdown(
              inputController: inputFromController,
              dropdownValues: tokens,
              onValueChanged: onTokenFromChanged,
              readOnly: false,
              onChangedInput: onChangedInput,
            ),
            const SizedBox(height: 20),
            buildTotalDisponible(),
            const SizedBox(height: 20),
            const Text('Recibes:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 10),
            InputWithDropdown(
              inputController: inputToController,
              dropdownValues: tokens,
              onValueChanged: onTokenToChanged,
              readOnly: true,
              onChangedInput: () => {},
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: mainPrimary90,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20)),
                  onPressed: () => submitData(context),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTotalDisponible() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Disponible',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: mainBlack80)),
            Text(
              '${selectedFromToken.balance!} ${selectedFromToken.asset?.symbol} = \$$tokenPrice',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: mainBlack80,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Usar Máximo',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: mainBlack80)),
            const SizedBox(
              width: 5,
            ),
            CustomSwitch(
              key: UniqueKey(),
              value: false,
              enableColor: mainBlack60,
              disableColor: mainBlack60,
              onChanged: (value) {
                return;
              },
            ),
          ],
        ),
      ],
    );
  }

  void onTokenFromChanged(Wallet$Query$Wallet$Assets item) {
    setState(() {
      selectedFromToken = item;
      // tokenPrice = calcPrice(selectedToken);
    });
  }

  void onTokenToChanged(Wallet$Query$Wallet$Assets item) {
    setState(() {
      selectedToToken = item;
      // tokenPrice = calcPrice(selectedToken);
    });
  }

  Future<void> onChangedInput(String newValue) async {
    int assetOriginId = selectedFromToken.asset!.id!;
    int assetDestinyId = selectedToToken.asset!.id!;

    if (newValue == '') {
      setState(() {
        inputToController.text = '';
      });
    } else {
      String newAmount = await transactionService.buildPathStrictSend(
          walletId: widget.wallet!.id!,
          assetOriginId: assetOriginId,
          assetDestinyId: assetDestinyId,
          amount: newValue);

      setState(() {
        inputToController.text = newAmount;
      });
    }
  }

  Future<void> submitData(BuildContext context) async {
    String amount = inputFromController.text;
    int assetOriginId = selectedFromToken.asset!.id!;
    int assetDestinyId = selectedToToken.asset!.id!;

    if (amount.isEmpty) {
      showMessage(
          type: 'error',
          message: 'Escribe un monto a cambiar',
          context: context);
      return;
    }

    var walletMaximumValue = double.parse(widget.wallet!.balance!);
    var doubleAmount = double.parse(amount);

    if (doubleAmount > walletMaximumValue) {
      showMessage(
          type: 'error',
          message: 'Por favor introduzca un monto inferior o igual al balance',
          context: context);
      return;
    }

    if (selectedFromToken.asset!.id == selectedToToken.asset!.id) {
      showMessage(
          type: 'error',
          message: 'No se puede cambiar al mismo token',
          context: context);
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) {
          return SwapTokenConfirmation(widget.wallet!, amount,
              assetOriginId, assetDestinyId);
        }),
      ),
    );
  }
}
