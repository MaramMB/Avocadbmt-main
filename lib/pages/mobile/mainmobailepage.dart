import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/expl.dart';
import 'package:flutter_application_1/pages/mobile/mobileprofile.dart';
const backgreen = Color.fromRGBO(131, 190, 99, 1);
class mainmobile extends StatelessWidget {
  const mainmobile({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff2F8D46),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const mobile(),
    );
  }
}

class mobile extends StatefulWidget {
  const mobile({Key? key}) : super(key: key);

  @override
  _mobileState createState() => _mobileState();
}

class _mobileState extends State<mobile> {
  int pageIndex = 0;

  final pages = [
    const Page1(),
    const Page2(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
  Container buildMyNavBar(BuildContext context) {
    return Container(
      // height: 70,
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor,
        color: Colors.white70,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              enableFeedback: false,
              // onPressed: _openEndDrawer,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const mobileprofile();
                }));
                // setState(() {
                //   pageIndex = 2;
                //   // Page2();
                // });
              },
              icon: pageIndex == 2
                  ? const Icon(
                Icons.person,
                color: Colors.black,
                size: 45,
              )
                  : const Icon(
                Icons.person_outline,
                color: Colors.black,
                size: 45,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                Icons.home_filled,
                color: Colors.black,
                size: 45,
              )
                  : const Icon(
                Icons.home_outlined,
                color: Colors.black,
                size: 45,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.menu_rounded,
                color: Colors.black,
                size: 45,
              )
                  : const Icon(
                Icons.menu_outlined,
                color: Colors.black,
                size: 45,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: const Text(
              "الرئيسية",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "DroidKufi",
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              // child: Stack(
              //
              // ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("قائمة التدريبات",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                          const Text(
                              "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                              style: TextStyle(fontFamily: "DroidKufi")),
                          const Text(
                              "تحتوي هده الواجهة على ثلاثة انواع من التدريبات التدريبات الحركية والنطقية والسمعية",
                              style: TextStyle(fontFamily: "DroidKufi")),

                          const Text("قائمة التدريبات",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                          const Text(
                              "تحتوي هده الواجهة على ثلاثة انواع من ",
                              style: TextStyle(fontFamily: "DroidKufi")),
                          const Text(
                              "التدريبات التدريبات الحركية والنطقية والسمعية",
                              style: TextStyle(fontFamily: "DroidKufi")),
                          const Text(
                              "تحتوي هده الواجهة على ثلاثة انواع من ",
                              style: TextStyle(fontFamily: "DroidKufi")),
                          const Text("قائمة التدريبات",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontFamily: "DroidKufi",
                                  fontWeight: FontWeight.w700)),
                          const Text(
                              "تحتوي هده الواجهة على ثلاثة",
                              style: TextStyle(fontFamily: "DroidKufi")),
                          const Text(
                              "انواع من التدريبات التدريبات",
                              style: TextStyle(fontFamily: "DroidKufi")),
                          const Text(
                              "الحركية والنطقية والسمعية",
                              style: TextStyle(fontFamily: "DroidKufi")),
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return  expage(); // لازم الاي دي هون يتغير حسب الحساب الداخل
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                alignment: Alignment.bottomCenter,
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 12),
                              ),
                              child: const Text("بدأ الاختبار الاولي للنطق",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 16.0,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(alignment: Alignment.bottomLeft, children: [
                      Image.asset("img/boytalk.png",
                          alignment: Alignment.bottomLeft,
                          height: MediaQuery.of(context).size.height / 2.3)
                    ]),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.grey.shade500
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                    radius: 40.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Tom Cruise',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25.0
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text('tomcruise@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14.0
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Here you place your menu items
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate

              },
            ),
            Divider(height: 3.0),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate

              },
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Close Drawer', style: TextStyle(fontSize: 18)),
              onTap: () {
                // Here you can give your route to navigate
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}



