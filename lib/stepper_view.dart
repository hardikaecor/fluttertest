import 'package:first_flutter_app/my_edittext.dart';
import 'package:flutter/material.dart';

class MyStepperView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper view"),
      ),
      body: MyStepper(),
    );
  }
}

class MyStepper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyStepperState();
  }
}

class MyStepperState extends State<MyStepper> {
  int current_step = 0;

  List<Step> stepList = [
    Step(
        title: Text("Step 1"),
        content: Container(
          child: Column(
            children: <Widget>[Text("Food"), Image.asset("images/food.jpg")],
          ),
        ),
        isActive: true,
        state: StepState.editing),
    Step(
        title: Text("Step 2"),
        content: Container(child: MyEditText()),
        isActive: true,
        state: StepState.editing),
    Step(
        title: Text("Step 3"),
        content: Container(
          child: Text("nice one!!!"),
        ),
        isActive: true,
        state: StepState.editing)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stepper(
        steps: stepList,
        currentStep: current_step,
        onStepCancel: () {
          setState(() {
            if (current_step > 0) {
              current_step -= 1;
            } else {
              current_step = 0;
            }
          });
        },
        onStepTapped: (step) {
          setState(() {
            current_step = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (current_step < stepList.length - 1) {
              current_step += 1;
            }else{
              current_step = 0;
            }
          });
        },
        type: StepperType.vertical,
      ),
    );
  }
}
