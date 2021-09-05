import 'package:eshiblood/src/appointment/widgets/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class AppointmentCreate extends StatefulWidget {
  static const routeName = 'appointmentAdd';

  @override
  _AppointmentCreateState createState() => _AppointmentCreateState();
}

class _AppointmentCreateState extends State<AppointmentCreate> {
  int _currentStep = 0;

  StepperType stepperType = StepperType.vertical;

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 5 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text('Health Condition'),
                    content: Column(
                      children: <Widget>[
                        Text(
                          'Are you in good health condition?',
                        ),
                        CustomRadio(),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Weight'),
                    content: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: DropdownSearch<int>(
                                label: "Weight",
                                showSearchBox: true,
                                items: [for (var i = 45; i < 150; i += 1) i],
                                // validator: (int i) {
                                //   if (i == 0) {
                                //     return "Required failed!";
                                //   }
                                // },
                                // onFind: (String filter) async {
                                //   // var response = await Dio().get(
                                //   //   "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
                                //   //   queryParameters: {"filter": filter},
                                //   // );
                                //   var models = [1, 2, 3];

                                //   return models;
                                // },
                                onChanged: (value) {
                                  print(value);
                                },
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 20,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Kg",
                                style: TextStyle(
                                  color: Color(0xffd32026),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Tatoo'),
                    content: Column(
                      children: <Widget>[
                        Text(
                          'Did you get tatoo within the last 12 months?',
                        ),
                        CustomRadio(),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Donation Center'),
                    content: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: DropdownSearch<int>(
                                label: "Donation Center",
                                items: [for (var i = 45; i < 150; i += 1) i],
                                showSearchBox: true,

                                // onFind: (String filter) async {
                                //   // var response = await Dio().get(
                                //   //   "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
                                //   //   queryParameters: {"filter": filter},
                                //   // );
                                //   var models = [1, 2, 3];

                                //   return models;
                                // },
                                onChanged: (value) {
                                  print(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 3
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Date'),
                    content: Column(
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () {
                              showDateRangePicker(
                                context: context,
                                initialDateRange: DateTimeRange(
                                  start: DateTime.now(),
                                  end: DateTime.now().add(
                                    Duration(days: 30),
                                  ),
                                ),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  Duration(days: 30),
                                ),
                              );
                            },
                            child: Text("Choose Date Range"))
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 4
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Pregnant'),
                    content: Column(
                      children: <Widget>[
                        Text(
                          'Are you pregnant?',
                        ),
                        CustomRadio(),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 5
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
