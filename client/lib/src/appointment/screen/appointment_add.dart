import 'package:dio/dio.dart';
import 'package:eshiblood/src/appointment/models/appointment.dart';
import 'package:eshiblood/src/appointment/screen/appointment_list.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:eshiblood/src/appointment/bloc/blocs.dart';
import 'package:eshiblood/src/appointment/data_provider/appointment_data_provider.dart';
import 'package:eshiblood/src/appointment/widgets/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'appointment_argument.dart';

class AddAppointment extends StatefulWidget {
  static const routeName = 'appointmentAdd';
  final AppointmentArgument args;
  AddAppointment({required this.args});

  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  DateTimeRange? dateRange = DateTimeRange(
      start: DateTime.now(), end: DateTime.now().add(Duration(days: 15)));

  String? getFrom() {
    if (dateRange == null) {
      setState(() {
        this._appointment["startDate"] =
            DateFormat("ymd").format(DateTime.now());
      });
      return DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now());
    } else {
      this._appointment["startDate"] =
          DateFormat("ymd").format(dateRange!.start);

      return DateFormat('EEE, MMM d, ' 'yy').format(dateRange!.start);
    }
  }

  String? getUntil() {
    if (dateRange == null) {
      this._appointment["endDate"] =
          DateFormat("ymd").format(DateTime.now().add(Duration(days: 15)));
      return DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now().add(
        Duration(days: 15),
      ));
    } else {
      this._appointment["endDate"] = DateFormat("ymd").format(dateRange!.end);
      return DateFormat('EEE, MMM d, ' 'yy').format(dateRange!.end);
    }
  }

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _appointment = {
    "healthCondition": "Yes",
    "weight": 45,
    "tattoo": "No",
    "donationCenter": "",
    "appointmentDescription": "Appointment due to shortage",
    "pregnant": "No"
  };

  onSubmit() {
    print("object");
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      final AppointmentEvent event = widget.args.edit
          ? AppointmentUpdate(
              Appointment(
                id: widget.args.appointment?.id,
                startDate: this._appointment["startDate"],
                endDate: this._appointment["endDate"],
                appointmentDescription:
                    this._appointment["appointmentDescription"],
                weight: this._appointment["weight"],
                healthCondition: this._appointment["healthCondition"],
                tattoo: this._appointment["tattoo"],
                donationCenter: this._appointment["donationCenter"],
                pregnant: this._appointment["pregnant"],
              ),
            )
          : AppointmentCreate(
              Appointment(
                id: null,
                startDate: this._appointment["startDate"],
                endDate: this._appointment["endDate"],
                appointmentDescription:
                    this._appointment["appointmentDescription"],
                weight: this._appointment["weight"],
                healthCondition: this._appointment["healthCondition"],
                tattoo: this._appointment["tattoo"],
                donationCenter: this._appointment["donationCenter"],
                pregnant: this._appointment["pregnant"],
              ),
            );
      BlocProvider.of<AppointmentBloc>(context).add(event);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppointmentList.routeName, (route) => false);
    }
  }

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    setState(() => _currentStep < 5 ? _currentStep += 1 : onSubmit());
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.args.appointment);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${widget.args.edit ? "Edit Appointment" : "Add  Appointment"}'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
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
                        title: Text('Health Condition'),
                        content: Column(
                          children: <Widget>[
                            Text(
                              'Are you in good health condition?',
                            ),
                            CustomRadio(
                              conditions: [
                                RadioModel(
                                  isSelected:
                                      this._appointment["healthCondition"] ==
                                              "Yes"
                                          ? widget.args.edit
                                              ? widget.args.appointment
                                                      ?.healthCondition ==
                                                  "Yes"
                                              : true
                                          : false,
                                  buttonText: "Yes",
                                  onClicked: () {
                                    print("Yes");
                                    setState(() {
                                      this._appointment["healthCondition"] =
                                          "Yes";
                                    });
                                  },
                                ),
                                RadioModel(
                                  isSelected:
                                      this._appointment["healthCondition"] ==
                                              "No"
                                          ? widget.args.edit
                                              ? widget.args.appointment
                                                      ?.healthCondition ==
                                                  "No"
                                              : true
                                          : false,
                                  buttonText: "No",
                                  onClicked: () {
                                    print("No");

                                    setState(() {
                                      this._appointment["healthCondition"] =
                                          "No";
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: Text('Weight'),
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
                                    items: [
                                      for (var i = 45; i < 150; i += 1) i
                                    ],
                                    selectedItem: 45,
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
                                      setState(() {
                                        this._appointment["weight"] = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    "Kg",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
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
                        title: Text('Tattoo'),
                        content: Column(
                          children: <Widget>[
                            Text(
                              'Did you get tattoo within the last 12 months?',
                            ),
                            CustomRadio(
                              conditions: [
                                RadioModel(
                                  isSelected: this._appointment["tattoo"] ==
                                          "Yes"
                                      ? widget.args.edit
                                          ? widget.args.appointment?.tattoo ==
                                              "Yes"
                                          : true
                                      : false,
                                  buttonText: "Yes",
                                  onClicked: () {
                                    print("tattoo yes");
                                    setState(() {
                                      this._appointment["tattoo"] = "Yes";
                                    });
                                  },
                                ),
                                RadioModel(
                                  isSelected: this._appointment["tattoo"] ==
                                          "No"
                                      ? widget.args.edit
                                          ? widget.args.appointment?.tattoo ==
                                              "No"
                                          : true
                                      : false,
                                  buttonText: "No",
                                  onClicked: () {
                                    setState(() {
                                      this._appointment["tattoo"] = "No";
                                    });
                                    print("tatoo no");
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: Text('Donation Center'),
                        content: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: DropdownSearch<dynamic>(
                                    validator: (dynamic item) {
                                      if (item == null)
                                        return "Required field";
                                      else
                                        return null;
                                    },
                                    dropdownSearchDecoration: InputDecoration(
                                      filled: true,
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFFFEBEE)),
                                      ),
                                    ),
                                    showAsSuffixIcons: true,
                                    clearButtonBuilder: (_) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Icon(
                                        Icons.clear,
                                        size: 24,
                                        color: Colors.black,
                                      ),
                                    ),
                                    label: "Donation Center",
                                    showClearButton: true,
                                    showSearchBox: true,
                                    isFilteredOnline: true,
                                    onFind: (String? filter) async {
                                      var response = await Dio().get(
                                          "http://192.168.1.11:8000/api/v1/donationCenters",
                                          // queryParameters: {"city": filter},
                                          options: Options(
                                            headers: {
                                              "accept": "/",
                                              // For latter use commented
                                              "Authorization":
                                                  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVkN2E1MTRiNWQyYzEyYzc0NDliZTAyMCIsImlhdCI6MTYzMDkwOTE4OCwiZXhwIjo2MDAwMDAxNjMwOTA5MTg4fQ.40rcSvFHLaOewid4AlGIFWwNvEy6KbC5BiGihuJtRyQ",
                                              "Content-Type": "application/json"
                                            },
                                          )
                                          // queryParameters: {"filter": filter},
                                          );
                                      var models =
                                          response.data["result"]["docs"];
                                      var names = [];
                                      for (var item in models) {
                                        names.add(item["name"]);
                                      }
                                      this._appointment["donationCenter"] =
                                          names.length > 0 ? names[0] : "";

                                      return names;
                                    },
                                    onChanged: (value) {
                                      print(value);
                                      this._appointment["donationCenter"] =
                                          value;
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
                        title: Text('Date'),
                        content: Column(
                          children: <Widget>[
                            Text(
                                "Schedule your appointment with in the next 15 days (DD/MM/yyyy)\n"),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  height: 50,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      color: Colors.blueAccent),
                                  child: Center(
                                    child: Text(
                                      getFrom()!,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    child: Center(
                                      child: Text(" - "),
                                    ),
                                    width: 20),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 268,
                                  height: 50,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      color: Colors.redAccent),
                                  child: Center(
                                    child: Text(
                                      getUntil()!,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  pickDateRange(context);
                                },
                                child: Text("Choose Date Range"),
                              ),
                            )
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 4
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: Text('Pregnant'),
                        content: Column(
                          children: <Widget>[
                            Text(
                              'Are you pregnant?',
                            ),
                            CustomRadio(
                              conditions: [
                                RadioModel(
                                  isSelected: this._appointment["pregnant"] ==
                                          "Yes"
                                      ? widget.args.edit
                                          ? widget.args.appointment?.pregnant ==
                                              "Yes"
                                          : true
                                      : false,
                                  buttonText: "Yes",
                                  onClicked: () {
                                    print("pregnant Yes");
                                    setState(() {
                                      this._appointment["pregnant"] = "Yes";
                                    });
                                  },
                                ),
                                RadioModel(
                                  isSelected: this._appointment["pregnant"] ==
                                          "No"
                                      ? widget.args.edit
                                          ? widget.args.appointment?.pregnant ==
                                              "No"
                                          : true
                                      : false,
                                  buttonText: "No",
                                  onClicked: () {
                                    print("pregnant No");
                                    setState(() {
                                      this._appointment["pregnant"] = "No";
                                    });
                                  },
                                ),
                              ],
                            ),
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
        ),
      ),
    );
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(
          Duration(days: 15),
        ));

    final DateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 15),
      ),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (DateRange == null) return;
    setState(() => dateRange = DateRange);
  }
}
