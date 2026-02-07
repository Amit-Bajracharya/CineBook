import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(15),
        leading: Icon(Icons.list),
        actions: [
          Icon(Icons.search),
          const SizedBox(width: 10),
          Icon(Icons.person)
        ],
        title: Center(
          child: Text("Cine Book",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.amber,
            fontSize: 26
          ),
          ),
        ),
      ),
bottomNavigationBar: BottomAppBar(

),
    );
  }
}