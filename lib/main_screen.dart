import 'package:ferrater_navigation_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'calculator_screen.dart';
import 'profile_page.dart';
// import 'social_media_page.dart';

import 'demo_auth.dart';
import 'social_media/social_media.dart';
 
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
 
  @override
  State<MainScreen> createState() => _MainScreenState();
}
 
class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
 
  late final List<Widget> pages;
  
  @override
  void initState() {
    super.initState();
  
    pages = [
      const HomePage(),
      const CalculatorScreen(),
      const ProfilePage(),
      SocialMediaPage(
        username: DemoAuth.currentUsername!,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.token_outlined),
        title: const Text('Welcome User'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              DemoAuth.logout();

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),


      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate_outlined),
            selectedIcon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.share_outlined),
            selectedIcon: Icon(Icons.share),
            label: 'Social Media',
          ),
          
        ],
      ),
    );
  }
}