import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  BodyPart? defendingBodyPart;
  BodyPart? attackingBodyPart;
  bool defendingButton = false;
  bool attackingButton = false;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(213, 222, 240, 1),
      body: Column(
        children: [
          SizedBox(
            height: 40,),
          Row(
            children: [
              SizedBox(
                width: 16,),
              Expanded(
                child: Column(
                  children: [
                    Center(child: Text("You".toUpperCase())),
                  ],
                ),
              ),
              SizedBox(
                width: 16,),
              Expanded(
                child: Column(
                  children: [
                    Center(child: Text("Enemy".toUpperCase())),
                  ],
                ),
              ),
              SizedBox(
                width: 16,),
            ],
          ),
          SizedBox(height: 11,),
          newRow(),
          SizedBox(height: 4,),
          newRow(),
          SizedBox(height: 4,),
          newRow(),
          SizedBox(height: 4,),
          newRow(),
          SizedBox(height: 4,),
          newRow(),
          Expanded(child: SizedBox()),
          Row(
            children: [
              SizedBox(
                width: 16,),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                        height: 40),
                    Text(
                        "Defender".toUpperCase()),
                    SizedBox(
                        height: 13
                    ),
                    BodyPartButton(
                      bodyPart: BodyPart.head,
                      selected: defendingBodyPart==BodyPart.head,
                      bodyPartSetter: _selectDefendingBodyPart,),
                    SizedBox(
                        height: 14),
                    BodyPartButton(
                      bodyPart: BodyPart.torso,
                      selected: defendingBodyPart==BodyPart.torso,
                      bodyPartSetter: _selectDefendingBodyPart,),
                    SizedBox(
                        height: 14),
                    BodyPartButton(
                      bodyPart: BodyPart.legs,
                      selected: defendingBodyPart==BodyPart.legs,
                      bodyPartSetter: _selectDefendingBodyPart,),
                  ],
                ),
              ),
              SizedBox(
                width: 16,),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                        height: 40),
                    Text(
                        "Attack".toUpperCase()),
                    SizedBox(
                        height: 13
                    ),
                    BodyPartButton(
                      bodyPart: BodyPart.head,
                      selected: attackingBodyPart==BodyPart.head,
                      bodyPartSetter: _selectAttackingBodyPart,
                    ),
                    SizedBox(
                        height: 14),
                    BodyPartButton(
                      bodyPart: BodyPart.torso,
                      selected: attackingBodyPart==BodyPart.torso,
                      bodyPartSetter: _selectAttackingBodyPart,

                    ),
                    SizedBox(
                        height: 14),
                    BodyPartButton(
                      bodyPart: BodyPart.legs,
                      selected: attackingBodyPart==BodyPart.legs,
                      bodyPartSetter: _selectAttackingBodyPart,

                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 16,),
            ],
          ),
          SizedBox(
            height: 16,),
          Row(
            children: [
              SizedBox(
                  width: 16),
              Expanded(
                child: GoButton(defendingButton: defendingButton, attackingButton: attackingButton, goButtonSetter: _tabGoButton,),
              ),
              SizedBox(
                  width: 16),
            ],
          ),
          SizedBox(
            height: 40,),
        ],
      ),


    );
  }

  void _selectDefendingBodyPart(final BodyPart value) {
    setState(() {
      defendingBodyPart = value;
      defendingButton=true;
    });
  }

  void _selectAttackingBodyPart(final BodyPart value) {
    setState(() {
      attackingBodyPart=value;
      attackingButton =true;
    });
  }

  void _tabGoButton() {
    setState(() {
      defendingButton=false;
      attackingButton=false;
      attackingBodyPart =BodyPart.zero;
      defendingBodyPart =BodyPart.zero;
    });
  }
}

class newRow extends StatelessWidget {
  const newRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,),
        Expanded(
          child: Column(
            children: [
              Center(child: Text("1".toUpperCase())),
            ],
          ),
        ),
        SizedBox(
          width: 16,),
        Expanded(
          child: Column(
            children: [
              Center(child: Text("1".toUpperCase())),
            ],
          ),
        ),
        SizedBox(
          width: 16,),
      ],
    );
  }
}

class GoButton extends StatelessWidget {
  const GoButton({
    Key? key,
    required this.defendingButton,
    required this.attackingButton,
    required this.goButtonSetter,
  }) : super(key: key);

  final bool defendingButton;
  final bool attackingButton;
  final ValueGetter<void> goButtonSetter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> goButtonSetter(),
      child: SizedBox(
        height: 40,
        child: ColoredBox(
          color: defendingButton && attackingButton? Color.fromRGBO(0, 0, 0, 0.87): Color.fromRGBO(0, 0, 0, 0.38),
          child: Center(
            child: Text(
              "Go".toUpperCase(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16),

            ),
          ),
        ),
      ),
    );
  }
}

class BodyPart{
  final String name;
  const BodyPart._(this.name);

  static const legs=BodyPart._("Legs");
  static const head=BodyPart._("Head");
  static const torso=BodyPart._("Torso");
  static const zero=BodyPart._("Zero");

  @override
  String toString() {
    return 'BodyPart{name: $name}';
  }
}

class BodyPartButton extends StatelessWidget {
  final BodyPart bodyPart;
  final bool selected;
  final ValueSetter<BodyPart> bodyPartSetter;

  const BodyPartButton({
    Key? key,
    required this.bodyPart,
    required this.selected,
    required this.bodyPartSetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> bodyPartSetter(bodyPart),
      child: SizedBox(
        height: 40,
        // width: 158,
        child: ColoredBox(
          color:selected? const Color.fromRGBO(28, 121, 206, 1): Color.fromRGBO(0, 0, 0, 0.38),
          child: Center(
              child: Text(
                  bodyPart.name.toUpperCase())),),),
    );
  }
}
