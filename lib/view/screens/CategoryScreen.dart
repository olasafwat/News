import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../controller/Api.dart';
import '../../controller/functions.dart';
import '../widgets/CategoriesButton.dart';
class CategoryScreen extends StatefulWidget {
  String category;


  CategoryScreen(this.category);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundScafold,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("${widget.category} Categories",
                    style: TextStyle(
                        color: black,
                        fontSize: fontTitle)),
              ),
              Expanded(
                  child: FutureBuilder(
                    future: Api.getCategoryArticles(widget.category),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return(snapshot.hasData)
                          ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: ()
                            {
                              Functions.openLink(snapshot.data[index].url);

                            },
                            child: Card(
                              elevation:5 ,
                              color: white,
                              shadowColor: textColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover, image: NetworkImage("${snapshot.data[index].urlToImage}")),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25)),
                                      //color: Colors.redAccent,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "${snapshot.data[index].title}",
                                        style: TextStyle(fontSize: fontSubTitle),
                                        textAlign: TextAlign.center),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(onPressed: ()
                                      {
                                        Functions.shareLink("${snapshot.data[index].url}");

                                      },
                                          icon: Icon(Icons.share_outlined,size: 25)),
                                      IconButton(onPressed: ()
                                      {
                                        Functions.copyLink("${snapshot.data[index].url}",context);

                                      },
                                          icon: Icon(Icons.copy_rounded,size: 25)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },)
                          : Center(child: CircularProgressIndicator());
                    },
                  )
              )
            ],

          ),
        ),


      ),
    );
  }
}
