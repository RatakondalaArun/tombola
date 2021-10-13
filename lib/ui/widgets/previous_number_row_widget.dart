import 'package:flutter/material.dart';

class PreviousNumbersRow extends StatelessWidget {
  final Set<int>? generatedValues;
  final ScrollController? controller;

  const PreviousNumbersRow({
    Key? key,
    this.generatedValues,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: generatedValues!.length,
      controller: controller,
      scrollDirection: Axis.horizontal,
      reverse: false,
      itemBuilder: (context, index) {
        return PreviousItem(
          value: generatedValues!.elementAt(index),
        );
      },
    );
  }
}

class PreviousItem extends StatelessWidget {
  final int? value;

  const PreviousItem({Key? key, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue[50]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.green,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        '$value',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
