import 'package:bytecraftchallenge/src/widgets/calculator_button.dart';
import 'package:bytecraftchallenge/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstNum = 0; // First Number Entred
  int secondNum = 0; // Second Number Entred
  String history = ''; //
  String textToDisplay = ''; // Number that you actualy trying to tap or the result
  String res = ''; // the result of The operation
  String operation = ''; // the operation you trying to do



//This is The Function that Do The Calculation



  void btnOnClick(String btnValue) {
    print(btnValue);
    if (btnValue == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == '*' ||
        btnValue == '/') {
      firstNum = int.parse(textToDisplay);
      operation = btnValue;
      res = '';
    } else if (btnValue == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() +' '+ operation.toString() +' '+  secondNum.toString();
      } else if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() +' '+ operation.toString() +' '+ secondNum.toString();
      } else if (operation == '*') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + ' '+operation.toString() + ' '+ secondNum.toString();
      } else if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history = firstNum.toString() +
            ' ' +
            operation.toString() +
            ' ' +
            secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnValue).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }




  // Main Home Page
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kGreyShadeClr2,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.02),
                  child: Text(
                    history,
                    style: GoogleFonts.inter(
                        fontSize: width * 0.07, color: kTextSecondaryClr),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: width * 0.02 , bottom: height *0.03),
                alignment: const Alignment(1.0, 1.0),
                child: Text(
                  textToDisplay,
                  style: GoogleFonts.inter(
                      fontSize: width * 0.15, color: Colors.white),
                ),
              ),

              // Divider


              Divider(
                color: kSecondaryClr2,
                thickness: height * 0.01,
                height: 0,
              ),
              Container(
                color: kGreyShadeClr3,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: height * 0.01, top: height * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                            text: 'C',
                            color: kGreyShadeClr,
                            callback: () {
                              btnOnClick('C');
                            },
                          ),
                          CalculatorButton(
                            text: '(',
                            color: kGreyShadeClr,
                            callback: () {
                              btnOnClick('(');
                            },
                          ),
                          CalculatorButton(
                              text: ')',
                              color: kGreyShadeClr,
                              callback: () {
                                btnOnClick(')');
                              }),
                          Container(
                            width: 83,
                            height: 83,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: kGreyShadeClr,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(9))),
                                onPressed: () {
                                  setState(() {
                                    res = textToDisplay.substring(0 , textToDisplay.length - 1);
                                    textToDisplay = res;
                                    print(res);
                                  });
                                },
                                child: const Icon(
                                  Icons.backspace_outlined,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                              text: '7',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('7');
                              }),
                          CalculatorButton(
                              text: '8',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('8');
                              }),
                          CalculatorButton(
                              text: '9',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('9');
                              }),
                          CalculatorButton(
                              text: '/',
                              color: kPrimaryClr,
                              callback: () {
                                btnOnClick('/');
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                              text: '4',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('4');
                              }),
                          CalculatorButton(
                              text: '5',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('5');
                              }),
                          CalculatorButton(
                              text: '6',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('6');
                              }),
                          CalculatorButton(
                              text: '*',
                              color: kPrimaryClr,
                              callback: () {
                                btnOnClick('*');
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                              text: '1',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('1');
                              }),
                          CalculatorButton(
                              text: '2',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('2');
                              }),
                          CalculatorButton(
                              text: '3',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('3');
                              }),
                          CalculatorButton(
                              text: '-',
                              color: kPrimaryClr,
                              callback: () {
                                btnOnClick('-');
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                              text: '0',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('0');
                              }),
                          CalculatorButton(
                              text: '.',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('.');
                              }),
                          CalculatorButton(
                              text: '=',
                              color: kGreyShadeClr2,
                              callback: () {
                                btnOnClick('=');
                              }),
                          CalculatorButton(
                              text: '+',
                              color: kPrimaryClr,
                              callback: () {
                                btnOnClick('+');
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
