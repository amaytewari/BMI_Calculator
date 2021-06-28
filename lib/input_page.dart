import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_classes.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator.dart';

const Color containerColor = Color(0xFF1D1E33);
const Color inactiveContainerColor = Color(0xFF111328);
const double heightBottomBar = 60.0;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color femaleColor = inactiveContainerColor;
  Color maleColor = inactiveContainerColor;

  int height = 0;
  int weight = 60;
  int age = 35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // colorChanger('Male');
                      maleColor = containerColor;
                      femaleColor = inactiveContainerColor;
                    });
                  },
                  child: ExpandedContainer(
                      maleColor, IconWidget(FontAwesomeIcons.mars, 'MALE')),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      femaleColor = containerColor;
                      maleColor = inactiveContainerColor;
                    });
                  },
                  child: ExpandedContainer(femaleColor,
                      IconWidget(FontAwesomeIcons.venus, 'FEMALE')),
                ),
              ),
            ]),
          ),
          Expanded(
              child: ExpandedContainer(
                  containerColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: styleOfText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            height.toString(),
                            style: styleOfOutput,
                          ),
                          Text(
                            'cm',
                            style: styleOfText,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 13.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          activeTrackColor: Color(0xFFEB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          trackHeight: 2.0,
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 0,
                            max: 300,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  ))),
          Expanded(
            child: Row(children: [
              Expanded(
                  child: ExpandedContainer(
                      containerColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: styleOfText,
                          ),
                          Text(
                            weight.toString(),
                            style: styleOfOutput,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              }),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  weight++;
                                });
                              })
                            ],
                          )
                        ],
                      ))),
              Expanded(
                  child: ExpandedContainer(
                      containerColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: styleOfText,
                          ),
                          Text(
                            age.toString(),
                            style: styleOfOutput,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              }),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              })
                            ],
                          )
                        ],
                      ))),
            ]),
          ),
          BottomButton(
            'CALCULATE',
            () {
              Calculator calc = Calculator(height, weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  calc.calculateBMI(),
                  calc.getResult(),
                  calc.getInterpretation()
                );
              }));
            },
          )
        ]));
  }
}


