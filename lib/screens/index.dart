import 'package:flutter/material.dart';
import '../styles/color.dart';
import 'home_page.dart';
import 'cinema_page.dart';
import 'ticket_page.dart';
import 'fb_page.dart';
import 'profile_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController(initialPage: _currentIndex);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        // physics: _currentIndex == 2
        //     ? const NeverScrollableScrollPhysics()
        //     : const PageScrollPhysics(),
        children: [
          HomePage(),
          CinemaPage(),
          TicketPage(),
          FbPage(),
          ProfilePage(),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: 'Cinema',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'My Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_cafe),
            label: 'F&B',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: MyColors.primary,
        unselectedItemColor: MyColors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
