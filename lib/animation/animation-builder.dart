import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

// In this section will cover the animation builder class,
// Documentation page:
// Used to build a customized animation.


class AnimationBuilderReview extends StatefulWidget {
  const AnimationBuilderReview({super.key});

  @override
  State<AnimationBuilderReview> createState() => _AnimationBuilderReviewState();
}

class _AnimationBuilderReviewState extends State<AnimationBuilderReview> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 5000), vsync: this);
    final CurvedAnimation curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 300.0 ).animate(curvedAnimation);
  }

  Widget builderMy(BuildContext context, Widget? child ){
    return Container(
      height: animation.value,
      width: animation.value,
      child: FlutterLogo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        padding:const EdgeInsets.all(32.0),
        child: AnimatedBuilder (animation: animation, builder:builderMy),
      ),
    );
  }
}
