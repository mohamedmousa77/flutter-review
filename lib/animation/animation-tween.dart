import 'package:flutter/material.dart';

// Review of the animation Tween.
// Documentation: https://api.flutter.dev/flutter/animation/Tween-class.html
// Tween class used to animate the object between two numbers which is begin and end


class AnimationReview extends StatefulWidget {
  const AnimationReview({super.key});

  @override
  State<AnimationReview> createState() => _AnimationReviewState();
}

class _AnimationReviewState extends State<AnimationReview>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    animation = Tween(begin: 0.0, end: 400.0).animate(animationController);
    animation.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: animation.value,
            width: animation.value,
            color: Colors.blueAccent,
            child: const Center(child: FlutterLogo(size: 300)),
          ),
          Container(
            color: Colors.orangeAccent,
            child: const Text(
              'Mohamed',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
