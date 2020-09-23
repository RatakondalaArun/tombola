import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedCounterWidget extends StatefulWidget {
  final void Function(AnimationController controller) init;
  const AnimatedCounterWidget({
    this.init,
    Key key,
  }) : super(key: key);

  @override
  _AnimatedCounterWidgetState createState() => _AnimatedCounterWidgetState();
}

class _AnimatedCounterWidgetState extends State<AnimatedCounterWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 100,
      duration: const Duration(milliseconds: 1000),
    );
    if (widget.init != null) {
      widget.init(_ctrl);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, child) {
          return Text(
            _ctrl.value.floor().toString(),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }

  int generateRandom() => (Random().nextDouble() * 100).floor();
}
