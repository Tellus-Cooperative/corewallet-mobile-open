import 'package:corewallet/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main_provider.dart';
import '../widgets/switch_custom.dart';

class SettingNotificationPage extends StatefulWidget {
  const SettingNotificationPage({super.key});

  @override
  State<SettingNotificationPage> createState() =>
      _SettingNotificationPageState();
}

class _SettingNotificationPageState extends State<SettingNotificationPage> {
  final _formSettingNotificationKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MainProvider homeProvider =
        Provider.of<MainProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Notificaciones",
                  style: TextStyle(
                    color: mainBlack100,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: Form(
                  key: _formSettingNotificationKey,
                  child: configOptions(homeProvider),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        return;
                      },
                      child: const Text('Guardar Cambios')))
            ]),
      ),
    );
  }

  Column configOptions(MainProvider homeProvider) {
    return Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
      const SizedBox(
        height: 24.0,
      ),
      buildOption('Alerta de Precios', '', homeProvider),
      const SizedBox(
        height: 32,
      ),
      buildOption('Recepción de Fondos', '', homeProvider),
      const SizedBox(
        height: 32,
      ),
      buildOption('Cuentas Compartidas', '', homeProvider),
      const SizedBox(
        height: 32,
      ),
      buildOption('Cumplimiento de Metas', '', homeProvider),
      const SizedBox(
        height: 32,
      ),
      buildOption('Nuevas Funcionalidades ', '', homeProvider),
      const SizedBox(
        height: 32,
      ),
      buildOption('Reporte Semanal', '', homeProvider),
    ]);
  }

  Row buildOption(
    String title,
    String option,
    MainProvider homeProvider,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )),
        CustomSwitch(
          key: UniqueKey(),
          value: false,
          enableColor: mainBlack60,
          disableColor: mainBlack60,
          onChanged: (value) {
            return;
          },
        )
      ],
    );
  }
}
