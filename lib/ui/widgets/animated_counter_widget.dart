import 'package:flutter/material.dart';

class AnimatedCounterWidget extends StatefulWidget {
  final void Function(AnimationController? controller)? init;
  const AnimatedCounterWidget({
    this.init,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedCounterWidgetState createState() => _AnimatedCounterWidgetState();
}

class _AnimatedCounterWidgetState extends State<AnimatedCounterWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 90,
      duration: const Duration(milliseconds: 1000),
    );
    if (widget.init != null) {
      widget.init!(_ctrl);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.blue[50]!.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).accentColor,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: _ctrl!,
        builder: (context, child) {
          return Text(
            _ctrl!.value.floor().toString(),
            style: Theme.of(context).primaryTextTheme.headline3!.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).accentColor,
                ),
          );
        },
      ),
    );
  }
}
