import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/Api.dart';
import '../../controller/functions.dart';
import '../widgets/CategoriesButton.dart';
import 'package:share_plus/share_plus.dart';
class HomeScreen extends StatefulWidget {
/*  String TextCard;
  String ImageCard;


  HomeScreen(this.TextCard, this.ImageCard);*/

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                child: Text("Choose News Categories",
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontTitle,
                      decoration: TextDecoration.none,
                      decorationColor: Colors.red,
                    )),
              ),
              Container(
                height: MediaQuery.of(context).size.height/14,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                   CategoriesButton(textButton: 'General',colorbuttion: colorGeneral),
                   CategoriesButton(textButton: 'Entertainment',colorbuttion: colorEntertainment),
                   CategoriesButton(textButton: 'Business',colorbuttion: colorBusiness),
                   CategoriesButton(textButton: 'Health',colorbuttion: colorHealth),
                   CategoriesButton(textButton: 'Science',colorbuttion: colorScience),
                   CategoriesButton(textButton: 'Sports',colorbuttion: colorSports),
                   CategoriesButton(textButton: 'Technology',colorbuttion: colorTechnology),

                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: Api.getArticles(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return(snapshot.hasData)
                          ?ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async
                        {
                          Functions.openLink(snapshot.data[index].url);

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Card(
                            elevation:5 ,
                            color: colorCard,
                            shadowColor: textColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            ('${snapshot.data[index].urlToImage}' == 'null')
                                                ?"https://www.google.com.eg/search?q=image+not+found+png&tbm=isch&ved=2ahUKEwj8gJ3Yp-b3AhWOVPEDHW_3BGUQ2-cCegQIABAA&oq=image+not+found+&gs_lcp=CgNpbWcQARgAMgQIABBDMgQIABBDMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgARQkQJYkQJgrQpoAHAAeACAAYMBiAH9AZIBAzAuMpgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=xHaDYvyOPI6pxc8P7-6TqAY&bih=754&biw=1536&hl=en#imgrc=ZhsHZdwRcvHOnM"
                                                :'${snapshot.data[index].urlToImage}')),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25)),
                                    //color: Colors.redAccent,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,right:20,top: 10),
                                  child: Text(
                                      "${snapshot.data[index].title}",
                                      style: TextStyle(fontSize: fontSubTitle,color: textColor),
                                      textAlign: TextAlign.center),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5.0),
                                      child: IconButton(onPressed: (){
                                        Functions.shareLink("${snapshot.data[index].url}");
                                      },
                                          icon: Icon(Icons.share_outlined,size: 25)),
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5.0),
                                      child: IconButton(onPressed: (){
                                        Functions.copyLink("${snapshot.data[index].url}", context);
                                      },
                                          icon: Icon(Icons.copy_rounded,size: 25)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },)
                          :Center(child: CircularProgressIndicator());
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
