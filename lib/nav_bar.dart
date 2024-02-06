import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CommonNavigation extends StatefulWidget {
  final int initialIndex;
  final Function(int) onItemSelected;
  final VoidCallback onNavigateToDailyChallenges; 

  const CommonNavigation({
    Key? key,
    required this.initialIndex,
    required this.onItemSelected,
    required this.onNavigateToDailyChallenges,
  }) : super(key: key);

  @override
  _CommonNavigationState createState() => _CommonNavigationState();
}

class _CommonNavigationState extends State<CommonNavigation> {
  int currentIndex = 0;
  final GlobalKey<_CommonNavigationState> commonNavigationKey = GlobalKey();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      
      key: _bottomNavigationKey,
      index: currentIndex,
      height: 60.0,
      items: const <Widget>[
        Icon(
          Icons.home,
          size: 30,
          color: Colors.white,
          
        ),
        Icon(
          Icons.assignment, // Replace with your Test/Quiz icon
          size: 30,
          color: Colors.white,
        ),
        Icon(
           Icons.event,
          size: 30,
          color: Colors.white,
          
        ),
        Icon(
          Icons.group, // Replace with your Network icon
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.person,
          size: 30,
          color: Colors.white,
        ),
      ],
      onTap: (index) {
        
        setState(() {
          currentIndex = index; 
        });

        widget.onItemSelected(index);
        // Handle navigation for the home button
        if (index == 0) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else if (index == 2) {
          widget.onNavigateToDailyChallenges();
        }
         if (index == 2) {
          widget.onNavigateToDailyChallenges();
        }
      },
      color: const Color.fromARGB(70, 109, 109, 109),
      buttonBackgroundColor: const Color.fromARGB(70, 109, 109, 109),
      backgroundColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 300),
      // onTap: widget.onItemSelected,
      // letIndexChange: (index) => true,
      
    );
  }
}
