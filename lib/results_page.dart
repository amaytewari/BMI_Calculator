import 'package:flutter/material.dart';
import 'reusable_classes.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String bmiWord;
  final String bmiMessage;

  ResultsPage(this.bmiResult, this.bmiWord, this.bmiMessage);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BMI CALCULATOR')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 40.0),
                  alignment: Alignment.bottomCenter,
                    child: Text('Your Result',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                        // textAlign: TextAlign.center,
                        ))),
            Expanded(
                flex: 5,
                child: ExpandedContainer(
                    containerColor,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(bmiWord.toUpperCase(),
                            style: TextStyle(
                              color: Color(0xFF24D876),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(bmiResult,
                            style: TextStyle(
                              fontSize: 100.0,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          bmiMessage,
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ))),
            BottomButton('RE-CALCULATE', () {
              Navigator.pop(context);
            })
          ],
        ));
  }
}
