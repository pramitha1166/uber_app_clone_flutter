import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uber_app/theme/colors.dart';
import 'package:uber_app/theme/styles.dart';
import 'package:uber_app/widgets/custom_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    const List<String> menu = ["Delivery", "Pickup", "Dine-In"];

    const List categories = [
      {"name": "Pickup", "icon": "assets/icons/pickup.svg"},
      {"name": "Grocery", "icon": "assets/icons/groceries.svg"},
      {"name": "Essentials", "icon": "assets/icons/essentials.svg"},
      {"name": "Fruits", "icon": "assets/icons/fruit.svg"},
      {"name": "Alcohols", "icon": "assets/icons/alcohols.svg"},
      {"name": "Deals", "icon": "assets/icons/deals.svg"},
    ];

    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(menu.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeMenu = index;
                        });
                      },
                      child: activeMenu == index
                          ? ElasticIn(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 8, top: 8),
                                  child: Row(children: [
                                    Text(
                                      menu[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            )
                          : ElasticIn(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 8, top: 8),
                                  child: Row(children: [
                                    Text(
                                      menu[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                    ),
                  );
                })),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 45,
                  width: size.width - 70,
                  decoration: BoxDecoration(
                    color: textFieldColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/pin_icon.svg",
                                width: 20,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("New York"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                Container(
                                  child: SvgPicture.asset(
                                    "assets/icons/time_icon.svg",
                                    width: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Now",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  child: SvgPicture.asset(
                    "assets/icons/filter_icon.svg",
                    width: 30,
                    color: Colors.black,
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            CustomSliderWidget(
              items: [
                "assets/images/slide_1.jpg",
                "assets/images/slide_2.jpg",
                "assets/images/slide_3.jpg",
              ],
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: textFieldColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(categories.length, (index) {
                        return Container(
                          margin: EdgeInsets.only(left: 40, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: SvgPicture.asset(
                                  categories[index]["icon"],
                                  width: 40,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                categories[index]["name"],
                                style: customContent,
                              )
                            ],
                          ),
                        );
                      })),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
