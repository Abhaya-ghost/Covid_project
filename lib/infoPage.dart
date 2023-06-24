import 'package:covid_project/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'constant.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: 'Get to know',
              textBottom: 'about Covid-19',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Symptoms",
                    style: kTitleTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SymptomCard(
                        image: "assets/images/headache.png",
                        title: "Headache",
                        isActive : true,
                      ),
                      SymptomCard(
                        image: "assets/images/fever.png",
                        title: "Fever",
                      ),
                      SymptomCard(
                        image: "assets/images/caugh.png",
                        title: "Cough",
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Prevention",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20,),
                  PreventionCard(
                    image: "assets/images/wear_mask.png",
                    title: "Wear face mask",
                    text: "Since the start of the Corona Virus outbreak some places have fully embraced wearing facemasks",
                  ),
                  SizedBox(height: 10,),
                  PreventionCard(
                    image: "assets/images/wash_hands.png",
                    title: "Wash your hands",
                    text: "Since the start of the Corona Virus outbreak some places have fully embraced wearing facemasks",
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventionCard({Key? key, required this.image, required this.title, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 150,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,10),
                    blurRadius: 30,
                    color: kShadowColor,
                  )
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                height: 130,
                width: MediaQuery.of(context).size.width-170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                          fontSize: 16
                      ),
                    ),
                    Text(
                      text,
                      style:const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({Key? key, required this.image, required this.title, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            isActive ?
            BoxShadow(
              offset:const Offset(0,10),
              blurRadius: 30,
              color: kActiveShadowColor,
            )
            : BoxShadow(
              offset: const Offset(0,3),
              blurRadius: 6,
              color: kShadowColor,
            )
          ]
      ),
      child: Column(
        children: [
          Image.asset(image),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

