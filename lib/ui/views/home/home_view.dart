import 'package:flutter/material.dart';
import 'package:food/ui/common/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Atur latar belakang transparan
        elevation: 0, // Atur shadow elevation menjadi 0
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Image.asset(
            'assets/images/menu.png',
            width: 22,
            height: 22,
            scale: 3,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              'assets/images/cart.png',
              width: 22,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/img_bg_home.png'),
                  fit: BoxFit.cover)),
          child: DefaultTabController(
            length: 5, // Jumlah tab
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Here’s what \nyou can make',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 12.0,
                    ),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEFEEEE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue: null,
                            decoration: const InputDecoration.collapsed(
                              filled: true,
                              fillColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              hintText: "Search",
                            ),
                            onFieldSubmitted: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const TabBar(
                    isScrollable: true,
                    labelStyle: TextStyle(
                      color: Color(0xFFFA4A0C),
                      fontSize: 17,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: Color(0xFF99999D),
                      fontSize: 17,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                    unselectedLabelColor: Color(0xFF99999D),
                    tabs: [
                      Tab(text: 'Food'),
                      Tab(text: 'Drinks'),
                      Tab(text: 'Snacks'),
                      Tab(text: 'Sauce'),
                      Tab(text: 'Yogurt'),
                    ],
                    labelColor: Color(0xFFFA4A0C),
                    indicatorColor: Color(0xFFFA4A0C),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const ListFoodScreen();
                          // }));
                        },
                        child: const Text(
                          'see more',
                          style: TextStyle(
                            color: Color(0xFFFA4A0C),
                            fontSize: 15,
                            fontFamily: 'SF Pro Rounded',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 300,
                    child: TabBarView(children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: ScrollController(),
                        child: Row(
                          children: List.generate(
                            dataFood.length,
                            (index) {
                              return Container(
                                height: 320,
                                width: 220,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                color: Colors.transparent,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 40,
                                      child: Container(
                                        width: 220,
                                        height: 270,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          shadows: const [
                                            BoxShadow(
                                              color: Color(0x19393939),
                                              blurRadius: 15,
                                              // offset: Offset(0, 50),
                                              // spreadRadius: 40,
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 172,
                                              child: Opacity(
                                                opacity: 0.90,
                                                child: Text(
                                                  dataFood[index]['name'],
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 22,
                                                    fontFamily:
                                                        'SF Pro Rounded',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15.0,
                                            ),
                                            Text(
                                              'USD ${dataFood[index]['price']}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Color(0xFFFA4A0C),
                                                fontSize: 17,
                                                fontFamily: 'SF Pro Rounded',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 52,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 1,
                                        left: 7,
                                        child: Image.asset(
                                          dataFood[index]['image'],
                                          scale: 3.5,
                                        )),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
