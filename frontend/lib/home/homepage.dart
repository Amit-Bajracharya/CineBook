import 'package:cinebooknew/home/widget/UserPage.dart';
import 'package:cinebooknew/home/widget/filmpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  List<Widget> _widget = [Filmpage(), Userpage()];

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(15),
        leading: Icon(Icons.list),
        actions: [
          Icon(Icons.search),
          const SizedBox(width: 10),
          Icon(Icons.person),
        ],
        title: Center(
          child: Text(
            "Cine Book",
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.amber, fontSize: 26),
          ),
        ),
      ),
      body: Container(child: _widget[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movie"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
        ],
      ),
    );
  }
}
