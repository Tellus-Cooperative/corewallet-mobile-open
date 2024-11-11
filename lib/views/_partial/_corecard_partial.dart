import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/providers/main_provider.dart';
import 'package:corewallet/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/utils.dart';
class CoreCardPartial extends StatelessWidget {
  const CoreCardPartial({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider mainProvider =  Provider.of<MainProvider>(context, listen: true);

    return Container(
        color: mainBlack5,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("Próximamente: Becoop Card",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                )),
            const SizedBox(
              height: 56,
            ),
            Flexible(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Image.asset(
                    "assets/images/corecard.png",
                  ),
                )),
            const SizedBox(
              height: 32,
            ),
            if (!mainProvider.profile!.isCardReserved!)
              const Text(
                  "Entra a nuestra lista de espera para\nser el primero en tener la tarjeta física\nsustentable.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: mainBlack60,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            if (mainProvider.profile!.isCardReserved!)
              const Text(
                  "Ya estas anotado en la lista de espera para tener la tarjeta física sustentable.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mainBlack60,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
            const SizedBox(
              height: 10,
            ),
            if (mainProvider.profile!.isCardReserved!)
              const Text(
                  "Cuando tengamos novedades te enviaremos un correo electrónico. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mainBlack60,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
            if (mainProvider.profile!.isCardReserved!)
              const SizedBox(
                height: 50,
              ),
            if (!mainProvider.profile!.isCardReserved!)
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
                    child: const Text(
                      '¡Guárdame una!',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    onPressed: () async {

                      ProfileService profileService = ProfileService();
                      bool status = await profileService.updateProfileCardReserved(
                          id: mainProvider.profileId);

                      if (status) {
                        mainProvider.getCurrentProfile();
                        showMessage(message: 'Becoop Card Reservado', context: context);
                      }
                    }),
              )
          ],
        ),
      );

  }
}


