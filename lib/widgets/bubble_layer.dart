import 'package:cab_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class BubbleLayer extends StatefulWidget {
  final Widget child;
  const BubbleLayer({Key? key, required this.child}) : super(key: key);

  @override
  _BubbleLayerState createState() => _BubbleLayerState();
}

class _BubbleLayerState extends State<BubbleLayer> with SingleTickerProviderStateMixin {
  //making the bubble live
  late AnimationController _animationController;
  late Animation<double> _animationValue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationValue = Tween<double>(begin: 0.9, end: 1.1).animate(_animationController);
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //creating bubble
  Widget bubble(double height, double width) {
    return ScaleTransition(
      scale: _animationValue,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(shape: BoxShape.circle, color: bubbleColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -75,
            top: 10,
            child: bubble(160, 160),
          ),
          Positioned(
            right: -70,
            top: -70,
            child: bubble(200, 200),
          ),
          Positioned(
            right: 50,
            top: MediaQuery.of(context).size.height / 2 - 100,
            child: bubble(100, 100),
          ),
          Positioned(
            left: 50,
            bottom: 100,
            child: bubble(100, 100),
          ),
          //real content
          widget.child
        ],
      ),
    );
  }
}
