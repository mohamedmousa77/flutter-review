import 'package:flutter/material.dart';

class ListenerAnimationReview extends StatefulWidget {
  const ListenerAnimationReview({super.key});

  @override
  State<ListenerAnimationReview> createState() =>
      _ListenerAnimationReviewState();
}

class _ListenerAnimationReviewState extends State<ListenerAnimationReview>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(curve);
    animation.addStatusListener(listener);
  }

  void listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  Widget builder(BuildContext context, Widget? widget) {
    return Container(
      height: animation.value,
      width: animation.value,
      child: FlutterLogo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(builder: builder, animation: animation),
      ),
    );
  }
}
