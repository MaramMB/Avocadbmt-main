import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/face.dart';
import 'package:flutter_application_1/pages/rowbar.dart';
import 'package:flutter_application_1/pages/speaktest.dart';
import 'mainpage.dart';
import 'manag.dart';

const blak = Color.fromRGBO(55, 53, 53, 1);
const gren = Color.fromRGBO(129, 188, 95, 1);
const backgreen = Color.fromRGBO(131, 190, 99, 1);
int _value = 1;
class dic extends StatefulWidget {
  const dic({Key? key}) : super(key: key);

  @override
  State<dic> createState() => _dicState();
}

class _dicState extends State<dic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgreen,
      body: Scrollbar(
        thickness: 10,
        isAlwaysShown: true,
        radius: const Radius.circular(10),
        child: Column(
          children: [
            const SelectionButton(),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.15,
              width: MediaQuery.of(context).size.width / 1.8,
              decoration: const BoxDecoration(
                // color: Color(0x6BFFFFFF),
                gradient:LinearGradient(
                  colors: [
                    Color(0x6BFFFFFF),
                    Color(0x5FC3FFC3),
                    Color(0xA65D86A6),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Text("قاموس لغة الاشارة",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "DroidKufi",
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        )),
                    const SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://th.bing.com/th/id/R.db231c306768c9dbcab2738f415b63c8?rik=oXeq45cxP9s2KQ&pid=ImgRaw&r=0",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 11,
                                  height: MediaQuery.of(context).size.height /6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x34E7E4E4),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("الملابس",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://thumbs.dreamstime.com/z/set-mexicantraditional-food-taco-burrito-guacamole-nachos-avocado-cactus-red-hot-pepper-flat-textured-cartoon-illustration-181782140.jpg",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                            Container(
                              width: MediaQuery.of(context).size.width / 11,
                              height: MediaQuery.of(context).size.height /6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0x34E7E4E4),
                              ),
                            ),
                              ],
                            ),
                            const SizedBox(height: 6,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("المأكولات",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                    // SizedBox(height: 17,),
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://static.vecteezy.com/system/resources/previews/002/745/697/large_2x/avocado-juice-box-with-avocado-icon-free-vector.jpg",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 11,
                                  height: MediaQuery.of(context).size.height /6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x34E7E4E4),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("المشروبات",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://3.bp.blogspot.com/-SRSqbqqupR8/Uad6nDVeaWI/AAAAAAAAABc/JJz8IkjsslI/s1600/giza2o+gina.jpg",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 11,
                                  height: MediaQuery.of(context).size.height /6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x34E7E4E4),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("المنزل",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://s2.dmcdn.net/v/IgQx-1VtHN0bbzMgx/x720",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 11,
                                  height: MediaQuery.of(context).size.height /6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x34E7E4E4),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("المواصلات",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                        // SizedBox(height: 17,),
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://s2.dmcdn.net/v/IgQx-1VtHN0bbzMgx/x720",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 11,
                                  height: MediaQuery.of(context).size.height /6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x34E7E4E4),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("الألوان",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("data:image/jpeg;base64,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GHhLiCio42xRU9krIoI4xgNjigOGgDuCsZ+B7fUcLxcNTVtXL0MhqYa6bD5o6ouc7WGE407kac8jzz6yxTeEOPaunbarrxeXWZrBE9tJABVzwjbo5JXNDsEbHL3d4KAwtdJLH5ILcICdEnQRzlvUw18jiDjvAB9q6faWUUdrtDKPQaRtDSCmMeNLouibpLcdvNa9w9wlLbrBdOHbvUQ19BPU1QphG17C2ll0uAdnk7VlwxnB6z1YWPgTjO3sfb7RxjPT2hzn6I5I5OmgY4kkRlhwD1nS5m/UMoCTgw6OKPKx0TWl7a+N0bW4wXCWrOMDv5qjyTRQOtF5uDyH19VdpWVUjv6QtZFHI1rjz5ucff3LL8J8FN4VrbrURXGSqhrYKaMRyxBjxJGdT3vcCQcnOnbkd84ycZXcC8Q0Vyr6/hG+C2RXF5kq6SUPETXklxMehrhjc6QWjGTg45AKQM/1rXfzbGPQTTX6OWvTBjVjr+YuibrWOFOFIuHI66eeqkrrtcZOlr62XVqecl2husl2MkkknJO55AN2dAe7ovEQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQDxTxXzD6Wvf2pc/vtV+dPS962PpW5YPI+fVOD++peX6mMn094p4r5h9LXv7Uuf32p/Onpa98/Sly3/APvan86csZPp7xTxXzCbvehjN1uIz211SP8AGnpe9/aly5/77U/nTl+oyfTyL5iN2vQ53W5e+tqR/jT0te9//FLntjP+21X505fqMn074ovmH0te/tS5/fan86elr39qXP77U/nTljJ9PeKL5h9LXv7Uuf32p/OvfS17+1Ln99qfzpyxk+nfFF8w+lr39qXP77U/nT0te/tS5/fan86csZPp7xTxXzD6Wvf2pc/vtT+dPS17+1Ln99qfzpyxk+nk8V8w+lr39qXP77U/nT0te/tS5/fan86cv1GT6eTxXzD6Wvf2pc/vtT+dPS17+1Ln99qfzpyxk+nvFF8w+lr39qXP77U/nT0te/tS5/fan86csZPp7xRfMPpa9/alz++1P5176Wvf2pc/vtT+dOWMn074ovmH0te/tS5/fan86elr39qXP77U/nTljJ9PeKL5h9LXv7Uuf32p/Onpe9/alz++1P505YyfTyeK+YfS97+1Ln99qfzp6Wvf2pc/vtT+dOWMn094p4r5h9LXv7Uuf32p/Onpa9/alz++1X505YyfT3inivmH0te/tS5ffan86elr39qXP77U/nTljJ9PeKL5h9LXv7Uuf32q/OictjJZEAgg9Yx4rZaaCjqRDXTaB6UpTQtjGn162liLqhoawhw6QsiGxGenIBydtbIIJB5gkEezZeY7h39/tUjRgzlbQwRxVL6W3TSy8qmOWOrjNAwU7JOljhMnSBriXkOeSPUxj611XUVJLV1cjaKPoJqi5yVVXFJK2OgaxzzCWAP6MBzdEnrA6+kw3GNtZx3BMDsHgmAbvZ4g6e9UFHQTUlIbm+mNzpxSVcFO2NnRFtybcA7VCPnn12DJOMkACk22kq/MpYrTBcJW2zhiCCKGrlp46qmdAYqyuJZI05jewRn5obnU5p5nScDrA8AvcA8wD7QCsaQbvRWu2U1baDRwMq7c99yE96c902l7Y66PzdsGsQAhrWuaCzLjuCA8AYG76aGWpt1JDHHbpm0lTSSCR8zqqnMYMdUZHY9aTm4BrcHLcDThYbA54HgERLACIi2AREQBERAEREAREQBERAEREAREQBZSgtcVdFE4VkUMslSaQNmLQBLpMwdpHrlpYHAbbuwPpLFp7ggMwyxyP0AVtOXO6BzdDHOa9sgmceicXAuI0huMD1nY2xvI2xx6KlproXzQ9GS+EtNJ69O6dsbHuw57ycN2xjOfWwQzB4HYPAJgdg8FjDBnI+Hnul6OS4UbWlpBkafUjcYnva6YuPqscQNB31A5AGdreCzTzsa8zwxEmoy2UHLOicGYec4DjnWR1MBdk4wsXgdg8AmB2DwCzhgzElkEQc43ClmDNbZW02dYfl0TAwy4aQXgNz2HPLlcPsNI2ZkbqySFnT1UMrqjzdoa6KkinDInlwa4lznNzgAhuRk7HX8DsHgmB2Ds5BYwwbDHYKNzYulrZYJXR0D3tmEJjzUP0lkUrfVc4jcAciCDq6pGcOUTnuBubeja+vBeHQAjoHuZGzS7mcDVIQcAEbDVkazgdg6+oJgdjfAJhg9HIezKIASQBzJAHtOyLYH/2Q==",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 11,
                                  height: MediaQuery.of(context).size.height /6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x34E7E4E4),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("الحروف",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://th.bing.com/th/id/OIP.DLnykqIPveuY4thHXAUBNAHaJi?w=168&h=217&c=7&r=0&o=5&dpr=1.5&pid=1.7",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 11,
                                  height: MediaQuery.of(context).size.height /6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x34E7E4E4),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("الأرقام",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://s2.dmcdn.net/v/IgQx-1VtHN0bbzMgx/x720",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 11,
                                  height: MediaQuery.of(context).size.height /6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x34E7E4E4),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("العائلة",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://s2.dmcdn.net/v/IgQx-1VtHN0bbzMgx/x720",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 11,
                                  height: MediaQuery.of(context).size.height /6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x34E7E4E4),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("المهن",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                        // SizedBox(height: 17,),
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://s2.dmcdn.net/v/IgQx-1VtHN0bbzMgx/x720",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 11,
                                  height: MediaQuery.of(context).size.height /6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x34E7E4E4),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("الطبيعة",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child:Image.network("https://s2.dmcdn.net/v/IgQx-1VtHN0bbzMgx/x720",
                                      width: MediaQuery.of(context).size.width / 11,
                                      height: MediaQuery.of(context).size.height /6,
                                      fit: BoxFit.fill,
                                    )
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 11,
                                  height: MediaQuery.of(context).size.height /6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0x34E7E4E4),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return const letterss();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                                elevation: 2.0,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                              ),
                              child: const Text("حيوانات",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "DroidKufi",
                                    fontSize: 18.0,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
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
