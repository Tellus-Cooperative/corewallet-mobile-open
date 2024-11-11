import 'package:flutter_svg/flutter_svg.dart';

import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/providers/main_provider.dart';
import 'package:corewallet/utils/filters.dart';
import 'package:flutter/material.dart';

Container showModalProfile(BuildContext context, MainProvider mainProvider) {
  return Container(
    decoration: BoxDecoration(
        color: mainBlack5, borderRadius: BorderRadius.circular(30.0)),
    padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
    child: Column(
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              },
              icon: const Icon(Icons.settings),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  'assets/images/account/avatar.png',
                  fit: BoxFit.cover,
                  height: 75,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/account/camera.png',
                  height: 28,
                ),
              )
            ]),
            const SizedBox(
              width: 23,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                mainProvider.profile == null
                    ? 'Usuario'
                    : filterFullName(mainProvider.profile),
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: mainBlack100),
                textAlign: TextAlign.left,
              ),
              TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/profile-edit');
                },
                child: const Text(
                  'Editar Perfil',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: mainBlack60,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
              ),
            ]),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Sumario",
                style: TextStyle(
                  color: mainBlack100,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Ahorros",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: mainBlack80)),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Income.svg',
                        colorFilter: const ColorFilter.mode(
                            mainPrimary40, BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("\$4,500",
                          style: TextStyle(
                            fontSize: 24,
                            color: mainBlack100,
                            fontWeight: FontWeight.w800,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Gastos",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: mainBlack80)),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Outcome.svg',
                        colorFilter: const ColorFilter.mode(
                            mainPrimary40, BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("\$1,691",
                          style: TextStyle(
                            fontSize: 24,
                            color: mainBlack100,
                            fontWeight: FontWeight.w800,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: mainBlack100, borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/account/question.png',
                height: 40,
              ),
              const Text(
                  "¿Tienes alguna pregunta? ¡Nuestro\nservicio de atención al cliente está\ndisponible 24/7!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  )),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 56,
        ),
        const Text(
          "Te uniste a Becoop Wallet en septiembre de 2023. Han pasado 1 mes desde entonces y nuestra misión sigue siendo la misma: ayudarte a ahorrar y crecer.",
          style: TextStyle(
            color: mainBlack60,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}

InkWell builtOptions(BuildContext context, String title, String subtitle,
    Icon icon, String action) {
  return InkWell(
      onTap: () {
        Navigator.pushNamed(context, action);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFF88A8BF)),
            child: icon,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF15141F),
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
          ]),
        ],
      ));
}
