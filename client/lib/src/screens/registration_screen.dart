import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScaffold extends StatelessWidget {
  const RegisterScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: RegisterWidget(),
    );
  }
}

class RegisterWidget extends StatelessWidget {
  RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileWidget(),
                TextFieldWidget(
                  "First Name",
                  "First Name",
                  Icon(
                    Icons.person,
                    color: Color(0xFFD32026),
                  ),
                ),
                TextFieldWidget(
                  "Last Name",
                  "Last Name",
                  Icon(
                    Icons.person,
                    color: Color(0xFFD32026),
                  ),
                ),
                TextFieldWidget(
                    "Phone Number",
                    "+2519********",
                    Icon(
                      Icons.phone,
                      color: Color(0xFFD32026),
                    ),
                    textInputType: TextInputType.phone),
                TextFieldWidget(
                  "Email",
                  "Email",
                  Icon(
                    Icons.mail_outline,
                    color: Color(0xFFD32026),
                  ),
                  textInputType: TextInputType.emailAddress,
                ),
                TextFieldWidget(
                  "Password",
                  "Password",
                  Icon(
                    Icons.lock,
                    color: Color(0xFFD32026),
                  ),
                  obsecureText: true,
                ),
                TextFieldWidget(
                  "Re-enter Password",
                  "Re-enter Password",
                  Icon(
                    Icons.lock,
                    color: Color(0xFFD32026),
                  ),
                  obsecureText: true,
                ),
                // ElevatedButton(
                //     onPressed: () => {
                //           showDatePicker(
                            
                //             context: context,
                            
                //             initialDate: DateTime.now(),
                //             firstDate: DateTime(2020),
                //             lastDate: DateTime(2022),
                //           )
                //         },
                //     child: Text("date")),
                Center(
                  child: GestureDetector(

                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 360,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(50)),
                      child: Center(child: Text("dd/mm/yyyy")),
                    ),
                    onTap: ()=>{
                    print("tapped"),
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2022),
                          )
                  },
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () async => {
                  // await _picker.pickImage(source: ImageSource.gallery)
                  await _picker
                      .pickImage(source: ImageSource.gallery)
                      .then((value) => print(value!.path))
                },
                child: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1),
                      shape: BoxShape.circle),
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    "assets/images/person.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(offset: Offset(1, 1))],
                  ),
                  child: IconButton(
                    onPressed: () async =>
                        {await _picker.pickImage(source: ImageSource.gallery)},
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                    iconSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
            child: Text(
          "Profile",
          style: TextStyle(
            fontSize: 22,
          ),
        )),
      ],
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  String label;

  Icon icon;

  String hint;

  TextInputType textInputType;

  bool obsecureText;

  bool readOnly=false;

  

  TextFieldWidget(String this.label, String this.hint, Icon this.icon,
      {bool this.obsecureText = false,
      TextInputType this.textInputType = TextInputType.text,bool this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(
          height: 1.8,
          fontSize: 20,
        ),
        readOnly: this.readOnly,
        obscureText: this.obsecureText,
        keyboardType: this.textInputType,
        cursorColor: Color(0xFFD32026),
        decoration: InputDecoration(
          hintText: this.hint,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
          labelText: this.label,
          labelStyle: TextStyle(color: Colors.redAccent, fontSize: 14),
          prefixIcon: this.icon,
          contentPadding: EdgeInsets.only(left: 20),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD32026), width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD32026), width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
