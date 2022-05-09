import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

import '../widgets/CategoriesButton.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Choose News Categories",
                  style: TextStyle(
                      color: black,
                      fontSize: fontxlarge)),
              ),
              Container(
                height: MediaQuery.of(context).size.height/14,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                   CategoriesButton(textButton: 'General',colorbuttion: red),
                   CategoriesButton(textButton: 'Entertainment',colorbuttion: lightblue),
                   CategoriesButton(textButton: 'Busniess',colorbuttion: yellow),
                   CategoriesButton(textButton: 'Health',colorbuttion: brown),
                   CategoriesButton(textButton: 'Science',colorbuttion: orange),
                   CategoriesButton(textButton: 'Technology',colorbuttion: lightgreen),

                  ],
                ),
              )
            ],

          ),
        ),


      ),
    );
  }
}
