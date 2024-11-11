import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/colors.dart';

class RestorePasswordSuccessPage extends StatelessWidget {
  const RestorePasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 10),
            _buildImageSection(),
            const SizedBox(height: 10),
            _buildTextSection(
              "Contraseña temporal enviada a tu correo electrónico.",
            ),
            const SizedBox(height: 18),
            _buildTextSection(
              "No olvides de ingresar y cambiar tu contraseña temporal.",
            ),
            const SizedBox(height: 20),
            _buildElevatedButton(
              "Iniciar sesión",
              () {
                Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false);
                Navigator.pushNamed(context, '/sign');
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: _buildTextSection("¿No te llegó contraseña temporal?",
                  fontSize: 14),
            ),
            const SizedBox(height: 5),
            Center(
                child: _buildTextSection(
                    "¿Revisaste tu correo no deseado / spam?",
                    fontSize: 14)),
            const SizedBox(height: 20),
            Center(
                child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Volver a enviar contraseña",
                style: TextStyle(color: mainPrimary100),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Restablecer contraseña',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/Mail Sent.svg',
          width: 84,
          height: 84,
        )
      ],
    );
  }

  Widget _buildTextSection(
    String text, {
    Color textColor = mainBlack60,
    double fontSize = 16,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: textColor,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildElevatedButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: mainPrimary90,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
