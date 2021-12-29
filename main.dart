import 'package:basic_state/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subTitle, String price) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: selectedIndex == index
                      ? Colors.amberAccent
                      : Colors.white70)),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  selectedIndex == index
                      ? Image.asset(
                          'assets/images/check_two.png',
                          width: 18,
                          height: 18,
                          color: Colors.amberAccent,
                        )
                      : Image.asset(
                          'assets/images/check.png',
                          width: 18,
                          height: 18,
                          color: Colors.white70,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: planTextStyle,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        subTitle,
                        style: descTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 91,
                  ),
                  Text(
                    price,
                    style: priceTextStyle,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          children: <Widget>[
            Center(
                child: Image.asset('assets/images/icon_one.png',
                    width: 267, height: 200)),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Upgrade to',
                  style: titleStyle,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Pro',
                  style: blueTitleStyle,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Go Unlock all features and \nbuild your own business bigger',
              style: subTitleTexStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: <Widget>[
          Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(68), color: Colors.amber),
            child: Center(
              child: Text(
                'Check Out Now',
                style: buttonTextstyle,
              ),
            ),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              header(),
              option(0, 'Monthly', 'Good for starting up', '\$20'),
              option(1, 'Quarterly', 'Focusing on building', '\$55'),
              option(2, 'Yearly', 'steady Company', '\$220'),
              SizedBox(
                height: 10,
              ),
              selectedIndex == -1 ? SizedBox() : checkoutButton(),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
