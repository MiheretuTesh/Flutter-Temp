// import 'package:flutter/material.dart';
// import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

// class RequestListScreen extends StatefulWidget {
//   static const String routeName = '/request';

//   @override
//   _RequestListScreenState createState() => _RequestListScreenState();
// }

// class _RequestListScreenState extends State<RequestListScreen> {
//   final _selectedItemColor = Color(0xFFD32026);
//   final _unselectedItemColor = Colors.white;
//   final _selectedBgColor = Colors.white;
//   final _unselectedBgColor = Color(0xFFD32026);
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   Color _getBgColor(int index) =>
//       _selectedIndex == index ? _selectedBgColor : _unselectedBgColor;

// // Color _getItemColor(int index) =>
// //     _selectedIndex == index ? _selectedItemColor : _unselectedItemColor;

//   Widget _buildIcon(IconData iconData, int index) => Container(
//         width: double.infinity,
//         height: kBottomNavigationBarHeight,
//         child: Material(
//           color: _getBgColor(index),
//           child: InkWell(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Icon(iconData),
//                 // Text(text,
//                 //     style: TextStyle(fontSize: 12, color: _getItemColor(index))),
//               ],
//             ),
//             onTap: () => _onItemTapped(index),
//           ),
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Text("Request"),
//           backgroundColor: Color(0xFFD32026),
//         ),
//         body: SafeArea(
//           child: ListView.builder(
//             itemCount: 10,
//             itemBuilder: (BuildContext context, int index) {
//               return _buildrequestCard();
//             },
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           selectedFontSize: 0,
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: _buildIcon(Icons.home, 0),
//               title: SizedBox.shrink(),
//             ),
//             BottomNavigationBarItem(
//               icon: _buildIcon(Icons.app_registration, 1),
//               title: SizedBox.shrink(),
//             ),
//             BottomNavigationBarItem(
//               icon: _buildIcon(Icons.schedule_outlined, 2),
//               title: SizedBox.shrink(),
//             ),
//             BottomNavigationBarItem(
//               icon: _buildIcon(Icons.notifications, 3),
//               title: SizedBox.shrink(),
//             ),
//             BottomNavigationBarItem(
//               icon: _buildIcon(Icons.settings, 4),
//               title: SizedBox.shrink(),
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: _selectedItemColor,
//           unselectedItemColor: _unselectedItemColor,
//         ),
//       ),
//     );
//   }

//   Widget _buildrequestCard() {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: Color(0xFFD32026),
//                     child: Text('AB',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold)),
//                   ),
//                   SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Car Accident",
//                           style: TextStyle(
//                             fontSize: 20,
//                           )),
//                       Text("1 Unit",
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w700,
//                           )),
//                       Text("Tikur Anbessa",
//                           style: TextStyle(
//                             fontSize: 14,
//                           )),
//                       Text("Condition",
//                           style: TextStyle(
//                             fontSize: 14,
//                           )),
//                       SizedBox(height: 10),
//                     ],
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding:EdgeInsets.only(left: 50),
//                 child: _buildRequestButtons(),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey[300],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildRequestButtons(){
//     return CustomCheckBoxGroup(
//                   buttonTextStyle: ButtonTextStyle(
//                     selectedColor: Colors.white,
//                     unSelectedColor: Color(0xFFD32026),
//                     textStyle: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                   unSelectedColor: Colors.white,
//                   buttonLables: <String>[
//                     "Accept",
//                     "Reject",
//                     "Share",
//                   ],
//                   buttonValuesList: <String>[
//                     "Accept",
//                     "Reject",
//                     "Share",
//                   ],
//                   checkBoxButtonValues: (values) {
//                     //Reminder: use indexe 0 to access the tapped checkbox
//                   },
//                   selectedBorderColor: Color(0xFFD32026),
//                   unSelectedBorderColor: Color(0xFFD32026),
//                   spacing: 0,
//                   horizontal: false,
//                   enableButtonWrap: false,
//                   absoluteZeroSpacing: true,
//                   selectedColor: Color(0xFFD32026),
//                   padding: 10,
//                 );
//   }
// }
