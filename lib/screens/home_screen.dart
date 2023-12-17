import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVpnOn = false;
  bool emptyText = true;
  String stateVpn = 'بزن وصل شو';
  int second = 0;
  Timer? _timer;

@override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _vpnState() {
    setState(() {
      isVpnOn =! isVpnOn;
      emptyText =! emptyText;

      if(isVpnOn) {
        stateVpn = 'وصل شدی';
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            second++;
          });
        });
      } else {
        stateVpn = 'بزن وصل شو';
        second = 0;
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xff0F1621),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 170,
              child: DrawerHeader(
                decoration: BoxDecoration(
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 48,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                 'بیست روز باقی مانده',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                               Text(
                                 'username ID',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffD1D3D4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'خرید اشتراک',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FaIcon(
                        FontAwesomeIcons.creditCard,
                        size: 24,
                        color: Colors.white,
                      ),
              
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'پشتیبانی تلگرام',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FaIcon(
                        FontAwesomeIcons.user,
                        size: 24,
                        color: Colors.white,
                      ),
              
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'کانال تلگرام',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FaIcon(
                        FontAwesomeIcons.telegram,
                        size: 24,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            // height: 753,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 1],
                colors: [
                  isVpnOn ? Color.fromARGB(255, 240, 12, 12) : Color.fromARGB(255, 110, 4, 14), 
                  Color(0xff101f2d),
                ],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Scaffold.of(context).openDrawer();
                          });
                        },
                        child: Image.asset(
                          'assets/images/list_botton.png',
                          width: 24,
                          height: 20,
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 80,
                          ),
                        ],
                      ),
                      Text(
                        '    ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 110,
                ),
                Text(
                  stateVpn,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    _vpnState();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/power.png',
                        height: 160,
                      ), 
                      FaIcon(
                        isVpnOn ? FontAwesomeIcons.stop 
                        : FontAwesomeIcons.powerOff ,
                        color: Colors.white,
                        size: 45,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: isVpnOn,
                  child: Text(
                  '${(second ~/ 3600).toString().padLeft(2,'0')}:'
                  '${((second % 3600) ~/ 60).toString().padLeft(2, '0')}:'
                  '${(second % 60).toString().padLeft(2,'0')}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                Visibility(
                  visible: emptyText,
                  child: Text(
                    '',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 117,
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              color: Color(0xFFFFFFFF),
                              size: 40,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '0' ' KB',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  'Download',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 117,
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_upward,
                                color: Color(0xFFFFFFFF),
                                size: 40,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '0' ' KB',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    'Upload',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 135,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(18))
                            ),
                            minimumSize: Size(130.0, 80.0),
                            side: BorderSide(color: Color(0xFFF3EF08), width: 2.0),
                          ),
                          onPressed: () {}, 
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Column(
                              children: [
                                Text(
                                  '11.2' ' GB',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  'حجم باقی مانده',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ), 
                      Container(
                        width: 135,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(18))
                            ),
                            minimumSize: Size(130.0, 80.0),
                            side: BorderSide(color: Color(0xFFF3EF08), width: 2.0),
                          ),
                          onPressed: () {}, 
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Column(
                              children: [
                                Text(
                                  '21' '  ' 'روز',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffffffff),
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                Text(
                                  'زمان باقی مانده',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ), 
                    ],
                  ),
                ),
              ]
            ),
          ),
        )
      ),
    );
  }
}