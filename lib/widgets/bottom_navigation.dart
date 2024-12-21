// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mimone_mobile/bloc/cart/cart_bloc.dart';
// import 'package:mimone_mobile/core.dart';
// import 'package:mimone_mobile/screens/order/order_screen.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:badges/badges.dart' as badges;

// class BottomNavigation extends StatefulWidget {
//   final int index;
//   const BottomNavigation({super.key, required this.index});

//   @override
//   _BottomNavigationState createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   late PersistentTabController _controller;
//   final CartBloc _cartBloc = CartBloc();

//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     const HomeScreen(),
//     const WishlistScreen(),
//     const CartScreen(),
//     const OrderScreen(),
//     const ProfileScreen(),
//   ];

//   List<PersistentBottomNavBarItem> _navBarsItems(int cartCount) {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Column(
//           children: [
//             const SizedBox(
//               height: 7.0,
//             ),
//             SvgPicture.asset(
//               'assets/svg/home.svg',
//               width: 22,
//               height: 22,
//               color: baseColor,
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//             Container(
//               width: 50,
//               height: 6,
//               decoration: BoxDecoration(
//                 color: secondaryColor,
//               ),
//             )
//           ],
//         ),
//         inactiveIcon: Column(
//           children: [
//             const SizedBox(
//               height: 7.0,
//             ),
//             SvgPicture.asset(
//               'assets/svg/home.svg',
//               width: 22,
//               height: 22,
//               color: const Color(0xff4B5563),
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//             Container(
//               width: 50,
//               height: 6,
//               decoration: const BoxDecoration(),
//             )
//           ],
//         ),
//         activeColorPrimary: baseColor,
//         inactiveColorPrimary: const Color(0xff4B5563),
//       ),
//       PersistentBottomNavBarItem(
//         iconSize: 25,
//         icon: Column(
//           children: [
//             const SizedBox(
//               height: 7.0,
//             ),
//             const Icon(
//               Icons.favorite_outline,
//               size: 25,
//             ),
//             const SizedBox(
//               height: 5.0,
//             ),
//             Container(
//               width: 50,
//               height: 6,
//               decoration: BoxDecoration(
//                 color: secondaryColor,
//               ),
//             )
//           ],
//         ),
//         inactiveIcon: Column(
//           children: [
//             const SizedBox(
//               height: 7.0,
//             ),
//             const Icon(
//               Icons.favorite_outline,
//               color: Color.fromARGB(216, 75, 85, 99),
//               size: 25,
//             ),
//             Container(
//               width: 50,
//               height: 6,
//               decoration: const BoxDecoration(),
//             )
//           ],
//         ),
//         activeColorPrimary: baseColor,
//         inactiveColorPrimary: const Color(0xff4B5563),
//       ),
//       PersistentBottomNavBarItem(
//         icon: badges.Badge(
//           badgeContent: Text(
//             cartCount.toString(),
//             style: white10,
//           ),
//           position: badges.BadgePosition.topEnd(top: 0, end: 2),
//           child: Container(
//             width: 66,
//             height: 66,
//             decoration: const BoxDecoration(
//               color: Color(0xffA270C6),
//               shape: BoxShape.circle,
//             ),
//             child: Image.asset(
//               'assets/icons/ic_cart.png',
//               scale: 3,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         inactiveIcon: badges.Badge(
//           badgeContent: Text(
//             cartCount.toString(),
//             style: white10,
//           ),
//           position: badges.BadgePosition.topEnd(top: 0, end: 2),
//           child: Container(
//             width: 66,
//             height: 66,
//             decoration: const BoxDecoration(
//               color: Color(0xffA270C6),
//               shape: BoxShape.circle,
//             ),
//             child: Image.asset(
//               'assets/icons/ic_cart.png',
//               scale: 3,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         activeColorPrimary: Colors.white,
//         inactiveColorPrimary: const Color(0xff4B5563),
//       ),
//       PersistentBottomNavBarItem(
//         icon: Column(
//           children: [
//             const SizedBox(
//               height: 7.0,
//             ),
//             SvgPicture.asset(
//               'assets/svg/transaction.svg',
//               width: 29,
//               height: 29,
//               color: baseColor,
//             ),
//             Container(
//               width: 50,
//               height: 6,
//               decoration: BoxDecoration(
//                 color: secondaryColor,
//               ),
//             )
//           ],
//         ),
//         inactiveIcon: Column(
//           children: [
//             const SizedBox(
//               height: 7.0,
//             ),
//             SvgPicture.asset(
//               'assets/svg/transaction.svg',
//               width: 29,
//               height: 29,
//               color: const Color(0xff7D8998),
//             ),
//             Container(
//               width: 50,
//               height: 6,
//               decoration: const BoxDecoration(),
//             )
//           ],
//         ),
//         activeColorPrimary: baseColor,
//         inactiveColorPrimary: const Color(0xff4B5563),
//       ),
//       PersistentBottomNavBarItem(
//         iconSize: 25,
//         icon: Column(
//           children: [
//             const SizedBox(
//               height: 7.0,
//             ),
//             SvgPicture.asset(
//               'assets/svg/person.svg',
//               width: 30,
//               height: 30,
//               color: baseColor,
//             ),
//             Container(
//               width: 50,
//               height: 6,
//               decoration: BoxDecoration(
//                 color: secondaryColor,
//               ),
//             )
//           ],
//         ),
//         inactiveIcon: Column(
//           children: [
//             const SizedBox(
//               height: 7.0,
//             ),
//             SvgPicture.asset(
//               'assets/svg/person.svg',
//               width: 30,
//               height: 30,
//               color: const Color(0xff7D8998),
//             ),
//             Container(
//               width: 50,
//               height: 6,
//               decoration: const BoxDecoration(),
//             )
//           ],
//         ),
//         activeColorPrimary: baseColor,
//         inactiveColorPrimary: const Color(0xff4B5563),
//       ),
//     ];
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: widget.index);
//     _currentIndex = widget.index;
//     _cartBloc.add(GetListCartEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(children: [
//         Visibility(visible: true, child: _children.elementAt(_currentIndex))
//       ]),
//       bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
//         bloc: _cartBloc,
//         builder: (context, state) {
//           int cartItemCount = 0;

//           if (state is GetListCartSuccess) {
//             if (state.data.data!.isNotEmpty) {
//               cartItemCount = state.data.data!.length;
//             }
//           }
//           return PersistentTabView(
//             context,
//             controller: _controller,
//             onItemSelected: (value) {
//               setState(() {
//                 _currentIndex = value;
//                 if (_currentIndex == 2) {
//                   // _distanceBloc.add(GetDistanceEvent(
//                   //     _currentPosition?.longitude,
//                   //     _currentPosition?.latitude));
//                 }

//                 log("indexes");
//               });
//             },
//             screens: _children,
//             items: _navBarsItems(cartItemCount),
//             confineInSafeArea: true,
//             navBarHeight: 59,
//             // bottomScreenMargin: 20,
//             backgroundColor: Colors.white,
//             handleAndroidBackButtonPress: true, // Default is true.
//             resizeToAvoidBottomInset:
//                 true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//             stateManagement: true, // Default is true.
//             hideNavigationBarWhenKeyboardShows:
//                 true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//             decoration: NavBarDecoration(
//                 borderRadius: BorderRadius.circular(2.0),
//                 colorBehindNavBar: const Color(0xff000000),
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.4),
//                     blurRadius: 12,
//                   ),
//                 ]),
//             popAllScreensOnTapOfSelectedTab: true,
//             popActionScreens: PopActionScreensType.all,
//             itemAnimationProperties: const ItemAnimationProperties(
//               duration: Duration(milliseconds: 200),
//               curve: Curves.ease,
//             ),
//             screenTransitionAnimation: const ScreenTransitionAnimation(
//               // Screen transition animation on change of selected tab.
//               animateTabTransition: true,
//               curve: Curves.ease,
//               duration: Duration(milliseconds: 200),
//             ),
//             navBarStyle: NavBarStyle
//                 .style15, // Choose the nav bar style with this property.
//           );
//         },
//       ),
//     );
//   }
// }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return PersistentTabView.custom(
// //       context,
// //       controller: _controller,
// //       itemCount: items
// //           .length, // This is required in case of custom style! Pass the number of items for the nav bar.
// //       screens: _buildScreens(),
// //       confineInSafeArea: true,
// //       handleAndroidBackButtonPress: true,
// //       onItemSelected: (int) {
// //         setState(
// //             () {}); // This is required to update the nav bar if Android back button is pressed
// //       },
// //       customWidget: CustomNavBarWidget(
// //         // Your custom widget goes here
// //         items: _navBarsItems(),
// //         selectedIndex: _controller.index,
// //         onItemSelected: (index) {
// //           setState(() {
// //             _controller.index =
// //                 index; // NOTE: THIS IS CRITICAL!! Don't miss it!
// //           });
// //         },
// //       ),
// //     );
// //   }
// // }
