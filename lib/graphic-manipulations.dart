import 'package:flutter/material.dart';

class GraphicManipulations extends StatefulWidget {
  const GraphicManipulations({super.key});

  @override
  State<GraphicManipulations> createState() => _GraphicManipulationsState();
}

class _GraphicManipulationsState extends State<GraphicManipulations> {
  late double axisX;

  late double axisY;
  late double axisZ;

  @override
  void initState() {
    setState(() {
      axisX = 0.0;
      axisY = 0.0;
      axisZ = 0.0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Transform
        body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const Text('X'),
              const SizedBox(width: 20),
              Slider(
                  value: axisX,
                  onChanged: (double value) => setState(() => axisX = value)),
            ],
          ),
          Row(
            children: [
              const Text('Y'),
              const SizedBox(width: 20),
              Slider(
                  value: axisY,
                  onChanged: (double value) => setState(() => axisY = value)),
            ],
          ),
          Row(
            children: [
              const Text('Z'),
              const SizedBox(width: 20),
              Slider(
                  value: axisZ,
                  onChanged: (double value) => setState(() => axisZ = value)),
            ],
          ),
          Transform(
            transform: Matrix4.skewY(axisY),
            child: Transform(
                transform: Matrix4.skewX(axisX),
                child: Transform(
                  transform: Matrix4.rotationZ(axisZ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('hello World'),
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
