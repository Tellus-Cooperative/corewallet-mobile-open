import 'package:flutter/material.dart';

class CommonButton extends StatefulWidget {
  final Widget? icon;
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Function onTap;

  const CommonButton(
      {super.key,
      this.icon,
      required this.text,
      required this.onTap,
      required this.backgroundColor,
      required this.borderColor,
      required this.textColor});

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  double? _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller!.value;
    return GestureDetector(
      child: Transform.scale(
        scale: _scale!,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 2),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 60,
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              border: Border.all(width: 2, color: widget.borderColor)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: widget.textColor),
              ),
              widget.icon != null
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: widget.icon)
                  : const SizedBox()
            ],
          ),
        ),
      ),
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();

        _controller!.forward();
        Future.delayed(const Duration(milliseconds: 150), () {
          _controller!.reverse();
          Future.delayed(const Duration(milliseconds: 150), () {
            widget.onTap();
          });
        });
      },
    );
  }
}
