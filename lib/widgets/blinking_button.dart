import 'package:flutter/material.dart';

class BlinkingButton extends StatefulWidget {
  //handling the click

  final Function() onTap;

  const BlinkingButton({Key? key, required this.onTap}) : super(key: key);

  @override
  _BlinkingButtonState createState() => _BlinkingButtonState();
}

class _BlinkingButtonState extends State<BlinkingButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: TextButton(
        onPressed: widget.onTap,
        child: const Icon(
          Icons.arrow_forward_ios,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
