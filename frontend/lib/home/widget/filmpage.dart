import 'package:flutter/material.dart';

class Filmpage extends StatefulWidget {
  const Filmpage({super.key});

  @override
  State<Filmpage> createState() => _FilmpageState();
}

class _FilmpageState extends State<Filmpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index){
              return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white
              ),
              height: 300,
              width: 250,
              child: Text(""),
            );
            }    
            )
          ],
        ),
      ),
    );
  }
}