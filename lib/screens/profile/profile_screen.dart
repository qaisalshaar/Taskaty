import 'package:flutter/material.dart';
import 'package:taskatykais/core/hellpers/extensions.dart';
import 'package:taskatykais/screens/home/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.blue,),
          onPressed: () {
            context.push(HomeScreen());
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.wb_sunny_outlined, color: Colors.blue),
            onPressed: () {
              // Toggle light/dark mode
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 3.0,
                        ),
                      ),

                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/kaisalshaar.jpg'), // Replace with your image asset
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, size: 20, color: Colors.blue),
                        onPressed: () {
                          // Open camera/gallery
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),



            Divider(
              color: Colors.grey[300],
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kais Abdul Basit Mustafa Alshaar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 3.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.edit, size: 20, color: Colors.blue),
                        onPressed: () {
                          // Edit profile name
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}