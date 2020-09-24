import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import '../../blocs/generator_bloc/generator_bloc.dart';
import '../widgets/animated_counter_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BootstrapContainer(
          fluid: true,
          padding: const EdgeInsets.all(0),
          children: [
            BootstrapRow(
              height: MediaQuery.of(context).size.height,
              children: [
                BootstrapCol(
                  sizes: 'col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4',
                  child: Header(),
                ),
                BootstrapCol(
                  sizes: 'col-12 col-sm-12 col-md-12 col-lg-8 col-xl-8 ',
                  child: Table(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Set<int> getGeneratedNumbers(BuildContext context) {
    return BlocProvider.of<GeneratorBloc>(context).state.generatedNumbers;
  }
}

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  AnimationController _ctrl;
  GeneratorBloc _generatorBloc;
  ScrollController _scrollCtrl;
  final _animatedListKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _scrollCtrl = ScrollController();
    _generatorBloc = BlocProvider.of<GeneratorBloc>(context);
    _generatorBloc.listen((state) {
      _ctrl?.animateTo(state.value.toDouble());
      _scrollCtrl?.animateTo(
        (70 + _scrollCtrl.position.maxScrollExtent).toDouble(),
        duration: Duration(milliseconds: 1000),
        curve: Curves.decelerate,
      );
    });
  }

  @override
  void didChangeDependencies() {
    _scrollCtrl.dispose();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Tombola',
            style: Theme.of(context)
                .primaryTextTheme
                .headline2
                .copyWith(color: Colors.black),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[50].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.green,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: AnimatedCounterWidget(
              init: (c) => _ctrl = c,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlineButton.icon(
                icon: Icon(Icons.fiber_new),
                label: Text('Generate'),
                color: Colors.green,
                textColor: Colors.green,
                onPressed: () {
                  _generatorBloc.add(GeneratorGenerateRandomEvent());
                },
              ),
              OutlineButton.icon(
                icon: Icon(Icons.refresh_outlined),
                label: Text('Reset'),
                color: Colors.red,
                textColor: Colors.red,
                onPressed: () {
                  _generatorBloc.add(GeneratorResetEvent());
                },
              ),
            ],
          ),
          Container(
            height: 80,
            child: BlocBuilder<GeneratorBloc, GeneratorState>(
              builder: (context, state) {
                return PreviousNumbersRow(
                  animatedListKey: _animatedListKey,
                  generatedValues: _generatorBloc.state.generatedNumbers,
                  controller: _scrollCtrl,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Table extends StatelessWidget {
  const Table({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: constraints.maxWidth,
          alignment: Alignment.center,
          child: BlocBuilder<GeneratorBloc, GeneratorState>(
            builder: (context, state) {
              return GridView.builder(
                itemCount: 100,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  childAspectRatio: 1.3,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TableTile(
                    index: index + 1,
                    isSelected: state.generatedNumbers.contains(index + 1),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class TableTile extends StatelessWidget {
  final int index;
  final bool isSelected;

  const TableTile({
    Key key,
    @required this.index,
    this.isSelected = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isSelected ? Colors.purple[50] : Colors.purple[50].withOpacity(0.3),
        border: Border.all(
          color: isSelected ? Colors.purple : Colors.black12,
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(
          '$index',
          style: TextStyle(
            color: isSelected ? Colors.purple : Colors.black26,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class PreviousNumbersRow extends StatelessWidget {
  final GlobalKey<AnimatedListState> animatedListKey;
  final Set<int> generatedValues;
  final ScrollController controller;

  const PreviousNumbersRow({
    Key key,
    this.animatedListKey,
    this.generatedValues,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: generatedValues.length,
      controller: controller,
      scrollDirection: Axis.horizontal,
      reverse: false,
      itemBuilder: (context, index) {
        return PreviousItem(
          value: generatedValues.elementAt(index),
        );
      },
    );
  }
}

class PreviousItem extends StatelessWidget {
  final int value;

  const PreviousItem({Key key, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: Container(
        width: 60,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue[50].withOpacity(0.5),
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
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
