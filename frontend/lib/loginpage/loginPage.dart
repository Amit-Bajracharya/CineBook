import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 500,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              TextField(
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hint: Text('Enter your user name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hint: Text('Enter your email'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.security),
                  hint: Text('Enter your password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hint: Text('Enter your Phone Number'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
