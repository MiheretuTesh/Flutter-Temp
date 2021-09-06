import 'package:eshiblood/src/admin/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class CreateDonationCenterScaffold extends StatelessWidget {
  const CreateDonationCenterScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Donation Center"),
        backgroundColor: Color(0xffd32026),
      ),
      drawer: NavigationDrawerWidget(),
      body: CreateDonationCenter(),
    );
  }
}

class CreateDonationCenter extends StatefulWidget {
  const CreateDonationCenter({Key? key}) : super(key: key);

  @override
  _CreateDonationCenterState createState() => _CreateDonationCenterState();
}

class _CreateDonationCenterState extends State<CreateDonationCenter> {
  List stateList = [
    "Addis Ababa",
    "Amhara",
    "Afar",
    "SNNP",
    "Oromia",
    "Harar",
    "Gambela",
    "Benishangul",
    "Somali",
    "Tigray",
    "Sidama",
  ];
  String stateAddr = "Addis Ababa";

  Map<String, List<String>> zoneMap = {
    "Addis Ababa": [
      "Addis Ketema",
      "Akaki Kality",
      "Arada",
      "Bole",
      "Gullele",
      "Kirkos",
      "Kolfe Keranio",
      "Lideta",
      "Nifas Silk lafto",
      "Yeka"
    ],
    "Amhara": [
      "Agew",
      "East Gojam",
      "Oromia zone",
      "North Gondar",
      "North Shewa",
      "North Wollo",
      "South Gondar",
      "South Wollo",
      "Wag Hemra",
      "West Gojjam",
      "Bahir Dar"
    ],
    "Afar": [
      "Awsi Rasu",
      "Kilbet Rasu",
      "Gabi Rasu",
      "Fanti Rasu",
      "Hari Rasu",
      "Argobba"
    ],
    "SNNP": [
      "Bench Sheko Zone",
      "Dawro Zone",
      "Gamo Zone",
      "Gofa Zone",
      "Gedeo Zone",
      "Gurage Zone",
      "Hadiya Zone",
      "Keffa Zone",
      "Kembata Tembaro Zone",
      "Sheka Zone",
      "Silt'e Zone",
      "Debub Omo Zone",
      "Wolayita Zone",
      "Alaba Zone",
      "Konso Zone",
      "West OMO Zone"
    ],
    "Tigray": [
      "Mekelle Zone",
      "Central Zone",
      "East Zone",
      "North West Zone",
      "South Zone",
      "South East Zone",
      "West Zone"
    ],
    "Oromia": [
      "Arsi Zone",
      "Bale Zone",
      "Borena Zone",
      "East Hararghe Zone",
      "East Shewa Zone",
      "East Welega Zone",
      "Guji Zone",
      "Horo Guduru Welega Zone",
      "Illubabor Zone",
      "Jimma Zone",
      "Kelem Welega Zone",
      "North Shewa Zone",
      "South West Shewa Zone",
      "West Arsi Zone",
      "West Hararghe Zone",
      "West Shewa Zone",
      "West Welega Zone",
      "Adama Special Zone",
      "Jimma Special Zone",
      "Oromia Special Zone"
    ],
    "Harar": ["Harar Zone"],
    "Gambela": ["Anywaa", "Majang", "Nuer"],
    "Benishangul": ["Asosa", "Kamachi", "Metekel"],
    "Somali": [
      "Afder Zone",
      "Jarar Zone",
      "Nogob Zone",
      "Gode Zone",
      "Fafan Zone",
      "Korahe Zone",
      "Liben Zone",
      "Sitti Zone",
      "Dollo Zone",
      "Dawa Zone"
    ],
    "Sidama": ["Sidama Zone"],
    "Dire Dawa": ["SubCity 1", "SubCity 2"]
  };
  String zoneAddr = "Addis Ketema";

  Map<String, List<String>> weredaMap = {
    "Afar": [
      "Afambo",
      "Asayita",
      "Chifra",
      "Dubti",
      "Elidar",
      "Kori",
      "Mille",
      "Ada'ar",
      "Garani",
      "Kilalu",
      "Abala",
      "Afdera"
    ],
    "Addis Ababa": [
      "Addis Ketema",
      "Akaki Kality",
      "Arada",
      "Bole",
      "Gullele",
      "Kirkos",
      "Kolfe Keranio",
      "Lideta",
      "Nifas Silk lafto",
      "Yeka"
    ],
    "Amhara": [
      "Addi Arkay",
      "Beyeda",
      "Jan Amora",
      "Debarq",
      "Dabat",
      "Mirab Armachiho",
      "Lay Armachiho",
      "Wegera",
      "Gondar Zuria",
      "Dembiya",
      "Chilga",
      "Metemma",
      "Qwara",
      "Alefa",
      "Mirab Belessa",
      "Misraq Belessa",
      "Gondar",
      "Tach Armachiho",
      "Takusa",
      "Bugna",
      "Kobo",
      "Gidan",
      "Meket",
      "Alamata",
      "Wadla",
      "Delanta",
      "Guba Lafto",
      "Habru",
      "Woldiya",
      "Lasta",
      "Dawunt",
      "Mida Woremo",
      "Merhabete",
      "Ensaro",
      "Moretna Jiru",
      "Menz Gera Midir",
      "Geshe",
      "Antsokiyana Gemza",
      "Efratana Gidim",
      "Menz Mam Midir",
      "Termaber",
      "Mojana Wadera",
      "Kewet",
      "Angolalla Tera",
      "Asagirt",
      "Ankober",
      "Hagere Mariamna Kesem",
      "Berehet",
      "Minjarna Shenkora",
      "Basona Werana",
      "Debre Berhan",
      "Menz Keya Gebreal",
      "Menz Lalo Midir",
      "Siyadebrina Wayu",
    ],
    "Benishangul": [
      "Assosa",
      "Bambasi",
      "Komesha",
      "Kurmuk",
      "Menge",
      "Oda Bildigilu",
      "Sherkole",
      "Agalo Mite",
      "Belo Jegonfoy",
      "Kamashi",
      "Sadal",
      "Yaso",
      "Mandura",
      "Dangur",
      "Guba",
      "Dibate",
      "Bulen",
      "Wenbera",
    ],
    "Gambela": [
      "Abobo",
      "Dimma",
      "Gambela",
      "Gog",
      "Jor",
      "Jikawo",
      "Lare",
      "Akobo",
      "Matar",
      "Makuey",
      "Godere",
      "Mengesh",
    ],
    "Oromia": [
      "Babille",
      "Bedeno",
      "Chinaksen",
      "Deder",
      "Fedis",
      "Girawa",
      "Gola Oda",
      "Goro Gutu",
      "Haromaya",
      "Jarso",
      "Kersa",
      "Kombolcha",
      "Kurfa Chele",
      "Malka Balo",
      "Meta",
      "Meyumuluke",
      "Midhega Tola",
      "Deder",
      "Babille",
      "Awaday",
      "Haramaya",
      "Goro muti",
      "Qumbii",
      "Dire xiyara",
      "Haro Limmu",
      "Leka Dulecha",
      "Ibantu",
      "Jimma Arjo",
      "Limmu",
      "Nekemte",
      "Nunu Kumba",
      "Sasiga",
      "Sibu Sire",
      "Wama Hagalo",
      "Wayu Tuka",
      "Kiramu",
      "Gida Ayana",
      "Gobu sayo",
      "Gudaya bila",
      "Guto Gida",
      "Gida kiramu",
      "Guto Wayu",
    ],
    "Somali": [
      "Danot",
      "Warder",
      "Daratolle",
      "Lehel-Yucub",
      "Gal-Hamur",
      "Bokh",
      "Galadi",
      "Fik",
      "Xamaro",
      "Lagahida",
      "Salaxaad",
      "Mayu-Muuqdheer",
      "Qubi",
      "Yaxoob",
      "Waangay",
      "Adadle",
      "Danan",
      "Ferfer",
      "Beercaano",
      "Gode",
      "Imiberi",
      "Kelafo",
      "Mustahil",
      "Elele",
      "Abaaqoorow",
      "Ana Lemo",
      "Duna",
      "Gibe",
      "Gomibora",
      "Hosaena",
      "Lemo",
      "Mirab Badawacho",
      "Misha",
      "Misraq Badawacho",
      "Shashogo",
      "Soro",
      "Bita",
      "Bonga",
      "Chena",
      "Cheta",
      "Decha",
      "Gesha",
      "Gewata",
      "Ginbo",
      "Menjiwo",
      "Sayilem",
      "Telo",
    ],
    "SNNP": [
      "Awasa",
      "Badawacho",
      "Bena Tsemay",
      "Bench",
      "Boreda Abaya",
      "Dita Dermalo",
      "Goro",
      "Hamer Bena",
      "Isara Tocha",
      "Konteb",
      "Loma Bosa",
      "Mareka Gena",
      "Masha Anderacha",
      "Meskanena Mareko",
      "Meinit",
      "Omo Sheleko",
      "Zala Ubamale",
      "Bule",
      "Dila",
      "Dila Zuria",
      "Gedeb",
      "Kochere",
      "Wenago",
      "Yirgachefe",
    ],
    "Sidama": [
      "Aleta Wendo",
      "Arbegona",
      "Aroresa",
      "Awasa Zuria",
      "Bensa",
      "Bona Zuria",
      "Boricha",
      "Bursa",
      "Chere",
      "Chuko",
      "Dale",
      "Dara",
      "Gorche",
      "Hula",
      "Loko Abaya",
      "Malga",
      "Shebedino",
      "Wensho",
      "Wondo Genet",
    ],
    "Tigray": [
      "Alaje",
      "Alamata",
      "Endamehoni",
      "Maichew",
      "Raya Azebo",
      "Enderta",
      "Hintalo Wajirat",
      "Samre",
      "Degua Tembien",
      "Abergele",
      "Adwa",
      "Enticho",
      "Kola Tembien",
      "La'ilay Maychew",
      "Mereb Lehe",
      "Naeder Adet",
      "Tahtay Maychew",
      "Werie Lehe",
      "Kafta Humera",
      "Tsegede",
      "Welkait",
      "Atsbi Wenberta",
      "Ganta Afeshum",
      "Gulomahda",
      "Hawzen",
      "Irob",
      "Saesi Tsaedaemba",
      "Kilte Awulaelo",
    ],
    "Dire Dawa": [
      "Kezira",
      "Megala",
    ],
    "Harar": ["Harar"],
  };
  String weredaAddr = "Addis Ketema";
  String cityAddr = "01";

  Map<String, List<String>> cityMap = {
    "Addis Ababa": [
      "01",
      "02",
      "03",
      "04",
      "05",
      "06",
      "07",
      "08",
      "09",
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19",
      "20",
      "21",
      "22",
      "23",
      "24",
      "25",
      "26",
      "27",
      "28",
    ],
    "Amhara": [
      "Gondar",
      "Bahir Dar",
      "Dessie",
      "Debre Birhan",
      "Debre Mark'os",
      "Kombolcha",
      "Debre Tabor",
      "Weldiya",
      "Mota",
      "Finote Selam",
      "Kobo",
      "Dangila"
    ],
    "Benishangul": [
      "Assosa",
    ],
    "Harar": ["Harar"],
    "Gambela": ["Gambela"],
    "Oromia": [
      "Adama",
      "Jimma",
      "Shashamane",
      "Bishoftu",
      "Nekemte",
      "Asella",
      "Sebeta",
      "Burayu",
      "Ambo",
      "Arsi Negele",
      "Bale Robe",
      "Ziway",
      "Waliso",
      "Meki",
      "Negele Borana",
      "Chiro",
      "Goba",
      "Gimbi",
      "Haramaya",
      "Mojo",
      "Dembi Dolo",
      "Metu",
      "Fiche",
      "Bule Hora Town",
      "Agaro",
    ],
    "Sidama": [
      "Awassa",
      "Yirgalem",
    ],
    "SNNP": [
      "Sodo",
      "Arba Minch",
      "Hosaena",
      "Dilla",
      "Butajira",
      "Areka",
      "Welkite",
      "Alaba Kulito",
      "Tepi",
      "Durame",
      "Boditi",
      "Mizan Teferi",
      "Sawla",
      "Aleta Wendo",
      "Bonga",
      "Jinka",
      "Dimtu"
    ],
    "Somali": [
      "Jijiga",
      "Gode",
      "Degehabur",
    ],
    "Tigray": [
      "Mekelle",
      "Adigrat",
      "Shire (Inda Selassie)",
      "Aksum",
      "Adwa",
      "Alamata",
      "Wukro",
    ]
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          // width: 350,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 24),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(25)),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: HorizontalDivider(
                    label: "Address",
                    height: 1,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row(
                  //   children: [

                  //   ],
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            color: Colors.black12,
                            offset: Offset(1, 1),
                            spreadRadius: 1)
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("State"),
                          SizedBox(
                            width: 20,
                          ),
                          AddressDropDownMenu(
                              currentDropDownItem: this.stateAddr,
                              dropDownItems: this.stateList)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                color: Colors.black12,
                                offset: Offset(1, 1),
                                spreadRadius: 1)
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Wereda"),
                              SizedBox(),
                              AddressDropDownMenu(
                                  currentDropDownItem: this.weredaAddr,
                                  dropDownItems:
                                      this.weredaMap[this.stateAddr]!)
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.black12,
                                  offset: Offset(1, 1),
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("City"),
                                SizedBox(),
                                AddressDropDownMenu(
                                    currentDropDownItem: this.cityAddr,
                                    dropDownItems:
                                        this.cityMap[this.stateAddr]!)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: HorizontalDivider(
                  label: "Time Slot",
                  height: 1,
                ),
              ),
              TimeSlotPicker(),
              SizedBox(
                height: 40,
              ),
              CreateDonationButton()
            ],
          ),
        ),
      ],
    );
  }
}

class CreateDonationButton extends StatelessWidget {
  const CreateDonationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          print("clicked");
        },
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Text(
            "Create",
            style: TextStyle(fontSize: 24, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

class TimeSlotPicker extends StatefulWidget {
  const TimeSlotPicker({
    Key? key,
  }) : super(key: key);

  @override
  _TimeSlotPickerState createState() => _TimeSlotPickerState();
}

class _TimeSlotPickerState extends State<TimeSlotPicker> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2022),
            ).then((value) {
              print(value);
              startDate = value!;
              setState(() {});
            });
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      color: Colors.black12,
                      offset: Offset(2, 2),
                      spreadRadius: 1)
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 24,
                  ),
                  Text("Start Date"),
                  Text(startDate.toString().split(" ")[0].replaceAll("-", "/")),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: endDate,
              firstDate: startDate,
              lastDate: DateTime(2022),
            ).then((value) {
              print(value);
              endDate = value!;
              setState(() {});
            });
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      color: Colors.black12,
                      offset: Offset(2, 2),
                      spreadRadius: 1)
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 24,
                  ),
                  Text("End Date"),
                  Text(endDate.toString().split(" ")[0].replaceAll("-", "/")),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AddressDropDownMenu extends StatefulWidget {
  List dropDownItems;
  String currentDropDownItem;

  AddressDropDownMenu(
      {required this.currentDropDownItem, required this.dropDownItems});
  @override
  _AddressDropDownMenuState createState() =>
      _AddressDropDownMenuState(currentDropDownItem, dropDownItems);
}

class _AddressDropDownMenuState extends State<AddressDropDownMenu> {
  String currentDropDownItem;
  List dropDownItems;
  _AddressDropDownMenuState(this.currentDropDownItem, this.dropDownItems) {}
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: this.currentDropDownItem,
      onChanged: (newValue) {
        setState(() {
          this.currentDropDownItem = newValue.toString();
        });
      },
      items: dropDownItems.map(
        (addr) {
          return DropdownMenuItem(
            child: Text(addr),
            value: addr,
          );
        },
      ).toList(),
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  final String? label;
  final double? height;

  HorizontalDivider({this.label, this.height});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 10.0, right: 15.0),
          child: Divider(
            color: Color(0xffd32026),
            height: height ?? 1,
          ),
        ),
      ),
      Text(
        label ?? '',
        style: TextStyle(color: Color(0xffd32026)),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 15.0, right: 10.0),
          child: Divider(
            color: Color(0xffd32026),
            height: height ?? 1,
          ),
        ),
      )
    ]);
  }
}
