import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final double? sizeTransform;
  final bool? haveChildButtons;

  const AnimatedButton(
      {super.key,
      required this.child,
      required this.onTap,
      this.sizeTransform,
      this.haveChildButtons});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: widget.sizeTransform != null ? widget.sizeTransform! : 0.2,
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
      behavior: HitTestBehavior.opaque,
      child: Transform.scale(
        scale: _scale!,
        child: IgnorePointer(
          ignoring: widget.haveChildButtons != null ? false : true,
          child: widget.child,
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
