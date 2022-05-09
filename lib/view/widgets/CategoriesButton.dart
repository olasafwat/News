import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class CategoriesButton extends StatelessWidget {
  Color colorbuttion;
  String textButton;


  CategoriesButton({
    required this.colorbuttion,
    required this.textButton,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5,vertical: 5),
      child: RaisedButton(
        onPressed: () {  },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: colorbuttion,
        child: Text("$textButton",
          style: TextStyle(fontWeight: FontWeight.w800,color: white,fontSize: fontsubtitle),),

      ),
    );
  }


}

