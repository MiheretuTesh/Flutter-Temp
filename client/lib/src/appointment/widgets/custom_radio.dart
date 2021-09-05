import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomRadio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List _healthContidion = [
    new RadioModel(isSelected: false, buttonText: "Yes"),
    new RadioModel(isSelected: false, buttonText: "No")
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: Color(0xffd32026),
            onTap: () {
              setState(() {
                _healthContidion
                    .forEach((element) => element.isSelected = false);
                _healthContidion[index].isSelected = true;
              });
            },
            child: RadioItem(_healthContidion[index]),
          );
        },
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: Text(_item.buttonText,
                  style: TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: BoxDecoration(
              color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
              border: Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.blueAccent : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel({required this.isSelected, required this.buttonText});
}
