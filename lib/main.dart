import 'package:covid_project/constant.dart';
import 'package:covid_project/infoPage.dart';
import 'package:covid_project/widgets/header.dart';
import 'package:covid_project/widgets/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kBodyTextColor),
        )
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var valChoose;
  List mapVal = [
    "India" , "USA" , "Russia" , "China" , "Australia"
  ];
  var time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
            textBottom: "is stay at home",
          ),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/maps-and-flags.svg",height: 20,),
                const SizedBox(width: 20,),
                Expanded(
                  child: DropdownButton(
                    isExpanded : true,
                    icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                    value: valChoose,
                    onChanged: (mapValue) {
                      setState(() {
                        valChoose = mapValue;
                      });
                    },
                    items: mapVal.map((mapValue) {
                      return DropdownMenuItem(
                        value: mapValue,
                        child: Text(mapValue),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Case Update\n",
                            style: kTitleTextstyle
                          ),
                          TextSpan(
                            text: "Newest Update ${DateFormat('MMMMd').format(time)}",
                            style: const TextStyle(
                              color: kTextLightColor,
                            )
                          )
                        ]
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "See Details",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),],
                  ),
                  child:const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Details(number: 1046, color: kInfectedColor, title: 'Infected'),
                      Details(number: 87, color: kDeathColor, title: 'Death'),
                      Details(number: 100, color: kRecovercolor, title: 'Recovered'),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spread of Virus",
                      style: kTitleTextstyle,
                    ),
                    Text(
                      "See Details",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.all(20),
                  height: 165,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 30,
                        color: kShadowColor,
                      )
                    ]
                  ),
                  child: Image.asset(
                    "assets/images/map.png",
                    fit: BoxFit.contain,
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


