import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

// In this section will discuss Animated Widget

class AnimatedWidget extends StatefulWidget {
  const AnimatedWidget({super.key});

  @override
  State<AnimatedWidget> createState() => _AnimatedWidgetState();
}

class _AnimatedWidgetState extends State<AnimatedWidget>
    with TickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    final CurvedAnimation curve = CurvedAnimation(
        parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 40.0).animate(curve);
    animation.addStatusListener(listener);
    controller.forward();
  }

  void listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedLogo(animation: animation ),
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {

  static final opacityTween = Tween(begin: 0.1, end: 1.0);
  static final sizeTween = Tween(begin: 0.0, end: 300.0);
  static final rotateTween = Tween(begin: 0.0, end: 12.0);

  AnimatedLogo({Key? key, Animation<double>? animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listnenable;
    return Center(
      child: Transform.rotate(angle: rotateTween.evaluate(animation),
        child: Opacity(opacity: opacityTween.evaluate(animation),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            height: sizeTween.evaluate(animation),
            width: sizeTween.evaluate(animation),
            child: FlutterLogo(),
          ),

        )),
    );
  }

}
