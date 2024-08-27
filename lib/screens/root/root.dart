import 'package:clothingstore/components/colors.dart';
import 'package:clothingstore/components/strings.dart';
import 'package:clothingstore/screens/basket/bascket.dart';
import 'package:clothingstore/screens/home/home.dart';
import 'package:clothingstore/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> basketKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> profileKey = GlobalKey<NavigatorState>();

class _RootScreenState extends State<RootScreen> {
  int navState = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // !body
      body: IndexedStack(
        index: navState,
        children: [
          Navigator(
            key: homeKey,
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (context) => const HomeScreen()),
          ),
          Navigator(
            key: basketKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => const BasketScreen(),
            ),
          ),
          Navigator(
            key: profileKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => const ProfileScreen()),
          ),

          // const HomeScreen(),
        ],
      ),

      //  !BNB
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.kPrimary500,
        currentIndex: navState,
        elevation: 10,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        onTap: (value) {
          setState(() {
            navState = value;
            switch (navState) {
              case 0:
                debugPrint("0");
                break;
              case 1:
                debugPrint("1");
                break;
              case 2:
                debugPrint("2");
                break;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: AppStrings.buttonNavigationHomeLabel,
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: AppStrings.buttonNavigationBasketLabel,
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: AppStrings.buttonNavigationProfileLabel,
            icon: Icon(Icons.person_outline),
          )
        ],
      ),
    );
  }
}
